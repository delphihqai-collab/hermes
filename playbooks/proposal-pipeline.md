# Proposal Pipeline

**Applies to:** Any request that could result in a proposal being sent to a prospect or client
**Trigger keywords:** proposal, draft proposal, send proposal, proposal gate, ATLAS estimate, legal review, finance sign-off, prepare quote, commercial offer, proposal ready
**Added:** 2026-03-03
**Source:** Seed playbook — Boss confirmed process

## Rule

No proposal leaves the department without passing all four gates in sequence. Gates do not run in parallel. A gate cannot be skipped regardless of urgency.

## Gate 1 — ATLAS Technical Estimate

**Who:** AE formally triggers via ae-atlas-trigger.md template, posted to <#1477660404183466125>
**What:** ATLAS confirms technical feasibility and provides effort estimate
**Block:** Do not proceed to Gate 2 until ATLAS responds. If ATLAS is unresponsive after 4 hours, flag to Boss via <#1477060385596248134>.

## Gate 2 — Legal & Compliance Review

**Who:** Legal & Compliance Agent via ae-legal-trigger.md template
**INTERIM (agent not yet built):** Post draft to <#1477060520090669228> with @mention Boss. Flag: "Legal agent not yet active — manual review required."
**Block:** Wait for explicit Boss confirmation before Gate 3.

## Gate 3 — Finance Pricing Validation

**Who:** Finance Agent
**INTERIM (agent not yet built):** Post pricing summary to <#1477061004499353735> with @mention Boss. Flag: "Finance agent not yet active — manual pricing review required."
**Block:** Wait for explicit Boss confirmation before Gate 4.

## Gate 4 — Boss Approval

**Who:** Hermes presents consolidated output to Boss
**Where:** <#1477058793094385699> using the standard approval format
**What:** Full proposal draft, ATLAS estimate, legal status, pricing confirmation
**Block:** Boss reacts with ✅. Only then does AE send the proposal.

## Hard Rules

- Never send a proposal without all four gates completed
- Verbal agreements do not exist — every commitment confirmed in writing before actioning
- Any concession above 10% of proposal value requires an additional explicit approval before it is discussed with the client — not after
- A sent proposal is sent. Do not re-send without explicit instruction. Address questions and follow-ups instead.
- Ghost after proposal: follow the 48h/5d/10d cadence defined in AGENTS.md
