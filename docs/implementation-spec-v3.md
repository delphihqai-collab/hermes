# Command Center — Implementation Spec V3

**Version:** 3.0  
**Status:** ACTIVE  
**Supersedes:** implementation-spec-v2.md  
**Date:** 2026-03-05  
**Prepared by:** HERMES (Full Engineering Team Perspective)

> This document is the authoritative engineering specification for Command Center V3. It incorporates V2 verification findings, mission-control architecture patterns, and full-stack engineering standards across product, frontend, backend, DevOps, design, and QA. Claude Code and GitHub Copilot must implement exactly as specified here.

---

## 0. V2 Audit — What Was Built, What Needs Fixing

### 0.1 Page-by-Page Status

| Page/Feature | Status | Notes |
|---|---|---|
| **Dashboard** | ✅ COMPLETE | KPI cards, funnel chart, agent grid, activity feed all working. Suspense boundaries in place. |
| **Pipeline** | ✅ COMPLETE | Stage tabs, stall detection (>5d), quick advance, lead detail sheet all functional. Transition validation via DB trigger. |
| **Approvals** | ✅ COMPLETE | Card layout, approve/reject buttons with optimistic UI, auto-refresh 60s. Server actions verified. |
| **Knowledge** | ✅ COMPLETE | Search with URL params, server-side filtering across 4 fields, card layout with outcome badge. |
| **Agents** | ✅ COMPLETE | Grid layout with status badges, type, model display. Read-only listing. |
| **Settings** | ✅ COMPLETE | Account info, agents overview, system version, danger zone with sign-out confirmation. |
| **Clients** | ❌ MISSING | Schema exists, no UI implementation. No list, detail, or create pages. |
| **Proposals** | ❌ MISSING | Schema exists, no UI implementation. No list, detail, or create pages. |
| **Invoices** | ❌ MISSING | Schema exists, no UI implementation. No list, detail pages. |
| **Server Actions** | ✅ COMPLETE | advanceLeadStage, approveAction, rejectAction all implemented with auth & revalidation. |
| **Database Schema** | ✅ COMPLETE | 13 tables across 3 migrations. RLS policies, indexes, soft-delete, stage transitions all in place. |

### 0.2 Critical Fixes Required Before V3 Features

**P0 Issues (blocking):**

1. **Missing Clients/Proposals/Invoices Pages** — Three critical commercial pages have schema but no UI
2. **No Toast Notifications** — Users don't see success/error feedback after actions
3. **No Pagination UI** — Knowledge list can grow unbounded, no "Load More"
4. **No Approval Notes Field** — Decision audit trail incomplete

### 0.3 Technical Debt

1. **Agent logs unbounded growth** — No archival policy (>90 days old)
2. **Knowledge search limited** — Only 4 fields, should include MEDDIC + objections
3. **Lead detail sheet read-only** — Should allow write actions (advance, archive)
4. **No audit trail for approvals** — Decision notes not captured

---

## 1. Product Vision & Commercial Priorities

### 1.1 What Command Center Must Achieve

Command Center is the **single source of truth for commercial execution**. Every decision — lead qualification, proposal approval, deal closure, client health, invoice payment — flows through this system. V3 adds **reliability, automation, and transparency** via webhooks for integrations, background jobs for stall detection and renewals, and enhanced approval workflows. Result: faster deals, fewer dropped opportunities, confident forecasting.

### 1.2 V3 Feature Priority Matrix

| Feature | Business Value | Effort | Phase |
|---|---|---|---|
| **Clients/Proposals/Invoices Pages** | CRITICAL | 3h | P0 |
| **Toast Notifications** | CRITICAL | 1h | P0 |
| **Pagination** | HIGH | 4h | P1 |
| **Webhook System** | HIGH | 8h | P2 |
| **Background Scheduler** | HIGH | 6h | P2 |
| **Real-Time Updates** | MEDIUM | 10h | P3 |
| **Audit Logging** | MEDIUM | 3h | P3 |
| **RBAC** | LOW | 4h | Post-V3 |

---

## 2. Database Architecture (Backend Senior Dev)

### 2.1 New Tables for V3

#### webhooks table
```sql
create table public.webhooks (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  url text not null,
  event_types text[] not null default '{}'::text[],
  secret_key text not null unique,
  is_active boolean default true,
  max_retries integer default 5,
  circuit_breaker_status text default 'healthy' check (circuit_breaker_status in ('healthy', 'degraded', 'failing', 'broken')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create trigger webhooks_updated_at before update on public.webhooks for each row execute function public.handle_updated_at();
alter table public.webhooks enable row level security;
create index idx_webhooks_active on public.webhooks(is_active) where is_active = true;
```

