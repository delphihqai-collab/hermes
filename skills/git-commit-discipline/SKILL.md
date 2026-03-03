---
name: git-commit-discipline
description: Enforce workspace commit discipline for Hermes. Use this skill whenever committing workspace changes to git — including after adding or updating playbooks, runbooks, skills, config files, daily notes, or any workspace file. Triggers on: commit, git commit, push changes, commit workspace, save changes to git, commit and push, update repository, git push. Runs a pre-commit registry sync check before every commit and enforces the correct commit message format.
version: 1.0.0
metadata: { "openclaw": { "emoji": "📦", "requires": { "bins": ["git"] } } }
---

# Git Commit Discipline

## Pre-Commit Checklist — Run Before Every Commit

Run scripts/check-registry-sync.sh before staging any commit. If the check fails, fix the drift before committing. Never commit with registries out of sync.

The three registries must always be identical:
- AGENTS.md Playbook Registry table
- MEMORY.md Playbook Registry table
- playbooks/INDEX.md

And separately:
- AGENTS.md Runbook Registry table
- MEMORY.md Runbook Registry table
- runbooks/INDEX.md

## Commit Message Format

Every commit follows this format exactly:

```
type: short description
```

Valid types:
- `playbook` — added or changed a playbook file
- `runbook` — added or changed a runbook file
- `skill` — added or changed a native skill
- `memory` — updated MEMORY.md or daily notes
- `infra` — cron jobs, gateway config, system changes
- `ops` — operational fixes, corrections, gap repairs
- `fix` — bug fix in existing instructions or config
- `init` — first-time setup or directory creation

Examples:
```
playbook: add proposal-pipeline with interim agent gates
runbook: update prospect-qualification-check — ICP confirmed by Boss
skill: add git-commit-discipline
memory: synthesise week-of-03-03-2026 learnings
infra: heartbeat cron jobs scheduled — 09:00 12:00 18:00
ops: master config fix — registries synced all three locations
```

Never write: "updated files", "changes", "misc", "wip", "fix stuff"

## Procedure

1. Run scripts/check-registry-sync.sh
2. If PASS: stage files, write commit message in correct format, commit
3. If FAIL: show exactly which registry entries are out of sync, fix them, re-run check, then commit
4. After committing: run git push
5. Log to today's memory/YYYY-MM-DD.md: "Committed: [message] at [time]"

## Never

- Commit with a generic message
- Commit without running the sync check
- Commit MEMORY.md changes without also committing the matching INDEX.md
- Push without committing first
