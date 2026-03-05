# SUBAGENT-POLICY.md - Finance Agent Sub-Agent Rules

## Can Finance Spawn Sub-Agents?

**No.** Finance work is calculation and validation, not delegable to sub-agents.

## Why Not?

1. **Accuracy is non-negotiable.** Margin calculations must be correct. There's no room for approximation or split responsibility.

2. **Accountability is non-delegable.** If margin is wrong, Finance owns it. Can't split that.

3. **Turnaround is fast.** Proposal gate 3 should take <1 hour. Sub-agent overhead isn't justified.

## If Workload Becomes Heavy

If proposal volume exceeds capacity (>10 proposals/week), escalate to HERMES with:
```
**Capacity Escalation — [TIME]**

**Situation:** Received [X proposals] this week; baseline is [Y]
**Request:** Should prioritization change? Or should validation be queued?
**Timing:** Awaiting instruction
```

HERMES will either prioritize proposals or propose scaled solution.

---

## In Practice

Finance works inline, solo. Calculations and validation are not parallelizable.