#### webhook_deliveries table
```sql
create table public.webhook_deliveries (
  id uuid primary key default gen_random_uuid(),
  webhook_id uuid not null references public.webhooks(id) on delete cascade,
  event_type text not null,
  event_id uuid not null,
  payload jsonb not null,
  http_status integer,
  error_message text,
  attempt_number integer default 1,
  next_retry_at timestamptz,
  delivered_at timestamptz,
  created_at timestamptz not null default now()
);

alter table public.webhook_deliveries enable row level security;
create index idx_webhook_deliveries_next_retry on public.webhook_deliveries(next_retry_at) where delivered_at is null;
```

#### activity_events table (for real-time feed)
```sql
create table public.activity_events (
  id uuid primary key default gen_random_uuid(),
  event_type text not null check (event_type in ('proposal_sent', 'proposal_opened', 'deal_closed', 'deal_won', 'deal_lost', 'approval_needed', 'approval_approved', 'approval_rejected', 'invoice_created', 'invoice_paid', 'lead_advanced', 'client_created')),
  entity_type text not null,
  entity_id uuid not null,
  actor_id uuid references auth.users(id),
  actor_email text,
  metadata jsonb,
  created_at timestamptz not null default now()
);

alter table public.activity_events enable row level security;
create index idx_activity_events_created_at on public.activity_events(created_at desc);
create index idx_activity_events_entity on public.activity_events(entity_type, entity_id);
```

### 2.2 Missing Fields to Add

```sql
-- Approval notes for audit trail
alter table public.approvals add column if not exists approval_notes text;

-- Lead stage change reason
alter table public.lead_stage_history add column if not exists reason text;
```

### 2.3 Index Improvements

```sql
-- Fix lead activity index to exclude archives
drop index if exists idx_leads_last_activity;
create index idx_leads_last_activity on public.leads(last_activity_at desc) where archived_at is null;

-- Add missing indexes for performance
create index if not exists idx_approvals_pending_urgency on public.approvals(status, urgency) where status = 'pending';
create index if not exists idx_invoices_due_date on public.invoices(due_date) where status != 'paid';
```

---

## 3. Frontend Architecture (Frontend Senior Dev)

### 3.1 Component Hierarchy (Server vs Client)

```
Dashboard
├─ KPICards [SERVER]
├─ PipelineFunnelChart [CLIENT] → Recharts
├─ AgentGrid [SERVER]
└─ ActivityFeed [SERVER]

Pipeline
├─ StageFilterTabs [CLIENT] → URL params
├─ PipelineTable [SERVER]
├─ QuickAdvanceButton [CLIENT] → server action
└─ LeadDetailSheet [CLIENT]

Approvals
├─ ApprovalsList [SERVER]
├─ ApprovalActions [CLIENT] → approve/reject + toast
└─ AutoRefresh [CLIENT] → 60s interval

Clients [NEW]
├─ ClientList [SERVER]
└─ ClientDetail [SERVER]

Proposals [NEW]
├─ ProposalList [SERVER]
└─ ProposalTimeline [CLIENT] → Recharts

Invoices [NEW]
├─ InvoiceList [SERVER]
└─ InvoiceDetail [SERVER]
```

### 3.2 Forms & Validation

All forms use Zod schemas in `src/lib/schemas.ts`:

```typescript
export const CreateClientSchema = z.object({
  company_name: z.string().min(1),
  industry: z.string().min(1),
  monthly_value: z.number().min(0),
});

export const CreateProposalSchema = z.object({
  lead_id: z.string().uuid(),
  value: z.number().min(1),
  probability: z.number().min(0).max(100),
});

export const CreateInvoiceSchema = z.object({
  client_id: z.string().uuid(),
  amount: z.number().min(1),
  due_date: z.coerce.date(),
});
```

### 3.3 Error Handling & Toast

All server actions return `ServerActionResult<T>`. Client wraps with toast:

```typescript
const result = await approveAction(id);
if (result.success) {
  toast.success("Approved ✓");
  router.refresh();
} else {
  toast.error(result.error);
}
```

---

## 4. Server Actions Pattern (Backend Senior Dev)

### 4.1 Standard Return Type

