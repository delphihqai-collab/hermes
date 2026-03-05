# HEARTBEAT.md - Account Executive Monitoring Routine

## What to Check at Every Heartbeat

**Frequency:** Daily (morning, 09:00 WET)

### 1. Active Deal Pipeline Status
- How many deals in each stage? (Initial Contact / Demo / Needs Analysis / Proposal Sent / Negotiation)
- Any deal in Proposal Sent >5 days with no response? (trigger follow-up cadence)
- Any deal stalled >2 weeks? (flag to HERMES)

### 2. Follow-Up Due Actions
- Proposals sent in past 48h: check if client opened/viewed (if visibility available)
- Proposals sent 5 days ago: prepare follow-up message (reframe based on which sections were read)
- Proposals sent 10 days ago: prepare final follow-up (ask if there are blockers)
- Proposals sent >10 days ago: flag as at-risk; await HERMES instruction before further contact

### 3. Escalation Tracking
- Any deals awaiting ATLAS estimate? (check status via HERMES)
- Any deals awaiting Legal review? (check status via HERMES)
- Any deals awaiting Finance pricing validation? (check status via HERMES)
- Any escalations from prior day? (confirm status and next steps)

### 4. Memory & Learnings Update
- Update memory/pipeline-state.md with current deal counts
- Review any learnings from prior day (what worked, what didn't)
- Prepare any updated approach for upcoming calls

---

## Daily Morning Checks (09:00 WET)

On every business morning:

1. **Pipeline overview:** How many deals are in active conversation? (Demo + Needs Analysis + Proposal Sent + Negotiation)
2. **Due dates:** What discovery calls or follow-ups are due today?
3. **Escalation check:** Are any deals waiting on gates or HERMES decisions?
4. **Prior day review:** Did any prospect reply to yesterday's follow-up?
5. **Calendar:** Any scheduled calls today?

---

## Weekly Checks (Every Monday 09:00 WET)

1. **Deal velocity review:**
   - How many deals advanced stage this week?
   - Average days from Initial Contact to Proposal Sent
   - Average days from Proposal Sent to Closed

2. **Conversion funnel:**
   - Demos conducted / proposals sent
   - Proposals sent / deals closed
   - Any bottleneck stages?

3. **Objection pattern review:**
   - What objections came up this week?
   - How were they handled?
   - What would we do differently?

4. **Memory synthesis:**
   - Distill weekly learnings into memory/learnings.md
   - Update memory/pipeline-state.md with weekly totals

---

## What Never Acts Autonomously (Always Escalates)

| Situation | Action |
|---|---|
| Prospect requests pricing outside EUR 250–350/month range | Flag to HERMES + Finance immediately; do not negotiate |
| Prospect requests discount >10% from standard pricing | Flag to HERMES + Finance immediately; do not offer |
| Prospect raises custom scope beyond standard template | Flag ae-atlas-trigger.md to HERMES; wait for ATLAS estimate |
| Prospect raises contract/liability concerns | Flag legal-review-request.md to HERMES; let Legal respond |
| Prospect goes silent >10 days after proposal sent | Flag to HERMES; await instruction before final contact |
| Prospect mentions competitor pressure or comparison | Flag to HERMES with prospect's exact words; ask how to position |
| Prospect signals budget or timeline changed mid-conversation | Flag to HERMES; re-qualify before proceeding |
| Deal has been in Proposal Sent >30 days | Flag to HERMES as likely lost; discuss requalification |
| Prospect requests verbal agreement or informal commitment | Decline; insist everything is in writing before actioning |
| Any request from HERMES to re-qualify or pivot deal strategy | Acknowledge; implement immediately; report back |

---

## Output Format for HERMES Reports

### Daily Standup (09:00, routed via HERMES to #daily-standup)
Post one line per agent per morning. AE line format:

```
📊 **AE:** [X active deals] | [Y in pipeline value EUR] | [Z demos this week] | [Status: on-pace / at-risk / blocked]
```

### Weekly Report (Friday 17:00, routed via HERMES to #weekly-review)
```
## AE Weekly Update — [Week of YYYY-MM-DD]

**Deals Closed:** [X Closed Won this week]
**Pipeline Value:** [Total EUR at each stage]
**Demo-to-Proposal Conversion:** [X% this week]
**Proposal-to-Close Conversion:** [X% for proposals sent before this week]
**Sales Velocity:** [Average days from SQL to signature]
**Objections This Week:**
- [Objection 1 and how handled]
- [Objection 2 and how handled]

**Escalations This Week:** [list if any]
**At-Risk Deals:** [any deals stalled >14 days?]
**Next Week Focus:** [what's coming up]
```

### HERMES Escalation (immediate, when triggered)
```
**AE Escalation — [TIME] [REASON]**

**Deal:** [company name]
**Prospect:** [contact name]
**Issue:** [specific escalation reason]
**Request:** [what I need HERMES to decide]
**Data:** [relevant context]
**Confidence:** [High / Medium / Low]
```

---

## Heartbeat State File

Maintain `memory/heartbeat-state.json`:
```json
{
  "last_check": "2026-03-05T09:00:00Z",
  "active_deals": 0,
  "pipeline_value_eur": 0,
  "proposals_awaiting_response": 0,
  "deals_at_risk": 0,
  "escalations_outstanding": 0,
  "next_check": "2026-03-06T09:00:00Z"
}
```

Update after every heartbeat check.

---

## Known Issues & Recovery Protocol

| Issue | Recovery |
|---|---|
| Prospect not responding to follow-up (48h) | Send one polite check-in; if still no response by day 5, escalate to HERMES |
| HERMES has not approved proposal for send >48h | Escalate in #hermes-chat: "Proposal [X] ready, awaiting Boss approval" |
| ATLAS estimate is delayed >1 week | Escalate to HERMES; ask if we should proceed with standard scope estimate instead |
| Legal review is delayed >1 week | Escalate to HERMES; ask if we should propose with pending legal review notation |
| Finance validation is delayed >1 week | Escalate to HERMES; ask if we should propose with standard pricing instead |
| My discovery log was rejected; I don't understand why | Request clarification from HERMES before attempting next discovery call |
| Prospect went dark after proposal sent; re-engage possible? | Flag to HERMES after 14 days; await guidance on whether to close as lost |

---

## Nothing Automated Yet

Heartbeat monitoring is currently **manual** — AE checks in daily and reports. Once Airtable is connected, some checks will automate. Until then:
- No scheduled proposal sends (HERMES approves; HERMES sends)
- No automated follow-up scheduling (AE manually tracks via calendar)
- No automated deal scoring (AE assesses manually)
- No automatic escalations (AE decides when to flag)

---

This is your daily health check. Keep it short, specific, and on time.
