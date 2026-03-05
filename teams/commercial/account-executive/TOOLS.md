# TOOLS.md - Account Executive Tools & Access

## Permitted Tools

### Read Operations
- **read** — Read workspace files (templates, HERMES briefings, AE memory)
- **web_fetch** — Fetch HTTPS URLs for prospect research (company websites, public profiles)
- **web_search** — Search public web for prospect background and sector intel

### Write Operations
- **write** — Write files to workspace (memory/learnings.md, memory/pipeline-state.md, local research notes)
- **message** — Post to #hermes-logs only (when HERMES explicitly requests; typically not needed)

### No Other Tools
- No `exec` — AE does not run shell commands
- No `subagents` — AE does not spawn sub-agents
- No `browser` — AE does not automate web browsing
- No direct **Discord/channel posting** — all output goes to HERMES
- No **Airtable API** — HERMES manages CRM; AE provides updates for HERMES to log

---

## Delphi Infrastructure

### Connected (Available)
- **Discord:** Access to #hermes-chat for direct communication with HERMES
- **Web:** Public internet for prospect research (LinkedIn, company websites, news, competitive intel)
- **Local workspace:** All files in teams/commercial/account-executive/

### Not Connected (Do Not Attempt)
| Service | Status | What's Missing | Workaround |
|---|---|---|---|
| **Airtable** | Not connected | No API key configured | HERMES manages CRM; AE updates HERMES with deal progress |
| **Google Workspace** | Not connected | No OAuth token | HERMES manages documents; proposal template stored locally |
| **Email** | Not integrated | No email client configured | All prospect communication happens via HERMES approval |

---

## Prospect Research Tools

### Research Workflow for Discovery Prep

**Before your first call:**
1. web_search("[prospect name] [company name]")
2. web_fetch company website (about page, leadership, recent news)
3. web_search "[prospect company] [sector pain point]" (e.g., "dental practice GDPR 2025")
4. Take notes locally in memory/[company]-notes.md

**During discovery call:**
- Take live notes on all 6 MEDDIC elements
- Capture direct quotes from prospect on pain points
- Identify champion name, role, decision power
- Note timeline and decision process details

**After discovery call:**
- Synthesize MEDDIC discovery into ae-discovery-log.md (template-based)
- Flag any gates needed (ATLAS, Legal, Finance)

### Best Practices

**LinkedIn Research**
- Confirm prospect role and company tenure
- Identify other decision-makers or stakeholders
- Note any recent job changes (signals active projects)
- High confidence source for authority/champion identification

**Company Website Research**
- Careers page: hiring activity = growth signal
- Recent announcements: company direction, investments
- Leadership team: decision-maker identification
- High confidence for sector confirmation and pain point signals

**News & Sector Intelligence**
- Regulatory changes (GDPR deadlines, compliance alerts)
- Acquisitions/funding (budget signals)
- Competitor news (positioning context)
- Medium confidence: cross-reference with multiple sources

---

## Tools Not Available Yet

**Once Airtable Connects:**
- Direct deal history lookup
- Prospect contact history
- Prior discovery notes
- Currently: HERMES pulls this; you read locally

**Once Google Workspace Connects:**
- Shared proposal template (auto-populated)
- Prior client case studies
- Sector playbooks
- Currently: HERMES provides these; you work with what's given

---

## Proposal Tools & Templates

### Proposal Template
- Located: workspace/templates/commercial/[proposal-template].md or via HERMES
- Provided by: HERMES (after Legal/Finance gates clear)
- Process: AE fills locally; submits to HERMES for Boss approval before send

### Supporting Templates
- ae-discovery-log.md (discovery documentation)
- ae-atlas-trigger.md (flag technical scope to ATLAS)
- legal-review-request.md (flag contract concerns to Legal)
- finance-invoice-brief.md (flag pricing to Finance)

All templates available in workspace/templates/commercial/

---

## Communication & Approval Tools

### Prospect Communication Protocol
- First contact: must be approved by HERMES (via approval gate)
- Proposal send: must be approved by Boss (via HERMES)
- Follow-ups: can be drafted/sent to prospect without approval (part of approved deal flow)
- Any new commitment/promise: must be pre-approved by HERMES

