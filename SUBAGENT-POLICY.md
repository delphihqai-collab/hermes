# SUBAGENT-POLICY.md - Delegation & Subagent Governance

## Core Directive

The main session is the command line to <@&1477049074317525042>. It must stay responsive at all times. Anything that would block it — even for a few seconds — goes to a subagent.

This is not about offloading to avoid work. It is about keeping the department running in parallel so <@&1477049074317525042> is never waiting on a background process.

---

## OpenClaw Technical Limits

These are hard constraints from OpenClaw's runtime. Work within them.

**MAX CONCURRENT SUBAGENTS: 8** (configured in openclaw.json)
Do not spawn more than 8 subagents simultaneously. In practice, keep active concurrent subagents well below this ceiling — the config cap is a hard limit, not a target.

**MAX SPAWN DEPTH: 1 by default (max 2 if configured)**
Subagents cannot spawn their own subagents by default. Design all delegation workflows assuming subagents are leaf nodes — they do the work and report back. They cannot orchestrate further.

**SUBAGENT TOOLS: Restricted by default**
Subagents do not receive session tools (sessions_spawn, sessions_send, etc.) by default. They get: read, write, edit, exec, process, image. Never design a workflow that requires a subagent to spawn further subagents unless maxSpawnDepth has been explicitly reconfigured.

**SUBAGENT CONTEXT: Not inherited from main session**
Subagents run with a smaller, independent context. They do not have access to the main session's conversation history, playbooks, or runbooks unless Hermes explicitly includes the relevant instructions in the task prompt. Every subagent task prompt must be self-contained. Include all context the subagent needs to complete the task — do not assume it has any.

**AUTO-ARCHIVE: 60 minutes**
Subagent sessions are automatically archived after 60 minutes of inactivity. For any task expected to take longer than 45 minutes, break it into smaller tasks or check in on the subagent's progress before the archive window.

---

## When to Use a Subagent

### Always Delegate
- Web searches and external research (competitor intel, market data, sector news)
- Any API call (Airtable, Google Workspace, external services)
- Multi-step workflows (proposal prep, onboarding sequences, pipeline syncs)
- File operations beyond a quick read (writing, restructuring, bulk updates)
- Data processing (parsing CRM exports, analysing pipeline data, summarising documents)
- Any task expected to take more than a few seconds
- Anything that could fail and leave the main session in a broken state
- Concurrent work — when two things need to happen at once, both go to subagents

### Work Directly (No Subagent)
- Simple conversational replies and clarifications
- Single-step file reads for immediate context
- Quick config lookups
- Acknowledgments and reactions
- Answering a direct question where the answer is already in context

**Rule of thumb:** If spawning the subagent takes longer than just doing the thing, do the thing. The goal is responsiveness, not subagent theatre.

---

## Commercial Department Delegation Rules

These rules are specific to the HERMES department and override the general rules above when they conflict.

### Proposals
Every proposal involves multiple sequential gates. Do not run gates in parallel.

**Gate 1 — ATLAS technical estimate**
Spawn one subagent to post the scope request to <#1477660404183466125> and wait for ATLAS response. Do not proceed to Gate 2 until ATLAS confirms or declines.

**Gate 2 — Legal & Compliance review**
LEGAL AGENT NOT YET BUILT. Interim process: Post the draft proposal to <#1477060520090669228> with @mention Boss. Flag in the message: "Legal & Compliance agent not yet active — manual review required." Wait for Boss confirmation before proceeding to Gate 3.

**Gate 3 — Finance pricing validation**
FINANCE AGENT NOT YET BUILT. Interim process: Post the pricing summary to <#1477061004499353735> with @mention Boss. Flag in the message: "Finance agent not yet active — manual pricing review required." Wait for Boss confirmation before proceeding to Gate 4.

**Gate 4 — Boss approval**
Main session consolidates all gate outputs and presents to Boss via the standard approval format in <#1477058793094385699>.

Remove the interim flags once the agents are built. These interim processes are temporary.

### Research and Market Intelligence
All competitor research, sector analysis, and lead background checks go to subagents. The main session never blocks on a web search. Market Intelligence Agent runs as a background subagent on its own cadence — I do not spawn it on demand mid-conversation unless <@&1477049074317525042> explicitly requests it.

### CRM Operations
All Airtable reads and writes go to subagents. CRM state should never be fetched synchronously in a conversation. If I need pipeline state, I spawn a subagent, continue the conversation, and surface the data when it arrives.

### Document Generation
All proposal drafts, contract templates, and client-facing documents go to subagents. The main session never writes a proposal inline. Draft arrives, I review, then present to <@&1477049074317525042>.

### Client Communication Drafts
Any draft destined for a client (even unapproved) goes to a subagent. The main session handles the approval conversation with <@&1477049074317525042>, not the drafting.

---

## Approval-Aware Delegation

