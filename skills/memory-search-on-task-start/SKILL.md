---
name: memory-search-on-task-start
description: Context anchor and registry check for Hermes. Run at the start of any non-trivial task to verify playbook and runbook registries are in context, recover them after compaction if missing, and surface any relevant playbooks or runbooks for the task about to begin. Triggers on: starting a task, beginning work, let me work on, I need to, working on, about to, starting now, new task, before I begin, task start, picking this up, context check, registry check, what playbooks apply, what runbooks apply, compaction recovery, lost context, after compaction.
version: 1.0.0
metadata: { "openclaw": { "emoji": "🧭" } }
---

# Memory Search on Task Start

Run this at the beginning of any non-trivial task. Fast tasks (single tool call, simple answer) do not need this. Multi-step tasks, external actions, heartbeat routines, and anything touching the pipeline always need this.

## Step 1 — Verify Registries Are in Context

Check whether the Playbook Registry and Runbook Registry tables are visible in your current context (they live in AGENTS.md).

If YES: proceed to Step 2.

If NO (post-compaction or group session without AGENTS.md injected):
Read AGENTS.md now using the read tool. Specifically load the Playbook Registry and Runbook Registry sections. Do not proceed until both registries are in context.

## Step 2 — Search for Relevant Playbooks

Look at the task you are about to perform. Extract 2-4 keywords that describe it. Scan the Playbook Registry for keyword matches. A match is any row where the keywords column contains words that overlap with your task description.

If match found: Load that playbook file using memory_get or the read tool. Read it fully before beginning the task. The playbook governs how this task is executed.

If no match: Proceed normally. Note "no playbook match" internally.

## Step 3 — Search for Relevant Runbooks

Repeat Step 2 for the Runbook Registry.

If match found: Load that runbook file. Use it as your execution template for this task.

If no match: Proceed normally.

## Step 4 — Memory Search for Deeper Context

For tasks involving a specific prospect, client, deal, or sector — run memory_search with the entity name or topic as the query. This surfaces relevant daily notes and MEMORY.md snippets that may not be in the current context window but are relevant to the task.

Load any high-relevance results (score above 0.8) using memory_get.

## Step 5 — Proceed

You now have:
- Registries confirmed in context
- Relevant playbooks loaded (or confirmed absent)
- Relevant runbooks loaded (or confirmed absent)
- Entity-specific memory surfaced (if applicable)

Begin the task.

## After Compaction — Recovery Protocol

If you detect that context has been compacted (you see compaction markers or notice you have lost context of earlier conversation):

1. Run this skill in full immediately
2. Read today's memory/YYYY-MM-DD.md to recover session continuity
3. Read MEMORY.md sections relevant to the current task
4. Only then respond to the next message or continue the task

Never respond to a Boss message post-compaction without first re-anchoring. A confident wrong answer is worse than a one-second pause to recover context.
