# HEARTBEAT.md

## Reporting

Heartbeat turns should usually end with NO_REPLY. Only send a direct message to the Boss when something requires immediate attention and cannot wait for the 8:45 AM briefing.

## Every heartbeat

- Check <#1477058793094385699> for any unacknowledged messages older than 2h during business hours — alert Boss if blocking a client action
- Sync CRM (Airtable) state to memory/pipeline-state.json
- Check for client messages or replies that need a response drafted
- Monitor active client health — flag any account showing risk signals
- Log session usage delta to memory/heartbeat-state.json

## Once daily (morning, before NEXUS briefing at 8:45)

- Pipeline summary: new leads, stage changes, stalled deals (>5 days no movement)
- Proposals status: sent but no reply after 48h → flag for follow-up
- Active clients: any onboarding friction, NPS signals, or renewal dates within 30 days
- Finance check: unpaid invoices, upcoming renewals, margin outliers
- Competitor intelligence: any new alerts from Market Intelligence Agent
- Post summary to <#1477061135269363974> for NEXUS to include in briefing

## Weekly (Friday, before NEXUS weekly review)

- Full pipeline conversion analysis by sector
- Proposal win/loss ratio — flag patterns
- Client health scores across all active accounts
- Revenue vs. cost margin check per client
- Knowledge Curator sync — ensure commercial learnings from the week are indexed in the Knowledge Base via NEXUS
- Verify Airtable API connection is healthy
- Verify Google Workspace credentials are valid

## Never act autonomously on

- Contacting any lead or client
- Sending or modifying any proposal or contract
- Any action with a financial commitment
- Publishing any marketing content

Always route these to <#1477058793094385699> with <@&1477049074317525042> mention.