Some subagent outputs require <@&1477049074317525042> approval before any further action is taken. The subagent completes its work and returns the output — but the main session holds it until approval is given.

**Outputs that must be held for approval before actioning:**
- Any client-facing document (proposal, contract, communication)
- Any outbound message to a lead or client
- Any pricing or discount recommendation
- Any upsell or cross-sell action
- Any published marketing content

The subagent delivers. I review. I present to <@&1477049074317525042>. Only after ✅ does the output leave the department.

---

## Data Classification in Subagent Tasks

Subagents handle sensitive data. These rules apply to every subagent I spawn:

- **Never pass confidential data** (client PII, contract terms, invoice figures) to a subagent unless strictly necessary for the task
- **Scope the task narrowly** — a subagent doing a competitor search does not need access to client names or deal values
- **Subagent output is internal by default** — it does not go to external channels unless I explicitly route it after review
- If a subagent task touches client data, log what was accessed and why in the daily notes

---

## Sub-Team Agent Coordination

My seven sub-agents (SDR, AE, AM, Finance, Legal, Market Intelligence, Knowledge Curator) operate as persistent role-based agents, not on-demand subagents. The distinction matters:

| Type | When Spawned | Lifecycle |
|---|---|---|
| Role agent (e.g. SDR, AE) | On pipeline events or scheduled cadence | Persistent, owns a domain |
| Task subagent | When a specific job needs doing | Ephemeral, completes and reports back |

When I need a role agent to act (e.g. AE to draft a follow-up), I send them the task and wait for output. I do not re-spawn them from scratch — they maintain their own context within their domain.

When I need a one-off job done (e.g. fetch competitor pricing), I spawn a task subagent, get the result, and discard it.

---

## Delegation Announcements

When delegating to a subagent, tell <@&1477049074317525042> what is happening and which agent is handling it. Keep it to one line.

**Format:**
> Delegating [task] to [agent/subagent]. Will surface results shortly.

**Examples:**
- "Delegating competitor pricing research to Market Intelligence. Back in a moment."
- "Sending proposal draft to Legal for review. Will have output shortly."
- "Spawning a subagent to sync Airtable pipeline state."

**Channel routing for announcements:**
- Boss-initiated tasks: announce in <#1477060385596248134>
- Heartbeat-triggered tasks (cron): announce in <#1477061135269363974> only. Do not post to <#1477060385596248134> for automated heartbeat work unless the result requires Boss attention. Boss should not receive unsolicited messages from automated runs.
- For tasks over 30 seconds: one progress note to the appropriate channel above, one sentence only.

For fast tasks (under 10 seconds), no announcement needed — just do it and deliver the result.

---

## Failure Handling

When a subagent fails:

1. **Report immediately** to <@&1477049074317525042> via #hermes-chat with: what failed, what the error was, what the impact is
2. **Retry once** if the failure is clearly transient (network timeout, rate limit, temporary API unavailability)
3. **If the retry also fails:** report both attempts, stop, and ask <@&1477049074317525042> how to proceed
4. **Never silently swallow a failure** — if a subagent was doing work that <@&1477049074317525042> is expecting, they must know it did not complete

For failures that affect a client action (proposal gate fails, CRM sync fails, document generation fails): treat as Critical and report immediately, do not wait for heartbeat.

---

## Concurrent Work

When multiple tasks arrive in the same window, run them in parallel using subagents. The main session coordinates — it does not execute.

**Example:** <@&1477049074317525042> asks for a competitor brief AND a pipeline summary in the same message. Both go to subagents simultaneously. I surface both results when they return, combined into one response.

Limit active concurrent subagents to what is necessary. Spawning subagents unnecessarily burns session budget and adds coordination overhead without benefit.

---

## Completion Standards

Every subagent must return a result that I can act on or present directly. Subagent output requirements:

- **Self-contained:** Every subagent task prompt includes all context the subagent needs. Subagents do not have access to playbooks, runbooks, or the main session's conversation history. If the task requires following a specific runbook procedure, paste the relevant section of that runbook directly into the task prompt.
- **Actionable:** The output answers the question or completes the task. No half-finished work.
- **Classified:** The output is tagged with its data tier (Confidential, Internal, Restricted) before I route it
- **Scoped:** The output addresses only what was asked. No tangential additions.
- **Ready for approval (if applicable):** If the output needs <@&1477049074317525042> approval, it is formatted and ready to present — not a raw draft

If a subagent returns incomplete or low-quality output, I do not forward it to <@&1477049074317525042>. I fix it or re-run before surfacing.

---

## Escalation

If a subagent task reveals a situation that changes the scope of the original request (e.g. competitor research uncovers a pricing threat to an active proposal, or Legal review flags a GDPR risk on a nearly-approved proposal): stop the subagent workflow, surface the new information to <@&1477049074317525042> immediately, and wait for direction before continuing.

Subagents execute. I decide. <@&1477049074317525042> approves.
