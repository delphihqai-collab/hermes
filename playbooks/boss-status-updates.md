# Boss Status Updates

**Applies to:** Any time Hermes reports progress, results, or situation status to Boss
**Trigger keywords:** update Boss, status report, summary for Pedro, what's happening, progress update, end of day, weekly summary, deal update for Boss
**Added:** 2026-03-02
**Source:** Seed playbook — confirm cadence preference with Pedro

## Rule

Boss does not want to be managed. He wants signal, not noise. Every update must answer: what matters, what moved, what needs him. If none of those things are true, do not send an update.

## Update structure

Use this every time:

**MOVED:** [What progressed since last update — deals, outreach, responses]
**BLOCKED:** [What is stuck and why — include what Hermes has already tried]
**NEEDS YOU:** [Specific asks — decisions, approvals, inputs. If none, say "Nothing right now."]
**WATCHING:** [Early signals worth knowing — not urgent, but Pedro should have the context]

## Rules

- No more than 6 lines total unless a deal warrants detail
- Numbers over descriptions wherever possible ("3 prospects qualified" not "good SDR activity")
- If nothing moved, say so in one line and stop
- Never pad an update to seem busy
- Never bury a problem in the middle — if something went wrong, lead with it

## Cadence

Twice daily, every working day. No exceptions unless Boss says otherwise.

**MIDDAY UPDATE — sent at 12:00**
Focus: what has moved in the morning, anything that needs Boss input before afternoon.

**END OF AFTERNOON UPDATE — sent at 18:00**
Focus: what closed out during the day, what is set up for tomorrow, anything unresolved that Boss should know before end of day.

Channel: #hermes-chat (1477060385596248134) — no mention required.

If nothing significant happened in a session, still send the update. "Nothing moved this morning — SDR has 3 prospects in research, no responses yet." is a valid midday update. Silence is not.

Urgent items do not wait for the scheduled update. If something needs Boss now, it goes to #hermes-chat immediately.

## Missed Heartbeat Recovery

If a scheduled update does not fire because the gateway was down or the job failed:
- When the gateway comes back online, post the missed update to #hermes-chat immediately — do not wait for the next scheduled fire
- Prefix the message with: LATE UPDATE — [time it should have fired]
- Post a one-line note to #hermes-logs confirming the recovery: "Missed [12:00 / 18:00] heartbeat recovered at [actual time]"
- If the gateway is still down by the time the next scheduled heartbeat fires, that update also gets the LATE UPDATE prefix when it eventually posts
- If Boss asks why an update was late before Hermes has recovered it, explain what happened honestly — one sentence, no over-explaining

Silence is never acceptable. A late update is always better than no update.

## Before Every Update — Context Check

Before compiling any scheduled update, run this check:

1. Read today's session notes file: `workspace/memory/[today's date].md` — this is the authoritative record of what happened today regardless of what is currently in context.
2. Read `workspace/skills/deal-status-update.md` to confirm the deal reporting format before writing pipeline items.
3. Check the MEMORY.md Playbook Registry for anything relevant to what you are about to report.

Only after completing this check should you begin writing the update. Never compile a status update from memory alone. If today's session notes file does not exist yet, create it before proceeding and note that the session started without prior notes.
