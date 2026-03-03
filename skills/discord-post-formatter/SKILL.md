---
name: discord-post-formatter
description: Discord message routing and format enforcement for Hermes. Use before posting any message to any Discord channel — including status updates, approvals, pipeline reports, standup posts, heartbeat logs, financial summaries, client alerts, and escalations. Triggers on: post to Discord, send message, post update, message to channel, send to channel, Discord post, notify channel, post in, write to channel, channel message, post approval, log to hermes-logs, standup post, status update, pipeline update, financial update, escalation message, client alert, post confirmation.
version: 1.0.0
metadata:
  openclaw:
    emoji: "📡"
---

# Discord Post Formatter

Run before composing or sending any Discord message. This skill enforces routing, mentions, and format.

Load references/channels.md for the full channel ID and routing table.

## Step 1 — Identify Content Type and Route

Classify what you are about to post:

| Content type | Channel | Mention required |
|---|---|---|
| Talking to Boss / general updates | #hermes-chat (1477060385596248134) | No |
| External action approval | #approvals (1477058793094385699) | Yes — @Boss always |
| Security incident or client emergency | #critical-alerts (1477057910293921958) FIRST, then #hermes-chat | Yes |
| Pipeline stage movement (no financial figures) | #pipeline (1477060426591109402) | Yes |
| Financial figures — deal values, invoices, margins, MRR, payments | #financials (1477061004499353735) ONLY | Yes |
| Client health flags | #active-clients (1477060638860902452) | Yes |
| Proposals awaiting Boss review | #proposals (1477060482320961678) | Yes |
| Legal or compliance matters | #contracts-compliance (1477060520090669228) | Yes |
| Passing scope or context to ATLAS | #briefings (1477660404183466125) | No |
| Cron output, heartbeat results, system logs | #hermes-logs (1477061135269363974) | Yes |
| Daily cross-department standup | #daily-standup (1477661372937535568) | Yes |
| Weekly review | #weekly-review (1477661410375897129) | Yes |

## Step 2 — Financial Data Check

Scan the message content for any of:
- Euro amounts (EUR symbol or text)
- Invoice figures
- Margin percentages
- Contract values
- MRR or ARR numbers
- Payment amounts
- Any specific monetary figure

If ANY financial figure is present: That figure MUST go to #financials only.

If the message is a pipeline update containing both stage movement and deal value:
SPLIT into two messages:
- Message A to #pipeline: stage movement only, no figures
- Message B to #financials: deal value and financial context

Never include financial figures in #pipeline, #hermes-chat, #hermes-logs, #daily-standup, #proposals, or any other channel. No exceptions.

## Step 3 — Mention Enforcement

If the target channel requires a mention: include the appropriate mention before posting.

For #approvals: always @Boss (Pedro, ID: 661015337898082326)
For other channels requiring mention: use standard Discord mention syntax

If you are about to post to #approvals without @Boss: stop and add it. An approval request that Boss does not see is a silent failure.

## Step 4 — Format Enforcement by Channel

**STANDUP (#daily-standup):** Exactly four lines.
```
COMMERCIAL: [pipeline status — no financial figures]
FOCUS TODAY: [1-2 priorities for the day]
BLOCKERS: [what needs unblocking — or "None"]
FLAGS: [what other departments should know — or "None"]
```

**STATUS UPDATE (#hermes-chat — scheduled 12:00 and 18:00):**
```
MOVED: [what progressed since last update]
BLOCKED: [what is stuck and why]
NEEDS YOU: [specific asks — or "Nothing right now"]
WATCHING: [early signals worth knowing]
```
Maximum 6 lines unless a deal warrants detail. If nothing moved: still send. Silence is not acceptable.

**HEARTBEAT LOG (#hermes-logs):**
Each item uses one of three prefixes: [CRITICAL], [HIGH], or [MEDIUM]
```
[LEVEL] Area: one-line summary — recommended action if any
```
- CRITICAL = requires Boss action today, blocks revenue or client relationship
- HIGH = requires Boss awareness, no immediate block but needs attention
- MEDIUM = informational, no action required

**APPROVAL REQUEST (#approvals):** @Boss mention first — always
```
URGENCY: CRITICAL / IMPORTANT / INFORMATIONAL
ACTION: [one line — what will happen if approved]
RECIPIENT: [who receives this or who is affected]
CONTEXT: [two sentences max — why this is happening now]
DRAFT: [exact content, ready to send as-is upon approval]
RISKS: [if approved / if rejected]
ALTERNATIVES: [what else was considered]
RISK IF DELAYED: [honest — can it wait and until when?]
```

**DEAL UPDATE (#pipeline — stage movement only, no financial figures):**
```
DEAL: [Company name — Contact name]
STAGE: [current stage]
LAST ACTION: [what happened most recently and when]
NEXT ACTION: [who owns it and by when]
SIGNAL: [one honest sentence on momentum — moving, stalling, or at risk]
NEEDS BOSS: [specific ask — or "Nothing right now"]
```

## Step 5 — Final Check Before Posting

Before sending, confirm all of these:
- Channel is correct for this content type
- Financial figures are not present in any non-#financials channel
- Mention is included if the channel requires it
- Format matches the channel's required structure
- Message is complete — no placeholders, no [INSERT NAME], no draft markers

If any check fails: fix it before posting. Do not post an incomplete message.
