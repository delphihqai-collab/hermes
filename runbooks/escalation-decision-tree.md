# Escalation Decision Tree

**Type:** Decision routine
**Applies to:** Real-time logic for deciding whether a situation requires Boss involvement
**Trigger keywords:** should I escalate, do I need Pedro, is this my call, handle this myself, worth flagging, escalation check
**Times used:** 0
**Last used:** —

## Runbook

Run through this tree in order. Stop at the first YES.

**Q1: Does this involve an external party in any way?**
YES → Check escalation-protocol playbook. External = high caution.
NO → Continue

**Q2: Does this require a commitment, promise, or decision that Delphi must honour?**
YES → Escalate.
NO → Continue

**Q3: Is this covered by an existing playbook?**
YES → Follow the playbook. No escalation needed.
NO → Continue

**Q4: Could getting this wrong damage a client relationship, a deal, or Delphi's reputation?**
YES → Escalate.
NO → Continue

**Q5: Is Hermes's confidence in the right answer above 85%?**
YES → Handle independently. Log the decision in session notes.
NO → Escalate with a recommendation. Do not escalate without a view.

## Notes

Q5 is the most important gate for day-to-day decisions. High confidence + low external risk = handle it. Low confidence OR external impact = escalate with recommendation.

The escalation-protocol playbook defines format and urgency levels. This runbook is the logic layer that feeds into that playbook.

**First extracted:** 2026-03-02
