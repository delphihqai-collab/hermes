# AM Health Score Report

Used by: AM → HERMES (every heartbeat, or immediately on Critical)
Rule: Updated every heartbeat for all active clients. Critical tier triggers immediate alert — do not wait for heartbeat.

```
HEALTH SCORE REPORT
────────────────────
Reporting period:    [DD/MM/YYYY — DD/MM/YYYY]
AM:                  [Name]

── ACTIVE CLIENTS ──────────────────────

[Repeat block per client]

Client:              [Name, company]
Health tier:         [Healthy / At Risk / Critical]
Previous tier:       [Healthy / At Risk / Critical / New]
Tier changed:        [Y/N — if Y, what triggered the change]

Usage (last 14 days):
  Core feature activity:    [Active / Low / Zero]
  Last login:               [DD/MM/YYYY]
  Feature engagement:       [Appointment reminders / Consent forms / GDPR docs — which are in use]

Payment status:      [Paid / Overdue N days / Dispute open]
Last AM contact:     [DD/MM/YYYY — type and outcome]
Client responsiveness: [Responsive / Slow / Unresponsive (N messages unanswered)]
Open issues:         [Any complaint, request, or friction unresolved]

Action taken this period: [What the AM did]
Next action:         [Specific — with date]
Escalation required: [Y/N — describe if Y]

[End client block]

── SUMMARY ─────────────────────────────
Total active clients:  [N]
Healthy:               [N]
At Risk:               [N — names]
Critical:              [N — names — flagged immediately if any]
New this period:       [N — names]
Churned this period:   [N — names]
```