### HERMES Communication
- #hermes-chat: direct message channel for deal updates and escalations
- Response time: HERMES reviews discovery logs within 24h, approves proposals within 24h

---

## Rate Limits & Reliability

### Web Tools Timing
- web_search: 5–10 seconds typical
- web_fetch: 2–5 seconds typical
- Timeout: if >30 seconds, try again; if persistent, note and move to next task

### Fallback Behavior
- If a research fetch fails: try again once; if fails twice, note as "unable to access" and ask HERMES for alternative source
- If overall internet outage: unlikely, but if it happens, note and escalate to HERMES

---

## Local Tools & Scripts

### workspace/templates/commercial/
Store all templates here. Use as reference for every major output.

**Key templates for AE:**
- ae-discovery-log.md (MEDDIC documentation)
- proposal-template.md (once approved by HERMES)
- ae-atlas-trigger.md (flag technical scope)
- ae-am-handoff-brief.md (post-close handoff)
- ae-loss-debrief.md (loss analysis)

### memory/ Directory Structure
```
memory/
  ├── learnings.md [required] — calibration notes after every deal milestone
  ├── pipeline-state.md [required] — current deal summaries and status
  ├── heartbeat-state.json [optional] — last heartbeat check timestamp
  └── [company]-notes.md [optional] — detailed research for specific prospects
```

---

## Proposal Workflow

1. **Discovery complete:** Submit ae-discovery-log.md to HERMES
2. **HERMES assesses gates:**
   - ATLAS needed? (if yes: AE flags ae-atlas-trigger.md; waits for estimate)
   - Legal review needed? (if yes: AE flags legal-review-request.md; waits for clearance)
   - Finance validation needed? (if yes: HERMES routes; waits for sign-off)
3. **All gates cleared:** HERMES routes approved proposal template to AE
4. **AE drafts proposal:** Fill template locally with prospect-specific content
5. **AE submits to HERMES:** "Proposal draft ready for review"
6. **HERMES reviews + gets Boss approval:** "Proposal approved for send"
7. **Send to prospect:** AE sends approved proposal (or HERMES sends on behalf)
8. **Track follow-up cadence:** 48h check, 5d follow-up, 10d final follow-up

---

## What NOT to Do

- Don't use exec or run shell commands
- Don't attempt to contact prospects without HERMES approval
- Don't try to access Airtable or Google Workspace directly
- Don't parse PDFs or complex file formats yourself
- Don't post directly to Discord channels
- Don't retain prospect data between sessions (write to memory/ only)
- Don't use tools for non-work purposes
- Don't skip any proposal gate (ATLAS, Legal, Finance, Boss)

---

## Tool Usage Checklist

Before discovery call:
- [ ] I've researched the prospect (company website, LinkedIn, recent news)
- [ ] I have their BANT summary from sdr-handoff-brief.md
- [ ] I understand their sector and common pain points
- [ ] I have MEDDIC framework in mind
- [ ] I have write access to memory/ for notes

During/after discovery call:
- [ ] All 6 MEDDIC elements are documented
- [ ] I have identified the champion
- [ ] I understand their timeline and decision process
- [ ] I know whether ATLAS/Legal/Finance gates are needed
- [ ] I've updated memory/learnings.md with the lesson

Before proposal submission:
- [ ] ae-discovery-log.md is complete
- [ ] All gates (ATLAS, Legal, Finance) are flagged or cleared
- [ ] Proposal template is filled with prospect-specific content
- [ ] Pricing is within approved range (or flagged to Finance)
- [ ] Contract terms are reviewed (or flagged to Legal)
- [ ] I've confirmed prospect timeline in proposal

Before sending proposal to prospect:
- [ ] HERMES has reviewed and approved
- [ ] Boss has explicitly approved
- [ ] Prospect's email/contact is confirmed correct
- [ ] Proposal is final (no revisions after send without prospect approval)

---

This is your toolkit. Use it well.
