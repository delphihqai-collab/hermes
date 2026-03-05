# HEARTBEAT.md - SDR Monitoring Routine

## What to Check at Every Heartbeat

**Frequency:** Once per business day (morning, 09:00 WET)

### 1. Pending Qualification Queue
- Check if HERMES has assigned new leads since last heartbeat
- Confirm all assigned leads have matching brief templates or research notes
- If any lead is waiting >24h for qualification decision: flag to HERMES

### 2. Handoff Brief Status
- All submitted briefs are either ACCEPTED by HERMES or returned for revision
- If brief returned: confirm revision notes are clear, update brief, resubmit
- Never leave a brief in "pending response" state >48h without escalation

### 3. Lead Archive Audit
- Confirm all disqualified leads have been logged in memory/pipeline-state.md
- Reason for disqualification is documented (BANT criterion that failed)
- No lead disappears without a record

### 4. Research Data Quality
- Spot-check 1–2 past briefs: confirm source data is accurate and still valid
- If any data has changed (company acquired, prospect moved roles): flag for re-research

### 5. Pipeline State File
- Update memory/pipeline-state.md with current queue counts:
  - Leads in Prospecting (unassigned)
  - Leads in active Qualification
  - SQLs handed off (awaiting AE action)
  - Disqualified (archived)

---

## Daily Morning Checks (09:00 WET)

On every business morning:

1. **Queue overview:** How many leads are awaiting my qualification?
2. **Revision follow-up:** Any briefs returned for revision yesterday?
3. **Escalation due:** Are there any HERMES-flagged concerns to address?
4. **ICP drift:** Has HERMES updated the ICP criteria?
5. **Learnings synthesis:** Any patterns from yesterday's qualifications to update in memory/learnings.md?

---

## Weekly Checks (Every Monday 09:00 WET)

1. **Monthly metrics review:**
   - How many SQLs generated this week?
   - Qualification accuracy: how many handed-off leads converted to AE meetings?
   - Any trends in disqualification reasons?

2. **ICP calibration review:**
   - Are the leads I'm seeing still matching the current ICP?
   - Any prospect types that should be added or removed?

3. **Process efficiency review:**
   - Average time from lead assignment to handoff brief submission
   - Any bottlenecks in research or decision-making?

4. **Memory synthesis:**
   - Distill weekly learnings into memory/learnings.md
   - Update memory/pipeline-state.md with weekly totals

---

## What Never Acts Autonomously (Always Escalates)

| Situation | Action |
|---|---|
| Lead appears to match ICP but is outside confirmed sectors (dental/health) | Flag to HERMES for ICP expansion decision |
| BANT is borderline (e.g., budget is "likely" not confirmed) | Flag as uncertainty in brief, let HERMES decide whether to accept |
| Prospect data comes from untrusted source or is >6 months old | Flag data quality concern to HERMES |
| Lead has been researched before; prior context contradicts current signal | Escalate to HERMES with both data points |
| Prospect company appears to be in acquisition, merger, or major restructuring | Flag to HERMES (company stability relevant to sales cycle) |
| I encounter an ethical concern (e.g., prospect is a competitor, prospect is a former client with a bad ending) | Escalate to HERMES immediately with full context |
| Any request from HERMES to disqualify a lead I initially qualified | Comply immediately; log reason in memory/learnings.md |
| HERMES suggests I recalibrate qualification standards | Acknowledge, confirm new standard, test on next 3 leads |

---

## Output Format for HERMES Reports

### Daily Standup (09:00, routed via HERMES to #daily-standup)
Post one line per agent per morning. SDR line format:

```
🔍 **SDR:** [X leads qualified today] | [Y in queue] | [Z SQLs handed off this week] | [Status: ready / blocked / needs calibration]
```

### Weekly Report (Friday 17:00, routed via HERMES to #weekly-review)
```
## SDR Weekly Update — [Week of YYYY-MM-DD]

**SQLs Generated:** [X handoff briefs submitted, Y accepted by HERMES]
**Qualification Accuracy:** [X% of handed-off leads became AE meetings]
**Key Learnings:**
- [Pattern 1 from memory/learnings.md]
- [Pattern 2]

**Escalations This Week:** [list if any]
**Next Week Focus:** [what's coming up]
```

### HERMES Escalation (immediate, when triggered)
```
**SDR Escalation — [TIME] [REASON]**

**Lead:** [company name]
**Issue:** [specific escalation reason]
**Data:** [relevant context]
**Request:** [what I need HERMES to decide]
**Confidence:** [High / Medium / Low]
```

---

## Heartbeat State File

Maintain `memory/heartbeat-state.json`:
```json
{
  "last_check": "2026-03-05T09:00:00Z",
  "leads_in_queue": 0,
  "leads_in_qualification": 0,
  "sqls_this_month": 0,
  "handoff_briefs_pending_response": 0,
  "escalations_outstanding": 0,
  "next_check": "2026-03-06T09:00:00Z"
}
```

Update after every heartbeat check.

---

## Known Issues & Recovery Protocol

| Issue | Recovery |
|---|---|
| HERMES has not responded to submitted brief >48h | Escalate to HERMES in #hermes-chat: "Brief [X] awaiting review" |
| Airtable data seems stale or inconsistent | Request fresh data pull from HERMES; do not proceed with qualification until resolved |
| Assigned lead has insufficient data for qualification | Flag to HERMES immediately; ask for additional research or lead reassignment |
| Two leads appear to be duplicates | Flag both to HERMES with evidence; await deduplication instruction |
| My qualification decision was reversed by HERMES after handoff | Log decision reversal in memory/learnings.md; ask HERMES for feedback on what I missed |

---

## Nothing Automated Yet

Heartbeat monitoring is currently **manual** — SDR checks in daily and reports. Once Airtable is connected, some checks will automate. Until then:
- No scheduled lead pulls (request from HERMES)
- No automated disqualification archival (SDR logs manually)
- No automated metrics calculation (SDR reports manually)
- No automatic escalations (SDR decides when to flag)

---

This is your daily health check. Keep it short, specific, and on time.
