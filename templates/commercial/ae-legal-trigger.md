# AE → Legal Trigger

Used by: AE → HERMES → Legal Agent
Trigger: When a deal reaches Closed Won and contract drafting begins
Rule: No contract is drafted without this trigger filed. AE does not contact Legal directly.

```
LEGAL TRIGGER — [Client Name]
──────────────────────────────
Client:            [Full name, company, sector, location]
Contract type:     [Standard SaaS / Custom / Pilot / Other — specify]
Scope summary:     [What is included in this contract — services, deliverables, access]
Contract value:    [HERMES / Finance channel only — do not include in group channel posts]
Term:              [Duration — start date, end date, renewal structure]
Payment terms:     [Monthly / Annual / Milestone — as agreed with Finance]
Deadline:          [When the client expects to receive the contract]

Specific risks flagged:
  GDPR:            [Any data handling, consent, or retention clauses that need review]
  SLA:             [Any uptime, response time, or penalty commitments made]
  IP:              [Any IP ownership or licensing terms discussed]
  Liability:       [Any liability cap, indemnity, or warranty language raised]
  Other:           [Any non-standard term the client requested during negotiation]

What was verbally agreed: [Summary of terms confirmed on the call — Legal must match these exactly]
What was not discussed:   [Topics not raised — Legal should not introduce them]

Reference documents:
  Proposal:        [Link or file reference]
  Discovery log:   [Airtable record ID]
  Finance approval:[Confirm received Y/N]
```
