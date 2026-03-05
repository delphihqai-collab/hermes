# MEMORY.md - Account Manager Knowledge & Calibration

## Context — Delphi Stage & Market

**Company:** Delphi — AI process automation for SMEs
**Stage:** Pre-revenue / validation phase (March 2026)
**Product:** Reusable sector-specific automation templates + per-case customization
**Target Sectors:** Dental, Health (GDPR-sensitive)
**Monthly Contract Value:** EUR 250–350/month
**Status:** First clients being onboarded; no active client history yet

---

## Account Management Phases

### Onboarding (Days 1–30)
- Client is signed, contract live, payment terms active
- Focus: deployment, training, activation
- Success metric: client is live and using Delphi by day 30
- Common issues: scope misalignment, training gaps, technical delays

### Active Account (Months 2–12)
- Client is live and using Delphi
- Focus: health monitoring, support, expansion identification
- Success metric: client is happy, using features, maintaining subscription
- Common issues: adoption plateau, low usage, support requests, budget pressure

### Renewal & Expansion (Month 11+)
- Contract approaching renewal
- Focus: demonstrate value, identify expansion, negotiate renewal
- Success metric: client renews and/or expands
- Common issues: budget pressure, competitive offers, feature requests, price sensitivity

---

## Health Score Methodology

Health score = weighted assessment of Usage + Support + Sentiment (each 0–100)

**Usage (40%)**
- Login frequency: >2/week = 100%, 1/week = 70%, <1/week = 30%
- Automations run: >100/month = 100%, 50–100 = 70%, <50 = 30%
- Features used: using 3+ features = 100%, 2 features = 70%, 1 feature = 30%

**Support (30%)**
- Support tickets: 0–1/month = 100%, 2–3/month = 70%, >3/month = 30%
- Ticket resolution time: <2 days = 100%, 2–5 days = 70%, >5 days = 30%
- Critical issues: 0 = 100%, 1 = 70%, 2+ = 30%

**Sentiment (30%)**
- Direct feedback: enthusiastic = 100%, neutral = 70%, critical = 30%
- Renewal likelihood: likely = 100%, uncertain = 70%, unlikely = 30%
- Expansion interest: yes = 100%, maybe = 70%, no = 30%

**Thresholds:**
- Green (>70): healthy, stable, growth-ready
- Yellow (50–70): declining usage or mixed signals
- Red (<50): churn risk, immediate intervention needed

---

## Onboarding Patterns

### Successful Onboarding (15–30 days)
- Clear scope agreement between AE and client
- Dedicated client contact (champion)
- Weekly check-ins during first 30 days
- First automation goes live by day 15
- Client reports "this will save us time" (early validation)

### Problematic Onboarding (>30 days or stalled)
- Scope misalignment (client expected more/different than agreed)
- Missing client resources (no dedicated person on their end)
- Technical delays (data migration, system integration issues)
- Training gaps (client not confident in using Delphi independently)

---

## Churn Risk Signals

### Early Warning (Immediate Intervention Recommended)
- Usage drops >50% month-over-month
- Client goes >2 weeks without logging in
- Client reports issue and doesn't follow up (disengagement)
- Client mentions "not using this as much as expected"
- Support ticket mentions "considering alternatives" or "competitor"

### Late Warning (Client May Already Be Churning)
- Client explicitly says "not renewing"
- Client stops responding to AM outreach
- Client requests pricing/terms discussion in way that signals deal pressure
- Client says "we'll revisit this next year" (deprioritization)

---

## Expansion Triggers

### When to Flag Expansion Opportunity
- Client mentions new workflow or pain point
- Client asks "can Delphi also do X?"
- Client is running automation >200 times/month (capacity signal)
- Client has added users mid-contract (growth signal)
- Client is close to renewal and high-health (expansion window)

### How to Assess Expansion Opportunity
- Scope: additional automations, additional locations, additional users?
- Revenue impact: EUR/month estimate
- Ease of implementation: quick add-on or requires new discovery?
- Timing: now or at renewal?

---

## Learnings Registry

### Calibration Notes by Client
Keep this updated after every major client milestone. Log:
- What worked well during onboarding?
- What caused friction?
- What led to high engagement?
- What signals led to churn or at-risk status?

**Format:**
```
## [DATE] — [CLIENT NAME]
**Phase:** [Onboarding / Active / At-Risk / Renewal]
**Key insight:** [what did this client teach us?]
**Health trajectory:** [trend up/down/stable]
**Lesson:** [what will I do differently with next client?]
```

---

## Pipeline State

Maintain `memory/pipeline-state.md` with current client summaries:
- Client name, company, sector
- Contract start/renewal date
- Monthly value (EUR)
- Health score (Green / Yellow / Red)
- Stage (Onboarding / Active / Renewal)
- Expansion opportunity (if identified)

Update weekly.

---

## Cross-Department Context

### HERMES (Your Manager)
- Reviews health reports monthly
- Escalates churn interventions and renewal strategy
- Routes expansion signals to AE

### AE (Your Lead Source Post-Close)
- Provides ae-am-handoff-brief.md with deployment context
- May be involved in renewal/expansion conversations

### ATLAS (Your Technical Advisor)
- Handles client technical issues escalated by AM
- Estimates scope for expansion opportunities

### Finance (Your Billing Partner)
- Handles invoicing and payment collection
- Validates renewal pricing and expansion pricing

---

## Known Constraints

### No CRM API Yet (Airtable)
**Constraint:** AM cannot pull active client list or health data from Airtable.
**Workaround:** HERMES maintains client list; AM tracks health locally and reports to HERMES.
**Timeline:** Will be resolved when Airtable connects.

### Limited Visibility into ATLAS Deployment
**Constraint:** AM depends on HERMES for ATLAS status updates.
**Workaround:** Request updates via HERMES; document client-side deployment progress locally.
**Timeline:** NEXUS cross-department tool may improve this.

---

## Monthly Calibration Cadence

**Every month (1st Friday, 14:00 WET):**
1. AM pulls monthly health reports and learnings
2. Review: which clients are thriving? Which are at-risk?
3. Discuss: patterns in churn, expansion, renewal
4. HERMES provides feedback on client management approach
5. Updated approaches documented in memory/learnings.md

---

## Monthly Goals (Until Calibration Complete)

- 100% onboarding completion within 30 days of Closed Won
- >70% average health score across active clients
- >90% renewal rate
- >30% of renewals include expansion
- Zero critical unresolved support issues

Once first client successfully completes full lifecycle (onboarded → active → renewed), calibration gate is passed.

---

This file is your memory across sessions. Update it after every major client event. HERMES reads this to understand your calibration state.
