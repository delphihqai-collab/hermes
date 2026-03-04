# Delphi — Full Session Log
**Date:** 2026-03-04
**Compiled by:** HERMES
**Audience:** Boss (Pedro)

---

## Executive Summary

At the start of 2026-03-04, Delphi had a functional but thin infrastructure: HERMES workspace was operational with four native skills installed, gateway auto-start was just being confirmed, and the Command Center website was mid-build at V3/V4. By end of day, the full seven-agent commercial department had been built and verified (workspaces, state files, calibration gates), the Command Center had progressed through V4 and V5 to a complete feature set (kanban pipeline, alerts, approvals V2, client health, knowledge write mode, settings, realtime, command palette, theme toggle, mobile layout), a comprehensive agent-role research document (v2.0) had been written grounding all seven sub-agent configs in real B2B SaaS benchmarks, and the V6 specification had been authored to serve as the next build target. V6 implementation was in progress at session close but not yet verified. One prompt injection attempt was detected and neutralised during the session.

---

## Part 1 — Infrastructure (PC2 / HERMES)

### 1.1 Gateway Auto-Start via User Systemd

**What was done:**
Confirmed that the OpenClaw gateway runs under a user systemd service (`openclaw-gateway.service`) with linger enabled. This means the gateway restarts automatically after any PC2 reboot without requiring a login session. Documented this in TOOLS.md and committed.

**Why it was done:**
Previously, the gateway restart procedure in TOOLS.md referenced a `nohup` command that was incorrect for this setup. There was genuine uncertainty about whether the gateway would survive a reboot. This needed to be confirmed and documented accurately to prevent a silent failure where cron jobs would stop firing after a reboot.

**Trade-offs considered:**
- User systemd with linger vs. system-level systemd service: user systemd was chosen because the gateway runs as the `delphi` user. A system-level service would require different credential handling and sudo access.
- The linger configuration was verified to be active — without linger, user services would only start at login, defeating the purpose.

**Mistakes:**
None on this specific item. The TOOLS.md documentation pre-dating this fix had incorrect restart instructions (referencing nohup) — this was a carry-forward mistake from the 2026-03-03 session that was corrected.

**Commits:** `5c6a4a5` (document gateway auto-start via user systemd)

---

### 1.2 Auto-Updater Configuration

**What was done:**
Enabled the OpenClaw auto-updater on the stable channel with a 6-hour detection delay and 12-hour jitter window. Weekly maintenance cron job added (Sundays 03:00 Europe/Lisbon, job ID: `0755ef79-a6dc-4f80-800f-fa0b31bf09b7`) to run `openclaw update`, `clawhub update --all`, and `openclaw doctor`. TOOLS.md updated with the full Updates section.

**Why it was done:**
Without auto-update, OpenClaw would drift behind on security patches and feature improvements silently. The weekly maintenance cron provides an audit trail and ensures skills are also kept current.

**Trade-offs:**
- Auto-update on stable vs. manual: stable channel auto-update was chosen to avoid security exposure from running old versions. The 6h + 12h jitter window means updates don't apply immediately (reducing risk of a bad version auto-applying), but they also don't stay pending indefinitely.
- Beta channel was considered and rejected: we are in production use. Beta versions introduce instability risk. Decision: stay on stable, revisit beta only with Boss approval.

**Commits:** `982c1a0` (auto-updater), `8356dbf` (gateway restart procedure in TOOLS.md), `5c6a4a5` (gateway auto-start documentation)

---

### 1.3 Add-Credentials Runbook Extracted

**What was done:**
After successfully adding Supabase credentials to `openclaw.json` via the Raw config → env block method, extracted the procedure into a reusable runbook at `workspace/runbooks/add-credentials.md`.

**Why it was done:**
The credential-adding process was not obvious and required understanding the Raw config tab in the OpenClaw dashboard. Documenting it prevents the same discovery process from happening again in a future session.

**Trade-offs:**
None significant. This is pure documentation capture.

**Commits:** `5ba4193` (runbook: extract add-credentials)

---

### 1.4 SOUL.md — Sub-Agent Rule Added

**What was done:**
Added a non-negotiable sub-agent rule to SOUL.md: before the first tool call on any task that will block the channel for more than a few seconds, spawn a sub-agent, post a one-line acknowledgement, and stay responsive. This rule is marked as a judgement failure if violated, not just an execution mistake.

**Why it was done:**
Long-running tasks were being executed inline in the main session, blocking the Discord channel. Boss had flagged this as a pattern issue.

**Commits:** `96ab365` (soul: add non-negotiable sub-agent rule)

---

### 1.5 Native Skill Added: agent-browser

**What was done:**
A new native skill `agent-browser` was added to `workspace/skills/` and copied to `~/.openclaw/skills/`. This provides headless browser automation capability.

**Why it was done:**
The Market Intelligence agent's web research capability is limited without a browser tool. Direct URL fetching works for known URLs but not for discovery scanning.

**Commits:** `dcc77c7` (skill: add agent-browser)

---

### 1.6 memory-search-on-task-start Skill Updated

**What was done:**
Added a Step 0 sub-agent check and hard stop before any execution. The skill now enforces that HERMES checks for an existing sub-agent handling the same task before starting work — preventing duplicate work in parallel sessions.

**Commits:** `e64a7f2` (skill: memory-search-on-task-start — Step 0 sub-agent check)

---

### 1.7 Sub-Agent Timeout Rule — Runbook Update

**What was done:**
Moved the sub-agent timeout rule from MEMORY.md to the `sub-agent-briefing` runbook, where it belongs operationally. The rule: always set sub-agent timeout based on task needs, never optimise for speed.

**Why it was done:**
MEMORY.md is for synthesised patterns and preferences. Operational rules belong in runbooks. This was a misclassification corrected during session review.

