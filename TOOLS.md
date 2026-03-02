# TOOLS.md - Local Notes

## Machines

- PC1 → ATLAS (Development Director) — accessible via Discord #atlas-chat — Bot ID: 1477646928840888331
- PC2 → This machine (HERMES)
- PC3 → NEXUS (Chief of Staff) — accessible via Discord #nexus-chat

## Discord Channels

### 📌 GENERAL
- <#1477057832238055514> `general` → General conversations and informal updates
- <#1477057910293921958> `critical-alerts` → Urgent alerts from any entity
- <#1477057957580636341> `company-news` → Announcements and important milestones

### ✅ APPROVALS
- <#1477058793094385699> `approvals` → All blocked actions wait here — always @mention <@&1477049074317525042>
- <#1477059763194826783> `approvals-archive` → History of all decisions made

### 💼 HERMES
- <#1477060385596248134> `hermes-chat` → Direct conversation with <@&1477049074317525042> (no mention required)
- <#1477060426591109402> `pipeline` → Sales pipeline status
- <#1477060458987917322> `market-intelligence` → Competitor reports and market intel
- <#1477060482320961678> `proposals` → Proposals awaiting review
- <#1477060520090669228> `contracts-compliance` → Legal and GDPR reviews
- <#1477060563078217758> `client-onboarding` → First 30 days per client
- <#1477060638860902452> `active-clients` → Production client monitoring
- <#1477061004499353735> `financials` → Invoicing and margin tracking
- <#1477061053631168522> `marketing` → Marketing content and campaigns
- <#1477061095507230761> `knowledge-base` → HERMES knowledge base
- <#1477061135269363974> `hermes-logs` → Automatic activity logs

### 🤝 COLLABORATION
- <#1477660374101655715> `atlas-hermes` → Direct cross-department communication between ATLAS and HERMES
- <#1477660404183466125> `briefings` → HERMES passes client context to ATLAS here
- <#1477660442511016007> `knowledge-base` → Shared learnings between all departments
- <#1477660493257773258> `chief-of-staff` → NEXUS coordination and briefings

### 📊 OPERATIONS
- <#1477661372937535568> `daily-standup` → Daily cross-department standup
- <#1477661410375897129> `weekly-review` → Weekly review sessions
- <#1477661436594487468> `roadmap` → Company roadmap
- <#1477661455083110613> `kpis` → KPI tracking

### 🗄️ ARCHIVE
- <#1477661798659260416> `clients-archive` → Archived client records
- <#1477661833497280743> `decisions-archive` → Historical decisions

## CRM

- Tool: Airtable (confirm which is active)
- Purpose: Pipeline and client management

## Documents

- Tool: Google Workspace
- Purpose: Proposals, contracts, client-facing documents

## <@&1477049074317525042> (Boss)

- Location: Porto, Portugal
- Available: Primarily mornings
- Contact: Discord DM / <#1477060385596248134>

## Heartbeat Cron Jobs

Two jobs are scheduled in the OpenClaw native cron system (stored in gateway config, not system crontab — no sudo required).

| Job | ID | Schedule | Timezone |
|---|---|---|---|
| hermes-midday-update | b21cfc56-83e0-460b-8908-a83e273f0fe5 | `0 12 * * 1-5` (12:00 Mon–Fri) | Europe/Lisbon |
| hermes-afternoon-update | 445294a1-6689-406b-8688-15f0826995e2 | `0 18 * * 1-5` (18:00 Mon–Fri) | Europe/Lisbon |

### How they work
Each job fires a `systemEvent` into the main session. The event instructs Hermes to read the boss-status-updates playbook, compile the update, and post it to #hermes-chat. A one-line confirmation is logged to #hermes-logs after each run.

### Trigger mechanism
- **Type:** OpenClaw native cron (`sessionTarget: main`, `payload.kind: systemEvent`)
- **Gateway:** `127.0.0.1:18789`
- **Managed via:** OpenClaw `cron` tool — list, update, enable/disable without touching system files

### Logging
- **Discord log channel:** #hermes-logs (1477061135269363974) — one-line confirmation after each run
- **No local log file** — OpenClaw cron handles job history natively; check via `cron list` or the dashboard

### Important notes
- Jobs survive gateway restarts — they are stored in gateway config
- **The OpenClaw gateway itself does NOT auto-start on reboot.** If PC2 reboots and the gateway is not running, these cron jobs will not fire. Manual gateway start required after any reboot.
- To disable a job: use `cron update` with `enabled: false`
- To check last run: use `cron runs` with the job ID

## Timezone & Locale

- Timezone: WET/WEST (Porto, Portugal — UTC+0 / UTC+1 in summer)
- All timestamps, proposal deadlines, contract dates, and CRM entries use this timezone
- Date format: DD/MM/YYYY
- Language: English (default), Portuguese for local clients

## Remote Access

### How It Works
Tailscale creates a private encrypted network between PC2 and any authorised external device. Dashboard is accessible from anywhere via a permanent HTTPS URL — no port forwarding, no dynamic IPs, no router config. PC2 posts to #hermes-chat on every boot confirming it's online.

### Dashboard Access
Open this URL in any browser on any device that has Tailscale installed and signed into the same account:

**https://hermes.tail280e9c.ts.net**

No SSH needed. Paste the gateway token in dashboard Settings on first connect.

### PC2 Tailscale Details
- Tailscale IP: 100.99.147.97 (permanent)
- Machine name: hermes
- Account: delphihq.ai@gmail.com



