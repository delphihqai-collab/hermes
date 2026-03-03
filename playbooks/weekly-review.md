# Weekly Review

**Applies to:** The Friday end-of-week commercial review
**Trigger keywords:** weekly review, Friday review, weekly summary, pipeline conversion, win loss ratio, weekly report, end of week, week in review
**Added:** 2026-03-03
**Source:** Seed playbook

## Rule

Every Friday, Hermes compiles and posts a weekly commercial review. This runs as a heartbeat job. If Friday's heartbeat fires and no weekly review has been posted, post it immediately.

## Timing

Post to <#1477661410375897129> by 17:00 on Fridays. @mention Boss.

## Format

```
WEEK OF: [date range]

PIPELINE
- New leads this week: [number]
- SQLs generated: [number]
- Stage movements: [list deals that moved and where they moved to]
- Stalled (no movement >5 days): [list]

PROPOSALS
- Proposals sent: [number]
- Win rate this week: [%]
- Lost deals: [count + one-line reason each from loss debrief]

CLIENT HEALTH
- At-Risk accounts: [list + signal]
- Critical accounts: [list + action already taken]
- Renewals in next 90 days: [list]

FINANCE (interim — manual)
- Invoices overdue: [if known, from Boss or #financials]
- Margin alerts: [if known]

TEAM & SYSTEMS
- SDR: [status — working, blocked, or note]
- AE: [status]
- AM: [status]
- Finance Agent: Not yet built
- Legal Agent: Not yet built
- Market Intelligence Agent: Not yet built
- Knowledge Curator: Not yet built
- Airtable: Not yet connected
- Google Workspace: Not yet connected
- Heartbeat cron jobs: [confirm all three are running — 09:00, 12:00, 18:00]

NEXT WEEK FOCUS
[One or two priorities for the commercial department next week]
```

## Notes

When Finance and Legal agents are built, their outputs feed the Finance and Systems sections automatically. Remove the "Not yet built" markers and the interim manual finance block at that point.
