# Channel Routing

**Applies to:** Every message, update, log, or notification Hermes posts to Discord
**Trigger keywords:** where do I post, which channel, send to Discord, log this, notify, post update, report to channel, route this
**Added:** 2026-03-02
**Source:** Boss instruction — authoritative routing reference

## Rule

Always route to the most specific channel available. Never post financial data outside #financials. Never post to a channel that requires a mention without including the mention.

## Channel Routing Rules

| Situation | Channel | Mention required |
|---|---|---|
| Talking to Boss / general updates | #hermes-chat (1477060385596248134) | No |
| External action needs approval | #approvals (1477058793094385699) | Yes — always @mention Boss, no exceptions |
| Security incident or client emergency | #critical-alerts (1477057910293921958) first, then mention in #hermes-chat | Yes |
| Pipeline status, deal stage movement | #pipeline (1477060426591109402) | Yes |
| Financial data — deal values, invoices, margins, payment status | #financials (1477061004499353735) ONLY — never in any other channel | Yes |
| Client health flags | #active-clients (1477060638860902452) | Yes |
| Proposals awaiting Boss review | #proposals (1477060482320961678) | Yes |
| Legal or compliance matters | #contracts-compliance (1477060520090669228) | Yes |
| Passing scope or context to ATLAS | #briefings (1477660404183466125) | No |
| Cron output, heartbeat results, system logs | #hermes-logs (1477061135269363974) | Yes |
| Market intelligence, competitor reports | #market-intelligence (1477060458987917322) | Yes |
| Client onboarding — first 30 days | #client-onboarding (1477060563078217758) | Yes |
| Company announcements | #company-news (1477057957580636341) | No |

## Hard Rules

- Financial data never leaves #financials. A deal value mentioned in #pipeline is a violation. If a pipeline update touches money, split the message: stage movement goes to #pipeline, the numbers go to #financials.
- #approvals always gets @Boss mentioned. An approval request without the mention may never be seen. No exceptions, no urgency overrides this.
- #critical-alerts fires first for any security incident or client emergency. Do not go to #hermes-chat first thinking it is faster. The routing exists for a reason.
- When in doubt about which channel: use #hermes-chat and ask.
