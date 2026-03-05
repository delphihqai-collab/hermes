# MEMORY.md - SDR Knowledge & Calibration

## Context — Delphi Stage & Market

**Company:** Delphi — AI process automation for SMEs
**Stage:** Pre-revenue / validation phase (March 2026)
**Product:** Reusable sector-specific automation templates + per-case customization
**Target Sectors:** Dental, Health (GDPR-sensitive)
**Closing Range:** EUR 250–350/month
**Status:** Zero active clients yet; building pipeline for validation phase

## ICP Definition — Current

**Populated after first deal validates pattern. Until then:**

### Confirmed Criteria (Interim)
- **Sector:** Dental or Health (hospitals, clinics, practices)
- **Size:** 5–50 employees (SME range, not enterprise)
- **Pain point:** Manual workflows, compliance burden (GDPR), operational inefficiency
- **Decision cycle:** 30–90 days
- **Budget authority:** Finance manager or practice owner (confirmed authority required)

### Under Observation (Candidates)
- Adjacent health sectors: physiotherapy, veterinary, psychology practices
- Administrative-heavy SMEs outside healthcare: law firms, accounting practices
- Retail with complex compliance (e.g., personal care shops with data handling)

### Common Objection & Response Pattern
**"We already have a system"** (very common in dental)
- **Reframe:** Delphi is not replacing their system. It's the compliance and automation layer on top.
- **Angle:** GDPR exposure in their current workflow; Delphi reduces risk while adding efficiency.
- **Flag:** If prospect is satisfied with current system AND has no GDPR concerns, they may not be a fit.

---

## Role-Specific Patterns

### What Makes a Strong Handoff Brief
- Every BANT field populated or explicitly marked "unknown — AE discovery"
- Confidence level noted for each BANT element (high = multiple sources, medium = primary source only, low = single indicator)
- Research source documented (LinkedIn, company website, news, referral source)
- At least one specific pain point identified (not generic "they need automation")
- Clear decision: QUALIFIED or DISQUALIFIED, with reason if the latter
- AE handoff notes: what the AE should know before first call

### What Causes HERMES to Reject a Brief
- Blank fields instead of "unknown"
- Decision made on intuition, not against BANT checklist
- No research source cited
- Prospect from untrusted source (e.g., purchased list, no validation)
- Contradictory data in the brief (e.g., "no budget" but flagged as qualified)

### Research Sources — Reliability Ranking
1. **High confidence:** Company website, LinkedIn company page, press releases, direct prospecting signal (website form, referral)
2. **Medium confidence:** LinkedIn individual profiles, industry news, company reviews (Glassdoor, Trustpilot)
3. **Low confidence:** Purchased email lists, industry databases, secondary sources (older articles)
4. **Do not use:** ChatGPT-generated prospect lists, unvalidated data, hearsay

### Disqualification Patterns That Worked
- **Budget:** Prospect explicitly stated freeze until Q3 or later (future requalification trigger set)
- **Authority:** Contact is user, not decision-maker, and they cannot introduce me to one
- **Need:** Prospect has no GDPR exposure (e.g., completely offline, paper-based)
- **Timeline:** Prospect is researching "for the future" with no active project (requalify in 6 months)
- **Sector:** Outside confirmed dental/health; insufficient data to assess fit

---

## Sector Intelligence — Dental/Health

### Dental Practices (Most Common Prospect Type)
- **Decision maker:** Practice owner or office manager
- **Budget:** Usually 2–5% of practice revenue allocated for tools/services
- **Typical pain:** Patient data management, appointment scheduling, compliance documentation
- **GDPR exposure:** High (EU practices must comply; UK practices under UK GDPR)
- **Buying cycle:** 6–12 weeks (careful, conservative)
- **Objection:** "We already have [Denticore / Exact / similar software]" → Position Delphi as a layer, not a replacement

### Health Clinics (Hospital departments, physiotherapy, etc.)
- **Decision maker:** Department head or IT director (more formal)
- **Budget:** Part of larger organizational budget; must justify ROI
- **Typical pain:** Cross-department data flow, compliance, manual reporting
- **GDPR exposure:** Very high (strict regulations)
- **Buying cycle:** 8–16 weeks (formal approval process)
- **Objection:** "We are compliant already" → Request audit of their process; many are compliant-in-name-only

### Cross-Sector Patterns
- **Prospect research takes longer in health.** Respect it. Decision-makers are harder to reach and verify.
- **Compliance angle is stronger than efficiency angle** in first conversation.
- **Referrals from existing clients** (once we have them) will be the strongest source.
- **Cold outreach conversion is lower** than other sectors; quality of brief matters more.

---

## Client Signals & Readiness Indicators

### Strong Qualification Signals
- Prospect searched for "GDPR + automation" or similar
- Prospect is currently in audit or compliance review
- Prospect recently changed practice management software (open to adding tools)
- Prospect was referred by someone in the sector we trust
- Prospect has recently hired a compliance officer or similar role

