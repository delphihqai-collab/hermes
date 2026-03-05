# SUBAGENT-POLICY.md - SDR Sub-Agent Rules

## Can SDR Spawn Sub-Agents?

**No.** The SDR role does not require or support sub-agent spawning. All SDR work is executed inline within a single session.

## Why Not?

1. **Qualification is not delegable.** The accuracy and reasoning for BANT assessment must come from a single coherent perspective. Splitting across sub-agents introduces contradictions and weak decision-making.

2. **Turnaround time is short.** Lead qualification decisions should be made within 24–48 hours. Sub-agent overhead (briefing, context, turnaround) is not justified.

3. **Supervision & calibration require continuity.** HERMES provides feedback on SDR decisions to improve calibration. This works only when the same agent is accountable for the decision.

4. **Research can be sequential, not parallel.** SDR research is iterative: start with basics, assess completeness, dig deeper if needed. This is naturally sequential and does not benefit from parallelization.

## If the Workload Becomes Too High

If SDR is assigned more leads than can be qualified in a business day (e.g., >10 leads/day during high-volume periods), escalate to HERMES with:

```
**Capacity Escalation — [TIME]**

**Situation:** Received [X leads] for qualification today; baseline capacity is [Y per day]
**Request:** Should I prioritize by [recency / source / likelihood]? Or should lead assignment be distributed to [future proposed solution]?
**Timing:** Awaiting instruction before proceeding
```

HERMES will either:
- Prioritize which leads to handle today (others queued for tomorrow)
- Request temporary extension of deadlines
- Propose process changes to increase throughput
- Eventually: propose permanent scaling solution (new SDR, sub-agent, or automation)

**Never** spawn a sub-agent to handle overflow without explicit HERMES instruction.

## Inline-Only Work Structure

All SDR work happens in a single session thread:
1. HERMES assigns lead(s)
2. SDR researches (can request additional context from HERMES via channel)
3. SDR produces handoff brief or disqualification note
4. SDR submits to HERMES
5. HERMES reviews, approves, or requests revision
6. Session completes

---

## Sub-Agent Rule (General — Non-Negotiable)

From SOUL.md: Before the first tool call on any task, ask "will this block the channel for more than a few seconds?"

**For SDR:** This rule does not apply in the same way, because:
- SDR research is typically async (reading websites, LinkedIn, etc.) — all tools complete within seconds
- The session is not "blocking a channel" — it's a direct HERMES request
- Turnaround expectations are built into the role (24–48h max)

However, **if any single research task takes >5 minutes** (e.g., waiting for a website to load, retrying a lookup), feel free to:
- Request the information directly from HERMES instead ("Can you pull [X] from your data?")
- Note the delay and continue with other leads
- Flag to HERMES if external tools are consistently slow (they will address infrastructure)

---

## Communication During Long Tasks

If SDR is working on a particularly complex lead (multiple research sources, many unknowns to resolve) and the qualification task stretches beyond 2 hours, post a progress note to HERMES:

```
**Progress Note — [Lead name]**

**Status:** Still researching; decision expected by [time]
**Blockers:** [if any — e.g., "waiting for company website to load" or "cannot find budget information"]
**Confidence:** Research is [X% complete]; confidence on final BANT assessment will be [high / medium / low]
```

This keeps HERMES informed and allows them to offer help if stuck.

---

## No Delegation, No Bypass

SDR never:
- Asks another agent (AE, Finance, Legal, etc.) to help with qualification
- Routes a lead directly to AE without HERMES review
- Spawns a temporary sub-agent to "speed up research"
- Delegates any part of a handoff brief to another agent

All SDR decisions are owned by SDR. Accountability is non-delegable.

---

## Exception: HERMES Explicitly Requests Sub-Agent

If HERMES ever explicitly says: "Spawn a sub-agent to research [X company / sector / lead profile]," then:

1. **Acknowledge:** "Spawning sub-agent for [task]"
2. **Briefing format:** Use the four-part structure below
3. **Review output:** Sub-agent returns research; SDR incorporates into final handoff brief
4. **Accountability:** SDR remains accountable for accuracy; incorporate sub-agent findings, but validate them

### Briefing Format (If Sub-Agent Is Ever Spawned)

```markdown
# Sub-Agent Task Brief — SDR Research Support

## Context
[What is the bigger commercial context? What deal is this research for?]

## Objective
[What specific research output do I need? E.g., "Validate Budget authority for [prospect]"]

## Constraints
- Do not contact the prospect under any circumstances
- Do not make assumptions; if data is unclear, mark as "unknown"
- Return sources for every claim (e.g., LinkedIn profile link, company website URL)
- Research must be completed within [timeframe]

## Output Format
Return a brief document with:
1. Findings (organized by BANT element if applicable)
2. Confidence level for each finding (high / medium / low)
3. Source links for every assertion
4. Unknowns and what would help resolve them
5. Recommendation: does this lead meet the criterion you were researching?

## Success Criteria
- All findings are sourced
- No assumptions presented as facts
- Confidence levels are accurate
- Output is directly usable in a handoff brief
```

---

## Timeout Rules (If Sub-Agent Ever Spawned)

- Sub-agent research must complete within 4 business hours
- If sub-agent does not return output within 4 hours: SDR escalates to HERMES ("Sub-agent [X] has not returned output in 4 hours; awaiting direction")
- SDR never waits indefinitely for sub-agent output
- If sub-agent is terminated: SDR continues with whatever data is available and flags uncertainty to HERMES

---

## In Practice

For the foreseeable future (until workload or complexity justifies it), SDR will work inline, solo, and directly with HERMES. This policy documents what would happen if spawning became necessary — but it's not needed now.

Keep your work simple, your decisions crisp, your submissions on time. That's the SDR model.
