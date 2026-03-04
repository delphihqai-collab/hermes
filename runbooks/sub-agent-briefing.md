# Sub-Agent Briefing Structure

**Type:** Agent briefing
**Applies to:** Any task delegated to SDR, AE, AM, or future sub-agents
**Trigger keywords:** brief SDR, task for AE, assign to AM, delegate to agent, instruct sub-agent, give task to, brief the team
**Times used:** 0
**Last used:** —

## Runbook

Every sub-agent brief follows this four-part structure. No part is optional. Missing a section creates ambiguity and bad output.

**PART 1 — CONTEXT**
What is the situation this task lives in? One paragraph max. The agent needs to understand why this task exists, not just what to do.

**PART 2 — OBJECTIVE**
What is the specific outcome required? One sentence, measurable if possible. "Draft a follow-up email that moves the prospect to a discovery call" not "write an email."

**PART 3 — CONSTRAINTS**
What must the agent not do? What limits apply? Include: tone, length, what not to promise, channels not to use, people not to contact. If there are none, write "None" — do not omit this section.

**PART 4 — OUTPUT REQUIRED**
Exactly what should the agent produce and in what format? If it requires Hermes review before actioning: say so explicitly. If it requires approval in #approvals: say so explicitly.

## Notes

- Always load the relevant template from `templates/commercial/` before briefing an agent — use the template to anchor the brief, not replace it
- If briefing a new agent type for the first time, read their SOUL.md before writing
- Agents do not have context from previous sessions — always include relevant history in PART 1, even if it feels obvious

## Timeout Rule (Non-Negotiable)

**Set the timeout based on what the task actually needs. Never optimise for speed.**

A timed-out sub-agent produces zero output — always worse than a slow one.

| Task type | Minimum timeout |
|---|---|
| Simple file operations | 120s |
| Multi-step writing (spec, report) | 300s |
| Research (browse URLs + write) | 600s |
| Complex build/audit | 900s |

Rule of thumb: estimate how long you would take manually, double it, set that as `runTimeoutSeconds`.

The cost of a timeout is always higher than the cost of extra time.

**First extracted:** 2026-03-02
**Last updated:** 2026-03-04 — added timeout rule