### Warning Signals (Still Qualify, but Note)
- Prospect has frozen hiring (may freeze budget too)
- Prospect is in acquisition/merger talks
- Prospect recently failed an audit (urgent, but may not have budget)
- Prospect is very small (<5 employees) — may lack budget authority clarity
- Prospect is in legacy system lock-in (expensive to change)

### Disqualification Signals (Hard No)
- Prospect explicitly said "not interested in new tools"
- Prospect budget is zero (no discretionary spend)
- Prospect is outside dental/health and we have no sector fit data yet
- Prospect data is stale (>6 months old) and cannot be refreshed
- Prospect is a known competitor or has bad history with Delphi

---

## Learnings Registry

### Calibration Notes by Pattern
Keep this section updated after every qualified/disqualified lead. Log:
- What pattern led to the qualification decision?
- What data was most useful?
- What assumptions did we make?
- Did HERMES accept or correct the decision?

**Format for each entry:**
```
## [DATE] — [LEAD NAME]
**Qualification:** [QUALIFIED / DISQUALIFIED]
**BANT Score:** [B / A / N / T scores, 0–4 each, 4/4 = qualified]
**Data confidence:** [which fields were high/medium/low confidence?]
**Research time:** [hours spent]
**HERMES feedback:** [accepted / revised / rejected — what did they say?]
**Lesson:** [what did this teach us about ICP fit or research process?]
```

### Common Mistakes
*Document these as you encounter them; update monthly.*

---

## Templates & Reference Paths

### Handoff Brief Template
Path: `workspace/templates/commercial/sdr-handoff-brief.md`
Use this for every qualified lead. Complete every section.

### Disqualification Note Template
Path: `workspace/templates/commercial/` (if separate file exists; otherwise use format in AGENTS.md)

### Airtable Schema (When Connected)
Fields to maintain:
- Company name, contact name, contact role, contact email
- Lead source, lead date, SDR researcher
- BANT scores (B / A / N / T)
- Sector / sector fit notes
- Status (Prospecting / Qualification / SQL / Disqualified)
- Disqualification reason (if applicable)
- Next review date (for requalification candidates)

---

## Pipeline State

Maintain `memory/pipeline-state.md` with current totals:
- Leads assigned this month
- Leads qualified (SQL handed off)
- Leads disqualified
- Leads in active qualification (pending decision)
- Win/loss ratio so far (once AE data is available)

Update weekly.

---

## Cross-Department Context

### HERMES (Your Manager)
- Owns the overall pipeline strategy
- Reviews every handoff brief before it goes to AE
- Makes all ICP expansion / qualification standard changes
- Escalates to Boss on major decisions

### Account Executive (Your Downstream)
- Receives handoff briefs from HERMES only (not directly from you)
- Conducts discovery; may ask HERMES clarifying questions about your research
- Converts SQLs to meetings, then proposals
- Provides feedback loop: which handoffs converted? Which stalled?

### Boss (Pedro)
- Final authority on ICP definition, qualification standards, sector expansion
- Approves all external outreach before it goes to prospects
- Reviews major escalations from HERMES

---

## Known Constraints & Workarounds

### No CRM API Yet (Airtable)
**Constraint:** SDR cannot directly pull lead data from Airtable.
**Workaround:** Request lead data from HERMES; maintain local research notes.
**Timeline:** Will be resolved when Airtable is connected to OpenClaw.

### No Outreach Capability
**Constraint:** SDR cannot send emails, LinkedIn messages, or any external contact.
**Constraint:** AE is responsible for outreach; SDR only qualifies.
**This is intentional:** Separation of duties ensures objectivity in qualification.

### Limited Market Intelligence
**Constraint:** SDR does not have access to Market Intelligence reports yet.
**Workaround:** Leverage publicly available sources (LinkedIn, company websites, news). If specialized intel is needed, flag to HERMES.

---

## Monthly Calibration Cadence

**Every month (1st Friday, 14:00 WET):**
1. SDR pulls monthly learnings (from memory/learnings.md)
2. SDR reviews accuracy: which handoffs converted? Which stalled?
3. SDR suggests ICP refinements or qualification standard tweaks
4. HERMES provides feedback, confirms calibration adjustments
5. Updated calibration rules logged in AGENTS.md

---

## Monthly Goals (Until Calibration Complete)

- Generate 5–10 SQL handoff briefs per month (volume)
- Maintain 100% brief completeness (no blank fields; every unknown marked explicitly)
- Achieve <5% disqualification reversal rate (HERMES rejects my disqualification decision)
- Maintain >80% accuracy (handed-off leads that convert to AE meetings)

Once these are consistently met, calibration gate is passed and SDR moves to ACTIVE status.

---

This file is your memory across sessions. Update it after every major task. HERMES reads this to understand your calibration state.