```typescript
export type ServerActionResult<T = void> =
  | { success: true; data?: T }
  | { success: false; error: string; code?: string };
```

### 4.2 Auth Helper

```typescript
async function verifyAuth() {
  const supabase = await createClient();
  const { data: { user }, error } = await supabase.auth.getUser();
  if (error || !user) throw new Error("Unauthorized");
  return { supabase, user };
}
```

### 4.3 All Server Actions Needed for V3

**Phase P0 (Week 1):**
- `advanceLeadStage(leadId, toStage)` ✅ (exists)
- `approveAction(approvalId)` ✅ (exists)
- `rejectAction(approvalId)` ✅ (exists)
- `createClient(data)` (new)
- `createProposal(data)` (new)
- `createInvoice(data)` (new)

**Phase P1 (Week 2):**
- `createWebhook(data)` (new)
- `testWebhook(webhookId)` (new)
- `deleteWebhook(webhookId)` (new)

**Phase P2 (Week 3):**
- Background jobs: stall detection, renewal reminders
- Audit logging helper function

---

## 5. Design System (Designer)

### 5.1 Color Tokens (Dark Theme)

```
Background:      zinc-950
Card:            zinc-900
Border:          zinc-800
Text Primary:    zinc-50
Text Secondary:  zinc-400
Text Tertiary:   zinc-500
Success:         emerald-400
Warning:         amber-400
Error:           red-500
Info:            indigo-400
```

### 5.2 Spacing

- Card padding: `p-4`
- Gap between items: `gap-4`
- Section spacing: `space-y-6`
- Grid: `grid-cols-2 lg:grid-cols-4`

### 5.3 Component Patterns

**Card:**
```tsx
<Card className="border-zinc-800 bg-zinc-900">
  <CardContent className="p-4">Content</CardContent>
</Card>
```

**Table:**
```tsx
<div className="rounded-lg border border-zinc-800 bg-zinc-900">
  <Table>...</Table>
</div>
```

**Badge:**
```tsx
<StatusBadge status="healthy" />
<Badge className="bg-red-500">Overdue</Badge>
```

### 5.4 Loading & Empty States

**Suspense fallbacks:**
```tsx
<Suspense fallback={<Skeleton className="h-40" />}>
  <KPICards />
</Suspense>
```

**Empty state pattern:**
```tsx
{items.length === 0 ? (
  <Card className="border-zinc-800 bg-zinc-900">
    <CardContent className="p-8 text-center">
      <Icon className="h-8 w-8 text-zinc-600 mx-auto" />
      <h3 className="text-sm font-medium text-zinc-50 mt-2">No items</h3>
      <p className="text-xs text-zinc-500">Create one to get started</p>
    </CardContent>
  </Card>
) : (
  // render items
)}
```

---

## 6. DevOps & Deployment (DevOps Specialist)

### 6.1 Build & Deploy

```bash
# Build
npm run build

# Verify
npx tsc --noEmit --skipLibCheck

# Deploy
systemctl --user restart command-center

# Verify
curl http://127.0.0.1:9069/health
```

### 6.2 Environment Variables

```
NEXT_PUBLIC_SUPABASE_URL=https://[project].supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=[key]
SUPABASE_SERVICE_ROLE_KEY=[key] (not in git)
```

### 6.3 Database Migrations

```bash
# Apply migrations in Supabase dashboard OR via CLI:
supabase migration up
```

### 6.4 Health Check & Logs

```bash
# Health check
curl http://127.0.0.1:9069/health

# Logs
journalctl --user -u command-center -f
```

---

## 7. Quality Assurance (QA Engineer)

### 7.1 Critical Path Tests (Must Pass)

1. **Dashboard KPI Accuracy** — Count leads this week, verify +1 after creating lead
2. **Lead Stage Advance** — Advance lead 2 stages, verify DB history recorded
3. **Approval Decision** — Approve approval, verify status changed, card disappeared
4. **Stall Detection** — Create lead >5 days old, verify red border appears
5. **Dashboard Activity Feed** — Perform 2 actions, verify they appear in feed
6. **Client Health** — Mark client at_risk, verify badge updates, revenue sum changes
7. **Invoice Overdue** — Create invoice with past due_date, verify red border
8. **Pipeline Funnel** — Verify all 9 stages show, counts add up
9. **Knowledge Search** — Search "objection", verify results filtered
10. **Server Error Toast** — Trigger invalid action, verify error toast appears

### 7.2 Edge Cases