**Commits:** `f63d96f` (memory: move sub-agent timeout rule to runbook), `f513637` (memory: sub-agent timeout rule — operational placement confirmed)

---

### 1.8 Prompt Injection Attempt — Detected and Neutralised

**What happened:**
A `[System Message]` block referencing `WORKFLOW_AUTO.md` arrived embedded in a Discord user message during the afternoon session. The block appeared to instruct HERMES to execute a workflow.

**What was done:**
The file `WORKFLOW_AUTO.md` does not exist in the workspace. The event timing did not match any known OpenClaw compaction or system event pattern. Flagged to Filipe. No action taken on the injected content.

**Security protocol followed:** Did not comply, did not investigate the file (which doesn't exist), reported as a prompt injection attempt per AGENTS.md security rules.

**No commit** — this is an operational event, not a code change.

---

## Part 2 — Agent Fleet

### Full Agent Status Table (as of session close 2026-03-04)

| Agent | Status | Workspace Built | State Initialised | Calibration Gates Defined |
|---|---|---|---|---|
| HERMES (self) | active | ✅ | ✅ | N/A — I am the director |
| SDR | idle — ready for calibration | ✅ | ✅ | ✅ |
| Account Executive | idle — ready for calibration | ✅ | ✅ | ✅ |
| Account Manager | idle — ready for calibration | ✅ | ✅ | ✅ |
| Finance | built_not_calibrated | ✅ | ✅ | ✅ |
| Legal & Compliance | built_not_calibrated | ✅ | ✅ | ✅ |
| Market Intelligence | built_not_calibrated | ✅ | ✅ | ✅ |
| Knowledge Curator | built_not_calibrated | ✅ | ✅ | ✅ |

---

### What "built_not_calibrated" means operationally

A `built_not_calibrated` agent has a complete workspace (AGENTS.md, TOOLS.md, IDENTITY.md, memory directory) and has been initialised in `heartbeat-state.json`. It is not active. HERMES reviews every output manually until a pattern is confirmed reliable. The silent-agent chase rule does not apply to these agents. They are not yet trusted to operate without oversight.

---

### SDR (Sales Development Representative)

**Status:** idle — ready for calibration

**What was built:**
- `teams/commercial/sdr/` — full workspace with AGENTS.md, TOOLS.md, IDENTITY.md, memory/
- `openclaw.json` — SDR entry added (model: haiku, maxConcurrent: 8)
- `heartbeat-state.json` — SDR initialised
- `templates/commercial/sdr-handoff-brief.md` — structured handoff template

**Calibration gates:**
- 5 handoff briefs reviewed and corrected by HERMES before status moves to `idle → active`
- SDR acceptance rate from AE must be >85% before calibration is considered complete

**What's needed before activation:**
- First real lead to process
- Boss sign-off on the first 5 handoff briefs

**Commits:** `a39f816` (build: SDR agent workspace)

---

### Account Executive

**Status:** idle — ready for calibration

**What was built:**
- `teams/commercial/account-executive/` — full workspace
- Templates: `ae-discovery-log.md`, `ae-atlas-trigger.md`, `ae-legal-trigger.md`, `ae-am-handoff-brief.md`, `ae-loss-debrief.md`
- Proposal gate timing defined: ATLAS ≤2 days, Legal ≤2 days, Finance ≤1 day, total ≤5 days

**Calibration gates:**
- 3 discovery logs reviewed by HERMES
- 3 proposal drafts reviewed by HERMES
- Both must pass before status moves to `active`

**What's needed before activation:**
- First SQL from SDR
- Boss sign-off on first proposal draft before it leaves the building

**Commits:** `2fe04fc` (build: Account Executive agent workspace)

---

### Account Manager

**Status:** idle — ready for calibration

**What was built:**
- `teams/commercial/account-manager/` — full workspace
- Templates: `am-onboarding-checklist.md`, `am-health-score-report.md`, `am-renewal-brief.md`, `am-churn-intervention-brief.md`, `am-expansion-signal.md`
- Health score formula defined: usage rate (30pts), support ticket volume inverse (20pts), last contact recency (20pts), onboarding completion (20pts), invoice payment timeliness (10pts)

**Calibration gates:**
- First 30-day onboarding reviewed by HERMES before status moves to `active`

**What's needed before activation:**
- First client to be onboarded (depends on AE closing first deal)

**Commits:** `115fae1` (build: Account Manager agent workspace)

---

### Finance Agent

**Status:** built_not_calibrated

**What was built:**
- `teams/commercial/finance/` — full workspace
- Template: `finance-invoice-brief.md`
- VAT compliance note documented: Portuguese VAT (23%) applies to digital B2B services; SAF-T format required for Portuguese tax authority; invoice template must be legal-reviewed before first use

**Calibration gates:**
- Calibrated on first real task — every output reviewed by HERMES until pattern confirmed

**What's needed before activation:**
- First closed deal (to trigger invoice generation)
- Legal review of invoice template

**Commits:** `c3a18f8` (build: Finance agent workspace)

---

### Legal & Compliance Agent

**Status:** built_not_calibrated

**What was built:**
- `teams/commercial/legal/` — full workspace
- Template: `legal-review-request.md`
- GDPR risk map documented: 5 risk categories from Article 9 special-category data through to Article 22 automated decision disclosure
- DPA requirements specified: must be signed before any client data is processed; sub-processor list (Anthropic/OpenAI APIs) must be disclosed

**Calibration gates:**
- Calibrated on first real task — every output reviewed by HERMES

**What's needed before activation:**
- First contract or DPA to review
- Boss confirmation that Legal agent's DPA template is compliant

**Commits:** `b49e103` (build: Legal and Compliance agent workspace)

---

### Market Intelligence Agent

**Status:** built_not_calibrated

**What was built:**
- `teams/commercial/market-intelligence/` — full workspace
- Template: `mi-competitor-report.md`
- Competitive landscape mapped: 4 competitor types identified (generic automation, dental software, generic AI, local IT consultants)
- Delphi's defensible position: sector-specific + GDPR-built-in + SME pricing + ongoing support (no competitor combines all four currently)

**Known limitation:**
Without Brave API key, the MI agent cannot do broad web discovery. It is limited to direct URL fetching of known competitor pages and sector publications. This is documented. The MI agent must not silently deliver degraded reports — it must flag this limitation explicitly in any report it produces.

**Calibration gates:**
- Calibrated on first real task
- First report reviewed by HERMES and Boss before any output influences a sales decision

**What's needed before activation:**
- Brave API key configured (V6 spec includes the integration)
- Boss decision on first research focus (competitors, sectors, or regulatory tracking)

**Commits:** `6fd5d3e` (build: Market Intelligence agent workspace)

---

### Knowledge Curator Agent

**Status:** built_not_calibrated

**What was built:**
- `teams/commercial/knowledge-curator/` — full workspace with additional files: `knowledge-base.md` (foundation document seeded with ICP patterns, sector context, objection library, competitive positioning), `onboarding-patterns.md`
- Template: `kc-knowledge-entry.md` — includes the quality gate test: "If a brand-new AE agent session read only this entry, would it perform meaningfully better?"

**Migration note:**
When NEXUS becomes operational, the Knowledge Curator migrates to NEXUS oversight. No config change needed to agent workspace at that point — HERMES simply stops being the review layer and NEXUS takes over.

**Calibration gates:**
- Calibrated on first real task
- Every knowledge entry reviewed by HERMES until quality gate is consistently passing

**What's needed before activation:**
- First significant event to capture (a dealt-with objection, a competitor comparison, a successful close)

**Commits:** `58ae38a` (build: Knowledge Curator agent workspace), `2a0ad76` (docs: commercial architecture reference)

---

### Agent Research Document (v2.0)

The full research backing all seven configurations is at `workspace/docs/agent-role-research.md`. Version 2.0 added:
- KPI benchmarks with specific numbers (not vague "high/low")
- Daily workflow breakdowns for each role
- Failure mode documentation
- GDPR risk map (Finance and Legal sections)
- Competitive landscape (MI section)
- Deal velocity framework tied to EUR 300/month ACV
- Health score formula (AM section)
- Knowledge quality gate (KC section)
- Cross-role architecture diagram
- Knowledge loop description

Version 1.0 was written earlier in the day. It was flagged as too thin by HERMES's own review — it described what each role does but didn't provide enough operational grounding to actually configure agents well. V2.0 was written from scratch with specific benchmarks.

**Commits:** `2b98c32` (research: agent role study + 4 new templates), `d0ae712` (docs: agent-role-research v2.0 — substantial improvement)

---

## Part 3 — Command Center (Website)

### V1 — Initial Scaffold

**What was built:**
- Next.js 15 (App Router), Tailwind CSS, shadcn/ui, TypeScript
- Supabase project created, credentials configured in openclaw.json
- Initial schema proposal (16 tables, 7 domains) documented in `docs/schema-proposal.md`
- Context engineering scaffold: `CLAUDE.md`, `.github/copilot-instructions.md`, `.claude/skills/`, `.claude/prompts/`
- Initial migrations applied, app live on port 9069
- Auth: Supabase Auth, email + password

**Key decisions:**
- One central Supabase instance for all current and future surfaces. Trade-off: single DB means all data in one place (easier to query across tables) but no isolation between future projects. Accepted at this stage given Delphi is a single-product company.
- RLS enabled from day one. Trade-off: adds complexity to every query but prevents data leaks at the DB level, which matters given GDPR obligations.
- Port 9069 on PC2, accessed via Tailscale or SSH tunnel. Trade-off: no public URL yet (more secure) but requires Tailscale on any device that wants access (extra setup step for Pedro and Filipe).

**Issues:**
- pnpm not on PATH for system service user (noted, not resolved until V6 spec)
- Context engineering files all placeholder — needed HERMES review before populating

**Git commits:** `16a69f5` (scaffold), `e66cf78` (hosting documentation), `08e61d7` (migrations applied, app live), `da80ced` (CLAUDE.md review complete), `5de1c23` (add HERMES report requirement to CLAUDE.md)

---

### V2 — Dashboard KPIs, Pipeline Advance, Approvals Actions, Knowledge Search, Settings Agents

**What was built:**
- Dashboard KPI cards
- Pipeline: ability to advance lead stages
- Approvals: approve/reject actions
- Knowledge Base: search functionality
- Settings: agents management tab

**Key decisions:**
- Server actions over API routes for mutations: consistent with Next.js 15 App Router patterns, keeps auth handling in one layer.

**Issues found and resolved:** None documented explicitly in V2 report (V2 was pre-HERMES report requirement).

**Git commit:** `44e043e` (feat: V2 implementation)

---

### V3 — Invoice Detail, Cursor Pagination, Schema Fixes, Approval Notes, Zod Schemas

**What was built:**
- Invoice detail page
- Cursor pagination (replacing offset pagination which doesn't scale)
- Schema fixes based on V2 testing
- Approval notes
- Zod schemas for all mutations (input validation)

**Key decisions:**
- Cursor pagination over offset pagination: at scale, offset pagination becomes slow because the DB must count all rows before the offset. Cursor pagination avoids this. Trade-off: cursor pagination is harder to implement and doesn't allow jumping to a specific page number. Accepted — the Command Center is an operational tool, not a paginated report.

**HERMES report requirement added:** CLAUDE.md and copilot-instructions updated to require a `hermes-report-vN.md` after every implementation. This ensures HERMES can verify builds without running the app.

**Git commit:** `cd1c2f2` (feat: P0 — invoice detail, cursor pagination, schema fixes, approval notes, Zod schemas)

---

### V4 — The Office, Chat, Costs, Gateway, Sessions, Memory Browser, Log Viewer, Audit Log

**What was built:**
- **The Office:** Pixel-art agent grid, rank-based desk styling (director gets col-span-2, indigo border), status dots with animated pulse, click-to-open side sheet with agent details
- **Chat panel:** Three-page architecture — agent selector with conversation list, conversation thread, ChatInput with Enter-to-send
- **Model costs:** Cost constants for claude-sonnet-4-6 and claude-haiku-4-5, KPI cards, per-agent breakdown, Recharts line chart, CSV export
- **Gateway config:** Reads from localhost:18789 with graceful fallback UI, read-only by default with Dialog warning for edit mode, credential masking via regex
- **Sessions panel:** Gateway API integration with agent_logs fallback, 30-second auto-refresh
- **Memory browser:** Path traversal prevention, search across files, markdown rendering
- **Log viewer:** journalctl integration, agent filter, time range selector (1h/6h/24h/7d), live tail via Supabase Realtime
- **Audit Log:** Filterable table (agent, action, date range), expandable JSON changes

**4 new migrations applied:** approval stages, chat tables, token usage, audit log hardening

**Key decisions:**
- `staging_history` on approvals to track stage transitions: adds auditability at the cost of schema complexity. Necessary for compliance in a GDPR context where decision trails are required.
- Gateway config page as read-only by default with edit-mode warning: prevents accidental config changes from the UI. The Dialog confirmation adds friction that is intentional.

**Issues found:**
1. Supabase CLI auth broken — cannot run `supabase gen types`. Resolved by manually maintaining `database.types.ts`. This remained a persistent issue through V5.
2. Gateway API unavailable on build machine — gateway pages show graceful fallback UI. Not a code issue; build machine ≠ production machine.
3. Migration `archived_at` column — migration 8 had a WHERE clause referencing a column that doesn't exist. Fixed by removing the clause.
4. `middleware.ts` deprecation warning in Next.js 16 — not blocking, noted for future resolution.

**Git commit:** `d88212857692` (feat: V4)

---

### V5 — "Make the Data Real"

**What was built:**
- **Alerts system:** `alert_rules` + `alert_events` tables, `/alerts` page with severity grouping (critical/high/medium/info), resolve actions, Realtime refresh. Dashboard critical alerts KPI card.
- **Approvals V2:** Risk cards (risks_if_approved / risks_if_rejected), alternatives section, full draft content, decision tracking (decided_by, decision_reason, decided_at). HERMES polling endpoint `/api/hermes/approval-decision`.
- **Pipeline V2 — Kanban:** `@dnd-kit` drag-and-drop, table/kanban toggle (localStorage-persisted), lead scoring (0-100 with colour badges), bulk actions bar (advance stage / archive), pipeline forecast sidebar (30/60/90 day weighted buckets).
- **Client Health Dashboard:** Health trend LineChart, renewal countdown (colour-coded by urgency), computed risk flags (declining health, overdue invoices), client notes with inline add-note form.
- **Agent Calibration Tracker:** Progress tracker for `built_not_calibrated` agents, gate checklist with completion state.
- **Settings Full Build:** 5-tab layout (Account, Notifications, Pipeline, Agents, Data Retention), notification channel preferences, pipeline stall threshold config, data retention settings.
- **Knowledge Write Mode:** New/edit forms, server actions (createDealLearning, updateDealLearning), "New Entry" button.
- **Command Palette:** cmd+K global search with debounced SWR fetch, grouped results.
- **Theme Toggle:** Dark/light mode via next-themes ThemeProvider.
- **Mobile Layout:** 5-item bottom nav (Dashboard, Pipeline, Approvals, Alerts, Office), office floor responsive grid (1→2→4 columns).
- **Realtime rollout:** dashboard (agent_logs), pipeline (leads), office (agents), costs (agent_token_usage), alerts (alert_events).
- **Sidebar:** 19 items with `overflow-y-auto` scroll fix.

**7 new migrations:** `000012` through `000018` (alerts, approvals V2, calibration, weekly reports, client notes, notification prefs/pipeline config, FTS tsvector search).

**V5 Spec — Two Commits Required:**
The initial V5 spec (commit `564378d`) contained a section about HERMES writing directly to Supabase. This was wrong — HERMES is not a DB writer. That is ATLAS's domain. The spec was patched in commit `fccd94a` to remove that section and add the sidebar scroll fix. The V4 spec was archived with an `[ARCHIVED]` header.

**Audit result:** PASS — all 7 migrations present, all specified pages and components exist, all core features structurally sound. Two minor items flagged: sidebar alert badge rendering not explicitly verified, responsive table cards for pipeline/approvals not explicitly checked.

**Issues found during V5 implementation:**
1. `@radix-ui/react-checkbox` and `@radix-ui/react-visually-hidden` not pre-installed — added inline.
2. `SUPABASE_CONNECTION_STRING` env var didn't exist in `.env.local` — migrations applied with hardcoded credentials via Node pg client. This is a credential handling gap (see Part 6 — Mistakes).
3. FTS column names in spec were wrong — migration corrected to actual schema columns.
4. Status label deviation: spec said `status = 'submitted'`, implementation uses `status = 'pending'`. This is a spec documentation error — the implementation is internally consistent.

**Git commits:**
- `564378d` — spec v5 (initial)
- `fccd94aa` — spec v5 patch (remove HERMES→DB section, add sidebar scroll fix)
- `82139e45` — intermediate spec update
- `7e567212` — V5 implementation (feat: Make the data real)
- `53c4f762` — HERMES V5 audit report

---

### V6 — Architecture and Spec Written (Implementation In Progress)

See Part 4 for the full V6 architecture discussion. The V6 spec was written and committed at `8062dadf`. Implementation was running (via Opus model) at session close — no hermes-report-v6.md yet exists, meaning V6 is not verified as of session close.

**V6 commit:** `8062dadf` (docs: implementation-spec-v6)

---

## Part 4 — V6 Architecture Decision

### What V6 Was Originally Scoped As

V6 was initially conceived as a continuation of the "make the data real" direction from V5 — more features, more polish, closing known V5 gaps. The primary V5 gaps to address were:

1. The HERMES polling endpoint exists but HERMES has no skill to call it (dead endpoint)
2. Supabase types drift from manual updates
3. pnpm not on PATH for service user
4. "Deal Learnings" naming inconsistency in Knowledge Base

### What V6 Actually Became

V6 grew substantially to include:
1. **Brave API web search integration** — Market Intelligence page with search, "Save to Knowledge Base", competitor quick-links. This directly unblocks the MI agent's web discovery limitation.
2. **Website → Pipeline webhook** — Inbound lead webhook endpoint (`/api/webhook/inbound-lead`) to receive leads from a public website contact form. The receiving end is built in V6; the website itself is future work.
3. **Notification system** — In-app notification bell, `notifications` table, notification preferences, alert → notification triggers.
4. **Lead detail page upgrade (MEDDIC panel)** — Full MEDDIC framework as editable fields on lead detail, activity log showing stage history, lead notes.
5. **Proposals full build** — 4-step creation form (discovery → scoping → pricing → review), gate status tracker (ATLAS/Legal/Finance), timeline display.
6. **Invoices full build** — Invoice creation, auto-generated invoice number (INV-YYYY-NNN), status management (pending/paid/overdue), filter states.
7. **Dashboard metrics** — MRR, pipeline value, win rate, agent cost MTD as proper KPI cards. Unified activity feed from 4 sources (leads, approvals, alerts, agent_logs).
8. **Agent list/detail upgrades** — Calibration progress on agent cards, 30-day token usage area chart on agent detail.
9. **Audit log improvements** — Date range picker, CSV export.

### The Multi-Business Architecture Discussion

During the afternoon session, there was a conversation about whether the Command Center's architecture should support multiple businesses under one Delphi umbrella — the idea being that agents are a shared pool and each business is a separate project within the same interface.

**What was discussed:**
- The current Command Center is built for a single business (Delphi commercial operations)
- As Delphi's client base grows, the same infrastructure might serve as a template or even a product sold to clients
- The sidebar navigation question: would a multi-business model require a different navigation structure?

**What was researched:**
Research was conducted on sidebar navigation patterns for multi-tenant/multi-project applications. Findings:
- The most common pattern for multi-project SaaS (Linear, Notion, Vercel, GitHub) uses a top-level business/workspace switcher, not a sidebar restructure
- The sidebar remains context-aware to the selected business/project
- Agents as a shared pool (like GitHub Actions runners) is a validated pattern for multi-project agent infrastructure

**What was decided for V6:**
V6 does **not** implement multi-business architecture. The decision was to stay focused on building out the single-business operational layer completely before introducing multi-tenancy complexity. The multi-business model is noted as a future architectural decision that needs Boss input before implementation begins. It did not make it into the V6 spec.

**Risk of deferring:** If Delphi pivots to selling the Command Center as a product, the DB schema (currently not tenant-isolated) will need a migration to add `business_id` or `tenant_id` columns across most tables. This is non-trivial but not impossible. The risk is that the schema calcifies before this decision is made.

---

## Part 5 — Key Decisions & Trade-offs

**Decision 1: Fixed team architecture over dynamic spawning**
- What was decided: Delphi uses 7 permanent agents (SDR, AE, AM, Finance, Legal, MI, KC) that accumulate context and memory across sessions, rather than spinning up fresh agents per task.
- Alternatives considered: Dynamic spawning — spawn a fresh agent for each task, no persistent memory.
- Why this choice: Permanent agents build up domain knowledge over time (sector patterns, client history, objection libraries). A dental lead handled in February informs how the SDR processes a dental lead in May. Dynamic agents start cold every time.
- Risk if wrong: Permanent agents can develop persistent bad patterns if their calibration gates aren't maintained. HERMES's review layer is the mitigation.

**Decision 2: HERMES as DB — removed from V5 spec**
- What was decided: HERMES does not write directly to Supabase. That is ATLAS's domain (the development/technical agent). The initial V5 spec incorrectly included a HERMES→Supabase section.
- Alternatives considered: HERMES polling the approval decision endpoint and writing pipeline state changes directly.
- Why this choice: Role clarity. HERMES is the commercial director. It reads DB state (via the Command Center API) but does not maintain the DB. Mixing roles creates ambiguity about who is responsible for data integrity.
- Risk if wrong: Low. The polling endpoint exists. If HERMES needs to write state in an emergency, it can be connected. Separating concerns is the right default.

**Decision 3: Supabase Auth with email/password for V1**
- What was decided: Simple email + password auth via Supabase Auth.
- Alternatives considered: OAuth (Google), SSO, passwordless magic link.
- Why this choice: V1 is used by 2 people (Pedro and Filipe). The complexity of OAuth setup is not justified. Email + password is standard and Supabase Auth handles it securely.
- Risk if wrong: If the Command Center is opened to client access in the future, email + password is not ideal for client-facing auth. However, client access was not in scope for V1–V6.

**Decision 4: pnpm over npm**
- What was decided: Use pnpm as the package manager for Command Center.
- Alternatives considered: npm (default), yarn.
- Why this choice: pnpm is faster and uses a global content-addressable store (less disk usage). It was already configured in the project.
- Risk if wrong: pnpm is not on PATH for the systemd service user, causing silent failures if anyone tries to run build commands without activating nvm first. This was documented as a known gap in TOOLS.md and addressed in the V6 spec.

**Decision 5: Brave API for Market Intelligence (deferred to V6)**
- What was decided: Brave Search API is the right choice for web discovery in the MI agent. Integration deferred to V6.
- Alternatives considered: SerpAPI, Google Custom Search, OpenAI web browsing, direct URL fetching only.
- Why Brave: $3/1000 queries (cheapest viable option), well-documented API, no browser dependency, fast response times, and already integrated into OpenClaw's own web_search tool.
- Risk if deferring: MI agent is operating with degraded capability until V6 is deployed and the Brave API key is added.

**Decision 6: RLS enabled from day one**
- What was decided: Row Level Security enabled on all Supabase tables from initial migration.
- Alternatives considered: Disable RLS for speed of development, enable later.
- Why this choice: GDPR context. Delphi processes client personal data. Enabling RLS retroactively is possible but risks gaps during the migration period. The trade-off is development complexity for security guarantees.
- Risk if wrong: Incorrect RLS policies can silently block legitimate queries. Every new table needs RLS policies reviewed.

**Decision 7: Knowledge Curator migrates to NEXUS when operational**
- What was decided: The KC agent currently reports to HERMES. When NEXUS becomes active, KC migrates to NEXUS oversight.
- Why: Knowledge management is a cross-department function. It should sit under NEXUS (Chief of Staff), not HERMES (Commercial Director). HERMES managing KC temporarily is a pragmatic interim arrangement.
- Risk: If NEXUS takes a long time to become operational, HERMES ends up managing a function outside its domain long-term.

**Decision 8: Net-14 payment terms**
- What was decided: Default payment terms for SME clients at Delphi should be Net-14 (payment due 14 days after invoice).
- Alternatives considered: Net-30 (industry standard), Net-7 (aggressive).
- Why Net-14: Delphi is pre-revenue. Cash flow at the early stage is critical. Net-30 means a client who signs on day 1 might not pay until day 44 (invoice issued after onboarding complete, plus 30 days). Net-14 with an automated reminder at day 10 is the right balance.
- Risk if wrong: Some clients may push back on Net-14. The AE must be calibrated to handle this objection without immediately conceding Net-30.

---

## Part 6 — Mistakes Made

**Mistake 1: V5 spec included HERMES writing to Supabase**

- What happened: The initial V5 implementation spec (`564378d`) contained a "HERMES→Supabase Integration" section describing HERMES making direct DB writes for pipeline state, approval decisions, and report generation.
- Why it happened: The spec was written quickly to hand off to the coding agent (Opus). The role boundary between HERMES (commercial director, reads/decides) and ATLAS (technical director, builds/maintains DB) was not checked before committing.
- How it was corrected: Identified after committing. Spec patched in `fccd94aa` — HERMES→DB section removed, sidebar scroll fix added. V4 spec archived.
- What was put in place to prevent recurrence: Role boundary is now explicitly documented in the V5 audit report and this session log. Any future spec that involves DB writes from HERMES must be flagged and routed to ATLAS review.

**Mistake 2: SUPABASE_CONNECTION_STRING not in .env.local**

- What happened: V5 migrations were applied using hardcoded credentials in a Node pg client script because `SUPABASE_CONNECTION_STRING` was not in `.env.local`. This means a credential string was either embedded in a script or typed into a terminal session.
- Why it happened: The env var was stored in `openclaw.json` (the HERMES config) but not propagated into the `.env.local` file that the coding agent uses for build/migration operations.
- How it was corrected: Migrations ran successfully. The credential was not committed to git.
- What was put in place: V6 spec (section 0.3) documents the pnpm PATH issue and implicitly the env var gap. However, the `.env.local` propagation issue is not fully resolved — it needs explicit documentation that coding agents building the Command Center need their own copy of the Supabase credentials in `.env.local`.
- **Outstanding risk:** This pattern will repeat every time a new coding agent builds a V* without having `.env.local` pre-populated. Needs explicit runbook or checklist before V6 build begins.

**Mistake 3: Agent role research v1.0 was too thin**

- What happened: The first version of `docs/agent-role-research.md` described what each role does but lacked KPI benchmarks, daily workflow specifics, failure mode documentation, and the kind of operational grounding needed to configure agents with confidence.
- Why it happened: v1.0 was written as a first pass. The gap was only apparent on second review.
- How it was corrected: v2.0 was written from scratch with specific benchmarks, workflows, and failure modes. The file is now 414 lines vs. the original (shorter) draft.
- What was put in place: The v2.0 file serves as the ground truth for all agent calibration decisions. Commit `d0ae712` captures the improvement.

**Mistake 4: Gateway restart procedure initially documented as nohup**

- What happened: An earlier version of TOOLS.md described the gateway restart using a `nohup` command, which is incorrect for a systemd-managed service.
- Why it happened: The gateway's process manager was uncertain during the 2026-03-03 session, and a placeholder was written rather than leaving it blank until confirmed.
- How it was corrected: Confirmed during 2026-03-04 that the gateway runs under user systemd. TOOLS.md updated with the correct `systemctl --user` commands and post-restart checklist.
- What was put in place: The full gateway restart procedure is now in TOOLS.md with specific commands for both normal restart and recovery scenarios. Post-restart checklist added.

**Mistake 5: Sub-agent timeout rule in wrong location**

- What happened: An operational rule about setting sub-agent timeouts (always set based on task needs, never optimise for speed) was stored in MEMORY.md when it belongs in the `sub-agent-briefing` runbook.
- Why it happened: The rule was added during a session when the runbook structure had not yet been fully established.
- How it was corrected: Rule moved from MEMORY.md to `sub-agent-briefing.md`. Commits `f63d96f` and `f513637`.
- What was put in place: The principle is now codified — MEMORY.md holds synthesised preferences and patterns; operational rules belong in runbooks.

---

## Part 7 — Improvements Made to HERMES Itself

### SOUL.md
- Added non-negotiable sub-agent rule: any task blocking the channel for more than a few seconds must be delegated to a sub-agent, with a one-line acknowledgement. Violations are judgement failures, not execution mistakes. (Commit `96ab365`)

### MEMORY.md
- Sub-agent timeout rule removed (relocated to runbook — see Mistake 5)
- Permanent references section added: `templates/commercial/` as the canonical path for all commercial templates
- Runbook Registry updated to reflect all 5 runbooks

### Runbooks
- `add-credentials.md` — new, extracted from the Supabase credentials session (commit `5ba4193`)
- `sub-agent-briefing.md` — timeout rule added (commits `f63d96f`, `f513637`)

### Skills
- `agent-browser` — new native skill added for headless browser automation (commit `dcc77c7`)
- `memory-search-on-task-start` — Step 0 sub-agent check added, prevents duplicate work in parallel sessions (commit `e64a7f2`)

### AGENTS.md
- Seven agent entries in openclaw.json confirmed, calibration gates documented
- Agent status semantics defined (`active`, `idle`, `built_not_calibrated`) — the silent-agent chase rule only applies to `active` and `idle` agents
- heartbeat-state.json initialised with all 7 agents

### TOOLS.md
- Gateway auto-start via systemd documented with full command reference and post-restart checklist
- Gateway Restart Procedure section completely rewritten (removed incorrect nohup reference)
- Updates section added: auto-updater config, weekly maintenance cron, manual update commands, stable channel policy
- Native Skills section updated with agent-browser entry

---

## Part 8 — What Is Still Blocked or Pending

### V6 Implementation
- **Status:** In progress at session close (Opus coding agent running), not verified
- **Blocker:** Build completion + hermes-report-v6.md needs to be written and committed before HERMES can verify
- **What's needed:** Coding agent completes build, HERMES audit verifies, any issues reported

### Brave API Key
- **Status:** Not configured
- **Blocker:** Boss needs to obtain a key from `api.search.brave.com` and add it via OpenClaw dashboard
- **Impact:** Market Intelligence agent is operating with degraded capability (direct URL fetching only, no discovery scanning). V6 builds the integration but it's inert without the key.

### Agent Activation (SDR, AE, AM)
- **Status:** Workspaces built, ready for calibration — not yet active
- **Blocker:** No real leads to process. Calibration requires actual tasks.
- **What's needed:** First inbound lead or Boss-directed outbound prospect for SDR to process, reviewed by HERMES

### Finance / Legal / MI / KC Calibration
- **Status:** built_not_calibrated
- **Blocker:** No real tasks yet (pre-revenue phase)
- **What's needed:** First deal (Finance, Legal), first research request (MI), first significant commercial event (KC)

### Airtable Connection
- **Status:** Not connected — no base ID or API key
- **Impact:** CRM data is currently only in the Command Center DB. No Airtable sync.
- **What's needed:** Boss to provide Airtable base ID and API key

### Google Workspace Connection
- **Status:** Not connected — no OAuth token
- **Impact:** Proposals and contracts cannot be generated as Google Docs. Currently proposals would be Markdown files only.
- **What's needed:** OAuth setup and token configuration

### NEXUS Activation
- **Status:** PC3 exists, NEXUS not yet operational
- **Impact:** All cross-department coordination, weekly report consolidation, and Knowledge Curator oversight routes through Boss directly (HERMES escalates to Boss instead of NEXUS)
- **What's needed:** Boss decision on when to activate NEXUS

### pnpm PATH for Service User
- **Status:** pnpm is installed (`~/.nvm/versions/node/v22.22.0/bin/pnpm`) but not on PATH for systemd service
- **Impact:** If the command-center service tries to run `pnpm` commands, it will fail silently
- **What's needed:** Add nvm path to `.bashrc` or create a symlink (symlink requires sudo — Boss or Filipe to action)

### .env.local Propagation for Coding Agents
- **Status:** Gap identified (see Mistake 2) — not fully resolved
- **Impact:** Future V* builds by coding agents will hit migration failures if `.env.local` doesn't have Supabase credentials pre-populated
- **What's needed:** A checklist or runbook step that ensures `.env.local` is populated before any coding agent is briefed on Command Center work

### Command Center HERMES Skill
- **Status:** Not built
- **Impact:** The `/api/hermes/approval-decision` endpoint exists but HERMES has no skill to poll it. Approval decisions made in the Command Center are not visible to HERMES unless Boss explicitly tells HERMES.
- **V6 spec** explicitly calls for this skill to be created — but it's a HERMES-side deliverable, not a Command Center deliverable.

---

## Part 9 — Recommended Next Actions

### Requires Boss Input
1. **Brave API key** — Obtain from `api.search.brave.com`, add via OpenClaw dashboard. Unblocks MI agent. Takes 5 minutes.
2. **V6 build verification** — Review hermes-report-v6.md once Opus completes the build. Any issues flagged there need decision on whether to fix before using V6 or defer.
3. **Multi-business architecture decision** — Does Boss intend the Command Center to eventually become a product sold to clients? If yes, the DB schema needs tenant isolation before it calcifies. This is a strategic decision that changes V7+ direction significantly.
4. **Airtable + Google Workspace** — Provide credentials when ready. Until then, the CRM and document generation capabilities are limited to what's in the Command Center DB.
5. **Agent activation sign-off** — When the first real prospect or lead arrives, Boss reviews the first 5 SDR handoff briefs. This is the calibration gate. Boss does not need to do anything now — only when the first lead appears.
6. **NEXUS activation timeline** — No action required now, but a rough timeline would help plan Knowledge Curator oversight handoff.

### Can Proceed Without Boss (HERMES + Filipe)
1. **Verify V6 build** — Once coding agent completes, HERMES reads hermes-report-v6.md and audits. If PASS, update session notes and commit.
2. **Create command-center-read skill** — Build the HERMES workspace skill to poll `/api/hermes/approval-decision`. This is documented in V6 spec §0.1. No Boss input needed.
3. **Populate context engineering files** — `CLAUDE.md` and `.github/copilot-instructions.md` in the Command Center repo are partially outdated. HERMES should update them to reflect V5+V6 schema and patterns after V6 verifies.
4. **Resolve pnpm PATH** — Filipe can add the nvm path to `.bashrc` on PC2. Takes 2 minutes. Prevents future silent failures.
5. **Document .env.local propagation** — Extract a short runbook or add a step to the `sub-agent-briefing` runbook for Command Center coding tasks: always pre-populate `.env.local` before briefing a coding agent.
6. **Knowledge Curator seeding** — HERMES can begin seeding `knowledge-base.md` with the ICP hypothesis, known objection patterns, and current competitive positioning from the research report. This gives future agent sessions a better starting baseline.

### Filipe's Queue (Technical Work)
1. **pnpm PATH fix** (2 minutes) — Add to `.bashrc` or symlink
2. **V6 testing** — Once deployed, test the inbound lead webhook with a sample POST, verify Brave search returns results in the Market Intelligence page, confirm invoice auto-numbering works
3. **Supabase CLI auth** — Still broken for `supabase gen types`. If Filipe can fix this, the `pnpm types` script in V6 spec will work correctly, eliminating the database.types.ts drift problem permanently.

---

## Appendix — Git Commit History

### workspace repo (`/home/delphi/.openclaw/workspace`)

```
f63d96f memory: move sub-agent timeout rule from MEMORY.md to sub-agent-briefing runbook
f513637 memory: sub-agent timeout rule — always set based on task needs, never optimise for speed
d0ae712 docs: agent-role-research v2.0 — KPI benchmarks, daily workflows, GDPR risk map, competitive landscape, deal velocity framework
2b98c32 research: agent role study + 4 new commercial templates (finance, legal, MI, KC)
dcc77c7 skill: add agent-browser — headless browser automation
e64a7f2 skill: memory-search-on-task-start — Step 0 sub-agent check, hard stop before any execution
96ab365 soul: add non-negotiable sub-agent rule — block prevention
2f058a7 memory: session notes 2026-03-04 midday flush
5ba4193 runbook: extract add-credentials — env block via Raw config
fa8f2c2 config: mark SDR, AE, AM ready for calibration
58ae38a build: Knowledge Curator agent workspace
6fd5d3e build: Market Intelligence agent workspace
b49e103 build: Legal and Compliance agent workspace
c3a18f8 build: Finance agent workspace
115fae1 build: Account Manager agent workspace
2fe04fc build: Account Executive agent workspace
a39f816 build: SDR agent workspace — AGENTS.md, TOOLS.md, IDENTITY.md, memory files
3de31cb config: add all seven agent entries, initialise state files
2a0ad76 docs: add commercial architecture reference
982c1a0 infra: enable auto-updater stable channel, add weekly maintenance cron
5c6a4a5 infra: document gateway auto-start via user systemd — linger enabled, reboot gap closed
8356dbf ops: document gateway restart procedure in TOOLS.md
eb102bc memory: session wrap-up 2026-03-03 — config overhaul, four skills installed
96cced2 fix: skill frontmatter to single-line JSON, add to ~/.openclaw/skills/, add extraDirs config
bb57da3 skill: add git-commit-discipline, session-wrap-up, memory-search-on-task-start, discord-post-formatter
```

### command-center repo (`/home/delphi/Documents/code/command-center`)

```
53c4f762 docs: hermes V5 audit report
8062dadf docs: implementation-spec-v6 — market intel, lead CRM, webhook, notifications, proposals+invoices full build, dashboard metrics
7e567212 V5: Make the data real — alerts, kanban, scoring, bulk actions, client health, knowledge write mode, settings tabs, realtime, theme toggle, command palette
fccd94aa docs: v5 — remove HERMES→DB section (wrong role), add sidebar scroll fix
82139e45 docs: implementation-spec-v5 — HERMES→DB integration, alerts, in-app approvals, calibration, reports
564378d0 docs: implementation-spec-v5 — HERMES→DB, alerts, in-app approvals, calibration, reports, mobile, search
d8821285 feat: V4 — Office, Chat, Costs, Gateway, Sessions, Memory, Logs, Audit Log
046d0cbf docs: implementation-spec-v4 — Office view, full agent fleet, chat, cost tracking, gateway config
02a7751b hermes: verification report v3 — post-implementation audit
b89f0844 docs: hermes report v3 — HERMES enforcement + session completion protocol
cd1c2f2f feat: P0 — invoice detail, cursor pagination, schema fixes, approval notes, Zod schemas
717a6b93 docs: implementation-spec-v3 — full engineering bible, V2 audit + mission-control integration
44e043e7 feat: V2 implementation — dashboard KPIs, pipeline advance, approvals actions, knowledge search, settings agents
5178a927 docs: temp-spec-v3 — preliminary, pending V2 verification
5ca05f85 docs: archive superseded MD files — analysis-v1, schema-v1, readme-original
0d1df67e docs: implementation-spec-v2 — full engineering spec for Command Center V2
5de1c236 context: add HERMES report requirement to CLAUDE.md and copilot-instructions
08e61d7f infra: migrations applied, app live on port 9069 — context files updated
da80ced6 context: CLAUDE.md, copilot-instructions, skills, analysis — HERMES review complete
16a69f51 scaffold: context engineering layer structure — CLAUDE.md, copilot-instructions, skills, prompts
e66cf788 docs: hosting updated — PC2 port 9069, SSH tunnel + Tailscale access
405e9845 docs: full architecture specification — schema, stack, backoffice, open questions
7127bf40 hello delphi
```

---

*Compiled by HERMES — 2026-03-04 — Full session log for Boss review.*
