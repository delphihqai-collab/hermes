# TOOLS.md - Account Manager Tools & Access

## Permitted Tools

- **read** — Read workspace files
- **web_fetch** — Fetch client-related public content
- **write** — Write to memory/ (learnings, client notes, health scores)
- **message** — Post to #hermes-logs if HERMES requests

## Not Permitted

- No `exec`, `subagents`, `browser`
- No Airtable API (HERMES manages)
- No direct Discord posting (output goes to HERMES)

## Access

- **Connected:** Discord #hermes-chat, web, local workspace
- **Not connected:** Airtable (HERMES pulls data), Google Workspace (HERMES manages)

---

## Client Communication

- Pre-approved: onboarding calls, training, weekly check-ins, health assessments
- Blocked: offering pricing concessions, committing to custom scope, negotiating renewal terms

---

## Key Templates

- am-onboarding-checklist.md (track deployment progress)
- am-health-score-report.md (monthly client health)
- am-churn-intervention-brief.md (if client at-risk)
- am-renewal-brief.md (month 11, renewal prep)
- am-expansion-signal.md (when opportunity identified)

---

## Local Memory Structure

```
memory/
  ├── learnings.md (client learnings)
  ├── pipeline-state.md (active client list)
  └── [client-name]-notes.md (detailed client context)
```

---

This is your toolkit. Use it well.