- Stalled lead with NULL `last_activity_at` → should not crash
- Approve already-decided approval → should reject with error
- Search with special chars ($100K) → should filter correctly
- Network timeout on action → optimistic UI should roll back
- Overdue invoice with amount 0 → should display "€0"

### 7.3 Test Data

```sql
insert into public.clients values
  ('Acme Corp', 'Tech', 'healthy', 5000),
  ('Beta Inc', 'Finance', 'at_risk', 3000);

insert into public.leads values
  ('Prospect A', 'Tech', 'prospecting', '...agent_id...', now()),
  ('Prospect B', 'Finance', 'proposal_sent', '...agent_id...', now() - interval '7 days');

insert into public.invoices values
  ('...client_id...', 5000, now() + interval '15 days', 'pending'),
  ('...client_id...', 3000, now() - interval '5 days', 'overdue');
```

### 7.4 Performance Benchmarks

| Metric | Target |
|---|---|
| Dashboard Load | <2s |
| Pipeline Table Render | <1s (20 rows) |
| Approval Action | <500ms |
| Search Debounce | 300ms |
| DB Query (leads) | <100ms |

---

## 8. Implementation Checklist (Ordered)

### PHASE P0 (Week 1) — CRITICAL

- [ ] Add Clients page (list + detail) — 2h
- [ ] Add Proposals page (list + detail) — 2h
- [ ] Add Invoices page (list + detail) — 2h
- [ ] Add Toast notifications — 1h
- [ ] Implement Pagination (cursor-based) — 3h
- [ ] Add approval_notes and reason fields — 0.5h
- [ ] Fix indexes (archived filter on leads) — 0.5h
- [ ] **P0 Total: ~12 hours**

### PHASE P1 (Week 2) — HIGH-VALUE

- [ ] Webhook system (create, delete, test) — 5h
- [ ] Scheduled tasks schema — 2h
- [ ] Stall detection job — 2h
- [ ] Activity events table & logging — 3h
- [ ] Full-text knowledge search — 3h
- [ ] **P1 Total: ~15 hours**

### PHASE P2 (Week 3-4) — RELIABILITY

- [ ] Audit logging system — 3h
- [ ] Error boundary & recovery UI — 2h
- [ ] Form validation (all pages) — 3h
- [ ] Lead sheet write actions — 2h
- [ ] Renewal reminder job — 2h
- [ ] **P2 Total: ~12 hours**

### PHASE P3 (Week 4-5) — REAL-TIME

- [ ] Real-time updates (Supabase Realtime) — 6h
- [ ] Enhanced approval workflow (6-stage gates) — 4h
- [ ] Analytics dashboard — 4h
- [ ] **P3 Total: ~14 hours**

---

## 9. Definition of Done

V3 is complete when:

✅ **Product**
- All 9 pages render without error
- KPI counts accurate
- Pipeline funnel shows all 9 stages
- Activity feed works with pagination
- Stalled leads show warning
- Invoices >30 days overdue flagged
- Clients with renewals <30 days trigger approvals

✅ **Technical**
- Build passes clean (npm run build)
- Types pass (tsc --noEmit)
- 18 tables with RLS enabled
- All migrations apply
- Server actions follow error pattern
- Suspense boundaries on all pages
- Pagination is cursor-based
- Forms validated with Zod
- Toast notifications fire
- No N+1 queries

✅ **QA**
- All 10 critical path tests pass
- Manual checklist complete
- No server errors in logs
- No console errors in browser
- Performance benchmarks met

✅ **DevOps**
- Service file verified
- Health check responsive
- Logs accessible via journalctl
- Backup strategy verified
- Environment variables secured

---

## Open Questions & Risks

**Decisions Made:**
1. Webhooks: Simple HTTP POST with exponential backoff (no message queue)
2. Real-time: Supabase Realtime (simpler than custom WebSocket)
3. RBAC: Deferred to V3.1
4. Partitioning: Defer until 500k+ rows (Year 2)

**Risks:**
| Risk | Mitigation |
|---|---|
| Agent logs unbounded growth | Archival job >90 days old |
| N+1 queries in Recharts | Force eager loads, audit Network tab |
| Migration failures on prod | Test in staging, backup before deploy |
| Approval workflow too complex | Start 2-state, add 6-stage gates in P3 |

---

**Document Status:** FINAL — Ready for implementation  
**Next:** Complete Phase P0, commit, begin Phase P1  
**Estimated V3 Completion:** 4-5 weeks
