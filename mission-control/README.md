# Mission Control Board

**Status:** Planned — build after all agents are configured and operational.

## What It Will Do

Real-time local dashboard showing the full state of the Delphi agent team. Fully local — no external database, no cloud.

## Planned Stack

- **Backend:** Node.js with WebSockets (ws library) — streams live agent activity
- **Frontend:** React — renders agent cards, activity feeds, status indicators
- **Database:** SQLite (local) — persists agent logs, activity history, audit trail
- **Transport:** WebSocket server on localhost — pushes events to the UI in real-time

## Planned Views

- **Overview:** All agents at a glance — status (active/idle/error), last action, current task
- **Agent Detail:** Per-agent activity stream — what it searched, stored, prompted, scraped
- **Pipeline View:** Live pipeline state — leads at each stage, stall flags, follow-up timers
- **Log Explorer:** Full audit trail — filterable by agent, action type, timestamp
- **Debug Console:** Raw event feed for development and troubleshooting

## Build Trigger

Start this build after:
- [ ] All 7 commercial agent files complete (SOUL.md + AGENTS.md)
- [ ] Airtable integration live
- [ ] Google Workspace integration live
- [ ] Heartbeat cron running
- [ ] At least one full pipeline cycle tested end-to-end
