---
name: session-wrap-up
description: End-of-session routine for Hermes. Run at the close of every working session to flush daily notes, synthesise durable learnings to MEMORY.md, commit all uncommitted workspace changes, and verify the three heartbeat cron jobs are live. Triggers on: wrap up, end session, session end, end of day, before I go, closing down, finishing up, compaction preparation, save session, daily close, EOD routine, session close. Also activates automatically when OpenClaw triggers a memory flush before context compaction.
version: 1.0.0
metadata:
  openclaw:
    emoji: "🔒"
  requires:
    bins: ["git"]
---

# Session Wrap-Up

Run every step in order. Do not skip steps even if nothing seems to have changed.

## Step 1 — Write Today's Daily Notes

Read memory/YYYY-MM-DD.md for today's date (use `date +%Y-%m-%d` to confirm). If the file does not exist, create it now.

Append a session summary block:

```
## Session Close — [HH:MM]

### What happened
[One paragraph — deals that moved, tasks completed, decisions made]

### Decisions logged
[Bullet list of any Boss decisions or confirmed preferences from this session]

### Open items
[Anything unresolved that needs to continue next session]

### Playbooks or runbooks updated
[List any files changed, or "None"]
```

## Step 2 — Synthesise to MEMORY.md

Read today's notes in full. Ask: is there anything here that should survive permanently — a Boss preference, a confirmed process, a sector insight, a lesson learned?

If yes: add it to the appropriate section of MEMORY.md.
If no: write "No new durable learnings this session" in today's notes and move on.

Never duplicate what is already in MEMORY.md. Add only what is new.

## Step 3 — Registry Sync Check

Run workspace/skills/git-commit-discipline/scripts/check-registry-sync.sh

If it fails: fix the drift now, before committing.

## Step 4 — Commit All Changes

Stage all uncommitted workspace changes:
```
git add -A
```

Check what is staged:
```
git status
```

Write commit message:
```
memory: session wrap-up [date] — [one-line summary of what changed]
```

Commit and push:
```
git commit -m "memory: session wrap-up [date] — [summary]"
git push
```

## Step 5 — Verify Cron Jobs

Run: `openclaw cron list` (or check via gateway config)

Confirm all three are present and scheduled:
- hermes-morning-standup — `0 9 * * 1-5` Europe/Lisbon
- hermes-midday-update — `0 12 * * 1-5` Europe/Lisbon
- hermes-afternoon-update — `0 18 * * 1-5` Europe/Lisbon

If any are missing: recreate them immediately before closing. Log the status either way.

## Step 6 — Post to #hermes-logs

Post a wrap-up confirmation to #hermes-logs (channel 1477061135269363974). Mention is required.

Format:
```
Session closed — [date] [time]
Committed: [commit hash short]
Crons: [all live / [name] missing — recreated]
Notes: [one line on what was flushed to MEMORY.md or "no new durable learnings"]
```

## If Called by Compaction Memory Flush

If OpenClaw is about to compact the session and triggered this skill for a memory flush:

1. Write today's daily notes immediately — prioritise anything from the current context that has not been written down yet
2. Update MEMORY.md with anything durable from this context
3. Commit with: `memory: pre-compaction flush [timestamp]`
4. Reply NO_REPLY unless something requires Boss attention
