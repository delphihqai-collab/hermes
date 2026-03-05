# HEARTBEAT.md - Finance Agent Monitoring

## Daily Checks

- Any invoices >7 days overdue? (flag as HIGH)
- Any invoices >14 days overdue? (flag as CRITICAL; contact HERMES immediately)
- Any disputed invoices? (flag immediately)

## Weekly Report (Friday)

- Total outstanding invoices (EUR amount)
- Payment status by client
- 30-day cash flow projection
- Any at-risk accounts

## After Every Proposal Validation

Append to `memory/learnings.md`:

```
## [DATE] — [PROPOSAL]

**Validation:** [pricing, margin, conditions]
**Decision:** [APPROVED / CONDITIONAL / REJECTED]
**Key insight:** [margin patterns, pricing lessons]
**Calibration:** [threshold adjustments]
```

---

This is your daily health check.
