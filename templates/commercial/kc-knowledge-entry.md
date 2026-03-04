# Knowledge Curator — Knowledge Entry
**Template version:** 1.0
**Owner:** Knowledge Curator → HERMES
**Purpose:** Structured format for indexing every closed deal, completed onboarding, and cross-agent synthesis. One entry per event. Entries are appended to the relevant memory file. Quality gate: every entry must be specific enough that a future agent session could use it to immediately improve performance.

---

## ENTRY REFERENCE

**Entry type:** [REQUIRED — Deal Won / Deal Lost / Onboarding Complete / Cross-Agent Synthesis / Ad hoc learning]
**Entry date:** [REQUIRED]
**Company (if deal/onboarding):** [REQUIRED or N/A]
**Source documents used:** [REQUIRED] *e.g. ae-loss-debrief.md, am-onboarding-checklist.md, agent learnings.md*
**Knowledge Curator session date:** [REQUIRED]

---

## SECTION A: DEAL INDEX ENTRY
*(Complete for Deal Won or Deal Lost entries. Skip for other entry types.)*

**Deal outcome:** [REQUIRED — WON / LOST]
**Pipeline stage at close:** [REQUIRED]
**Days in pipeline (total):** [REQUIRED]

**ICP match quality:** [REQUIRED]
- Strongest qualifying criteria: [REQUIRED] *e.g. "Sector fit and need were strongest — dental clinic with confirmed GDPR exposure"*
- Weakest qualifying criteria: [REQUIRED] *e.g. "Timeline was PROBABLE not CONFIRMED — AE had to chase"*
- ICP match score (1–5): [REQUIRED] *1=poor fit, 5=perfect fit*

**Deal velocity — time at each stage:**
| Stage | Days |
|---|---|
| Qualification (SDR) | [REQUIRED] |
| Discovery (AE) | [REQUIRED] |
| Gates (ATLAS/Legal/Finance) | [REQUIRED] |
| Proposal to close | [REQUIRED] |

**What accelerated the deal:** [REQUIRED or "N/A — Lost"] *e.g. "Owner-operator champion with sole authority — no committee. GDPR enforcement news in sector created urgency."*
**What slowed the deal:** [OPTIONAL] *e.g. "ATLAS estimate took 4 days — longer than target"*

**Objections encountered:**
| Objection | How addressed | Outcome |
|---|---|---|
| [OPTIONAL] | | |

**Champion profile:** [REQUIRED] *e.g. "Practice owner, sole decision-maker. Personal pain. No committee. Highest possible champion quality for SME deals."*

**Pricing dynamics:** [REQUIRED] *e.g. "Full price accepted after ROI framing. No discount requested."*

**Loss reason (if Lost):** [REQUIRED if Lost] *e.g. "Price — but AE assessment is delivery uncertainty was the real driver"*
**Good-fit or wrong-fit loss (if Lost):** [REQUIRED if Lost]

**ICP update signal:** [REQUIRED — YES / NO]
If YES, specific signal: [REQUIRED] *e.g. "Solo practices (1 location, <3 staff) showing consistent price sensitivity at EUR 300/month — may need a lower entry tier or different ICP filter"*

**Key learning (one sentence):** [REQUIRED]
*Quality gate: specific enough to change behaviour in the next similar deal.*
*e.g. "Dental deals close fastest when the champion is the practice owner AND a GDPR enforcement event has occurred in their sector recently — stack both signals in SDR qualification."*

---

## SECTION B: ONBOARDING INDEX ENTRY
*(Complete for Onboarding Complete entries. Skip for other entry types.)*

**Health status at Day 30:** [REQUIRED — HEALTHY / AT RISK / CRITICAL]
**Time-to-first-value:** [REQUIRED] *e.g. "Day 8 — first intake form batch processed"*

**Friction points:**
| Day | Friction | Resolution | Time to resolve |
|---|---|---|---|
| [OPTIONAL] | | | |

**What resolved friction:** [OPTIONAL]
**What required escalation:** [OPTIONAL]

**Day 7 signal vs Day 30 outcome:** [REQUIRED]
*e.g. "Day 7: client processed 12 forms, responsive, positive. Day 30: HEALTHY. Day 7 active usage was a strong predictor."*

**Predictive pattern identified:** [OPTIONAL]
*e.g. "Clients who process at least 5 intake forms in Week 1 have been HEALTHY at Day 30 in 100% of cases so far (n=2)."*

**Key learning (one sentence):** [REQUIRED]
*e.g. "SMS gateway testing must be in the pre-launch checklist — delay in Month 1 reduced perceived time-to-value even though the error was resolved quickly."*

---

## SECTION C: CROSS-AGENT SYNTHESIS
*(Complete for weekly synthesis entries. Skip for other entry types.)*

**Synthesis period:** [REQUIRED] *e.g. "Week of 2026-02-24 to 2026-03-04"*
**Agent learnings reviewed:** [REQUIRED — list agents whose learnings.md was reviewed]
**Deals covered:** [REQUIRED] *e.g. "2 Won deals, 1 Lost deal, 2 onboardings"*

**ICP refinement signals:** [REQUIRED or "none this cycle"]
*e.g. "Pattern across 2 Won deals: champion = owner-operator correlates with sub-21-day close. Recommend adding to SDR qualification as a positive signal."*

**Pricing calibration signals:** [REQUIRED or "none this cycle"]
*e.g. "No pricing anomalies. All deals closed at full rate. Margin floor uncalibrated — flag to Finance agent."*

**Process gaps identified:** [REQUIRED or "none this cycle"]
*e.g. "ATLAS estimate turnaround averaging 4.5 days — target is 3. Flag to HERMES for process review."*

**Sector patterns:** [REQUIRED or "none this cycle"]
*e.g. "Both Won deals cited GDPR concern unprompted in discovery. Compliance positioning is resonating in dental sector."*

**Recommended AGENTS.md updates:** [REQUIRED or "none"]
*e.g. "SDR checklist: add 'is champion the owner-operator?' as a positive qualifier (PROBABLE is sufficient). Not a hard gate but a deal velocity predictor."*

---

## QUALITY GATE

*Before submitting this entry, confirm:*
- [ ] Every learning is specific enough to change behaviour in a future session
- [ ] No vague entries (e.g. "deal went well" — unacceptable)
- [ ] ICP updates are clearly flagged for HERMES to review
- [ ] Entry is filed to the correct memory file (knowledge-base.md / onboarding-patterns.md)

---

## HERMES REVIEW

**Entry reviewed by HERMES:** [HERMES to complete]
**Filed to:** [HERMES to complete — knowledge-base.md / onboarding-patterns.md / synthesis archive]
**ICP update flagged to Boss:** YES / NO
**Process changes triggered:** [HERMES to complete or "none"]
**Date:** [HERMES to complete]
