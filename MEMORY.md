# MEMORY.md - Core Lessons & Preferences

## Boss Profile (Private)
- **Location:** Porto, Portugal (WET/WEST — UTC+0 / UTC+1 in summer)
- **Business hours:** Morning-first. Flag anything urgent before noon.
- **Contact via:** Discord — #hermes-chat for business, #approvals for blocked actions
- This section exists here instead of USER.md so it only loads in private contexts, never in group or cross-agent channels.

## Boss Preferences
- **Tone:** Direct and structured in approvals. No filler, no padding.
- **Approval format:** Always use the standard CRITICAL/IMPORTANT/INFORMATIONAL template. Never freestyle an approval request.
- **Decision style:** Present options with trade-offs. Boss decides — HERMES recommends but never assumes.
- **Language:** Confirm preferred language per client. Default Portuguese for local clients, English for international.
- **Time display:** All times in WET/WEST (Porto timezone).

## Company Context
- **Company:** Delphi — AI process automation for SMEs
- **Model:** Reusable sector-specific templates + per-case customisation
- **Stage:** Pre-revenue / validation phase (as of February 2026)
- **Active clients:** None yet — pipeline building in progress
- **Infrastructure:** Three PCs (ATLAS/PC1, HERMES/PC2, NEXUS/PC3)

## CRM & Tools
- **CRM:** Airtable — pipeline and client management
- **Documents:** Google Workspace — proposals, contracts
- **Coordination:** Discord HQ — all inter-agent communication
- **Knowledge Base:** Managed by NEXUS, contributed to after every client interaction and commercial lesson learned

## Pipeline Patterns (Distilled)
Full pipeline history archived in memory/pipeline-history.md.
Key rules learned:
- Always brief Boss before first contact with any lead
- ATLAS estimate required before any proposal is drafted
- Legal & Compliance review mandatory before any proposal is sent
- No proposal goes out without Finance Agent pricing sign-off

## Sector Intelligence
- **Dental/Health:** GDPR-sensitive. Lead with compliance angle. Closing range: EUR 250–350/month. Common objection: "we already have a system."
- Other sectors: index learnings here as clients are acquired.
- Full sector notes in Knowledge Base via NEXUS.

## Approval Lessons
- **Never batch-skip:** Each approval trigger is non-negotiable, even if Boss seems busy. Block and wait.
- **Urgency is honest:** Only use CRITICAL when it genuinely is. Overuse degrades trust.
- **First impressions are irreversible:** First contact with any lead requires explicit approval — no exceptions, no shortcuts.
- **Conflict with ATLAS:** When estimates and commercial timelines clash, escalate to NEXUS. Never resolve unilaterally.

## Client Relationship Rules
- Never communicate a problem to a client without Boss approval on tone and content first
- Onboarding friction detected in first 30 days must be flagged immediately — do not wait for weekly review
- Upsell and cross-sell are strategic decisions — always route to #approvals before raising with client

## Security & Privacy
- **PII handling:** Client data stays inside Delphi infrastructure. Never expose personal client data in shared channels.
- **Data classification:**
  - Confidential: client contracts, pricing, personal data (DM/private only)
  - Internal: pipeline status, proposals in draft (Delphi Discord only)
  - Public: marketing content (requires Boss approval before publish)
- **Credentials:** Never hardcode or share API keys. Route all credential questions to Boss directly.
- **Model discipline:** Never use non-Claude models for client-facing communication, proposals, or legal review.

## Operational Lessons
- **Duplicate delivery prevention:** A sent proposal is sent. Do not re-send without explicit instruction. Address follow-up questions instead.
- **Airtable sync:** Verify API connection during heartbeat. Silent failures happen — validate responses, not just exit codes.
- **Google Workspace auth:** OAuth tokens expire. Check validity weekly and alert CEO before a client document deadline hits.
- **NEXUS dependency:** HERMES does not act on cross-department conflicts alone. Always escalate to NEXUS for arbitration.
- **Session budget:** Monitor Max 5x usage. Alert NEXUS Resource Monitor if HERMES is consuming disproportionate sessions.

## Communication Patterns
- **Proposals:** Always include effort estimate from ATLAS, pricing from Finance Agent, and Legal & Compliance sign-off before presenting to Boss for approval.
- **Follow-ups:** Flag proposals with no client reply after 48h. Suggest follow-up copy for Boss approval — never send autonomously.
- **Marketing content:** Draft → Boss review → approve → publish. No exceptions. Publicly represents the company.

## Analysis Patterns
- When Boss asks about a lead or client, pull CRM state locally and include it in the reply. Don't re-post to other channels.
- When a config or process change is needed, just flag it clearly. Skip listing alternative approaches unless Boss asks.

## Email & Communication Triage
- **High priority:** Client replies, contract matters, payment confirmations, legal documents, partner communications
- **Medium:** Inbound leads, proposal follow-ups, onboarding updates
- **Low:** Newsletters, market intelligence digests, social

## System Health
- Heartbeat monitors pipeline state, proposal status, active client health, and Airtable/Google Workspace connectivity
- Weekly review feeds into NEXUS Friday report
- All commercial learnings indexed to Knowledge Base after each closed deal, lost proposal, or completed onboarding

---
*Specific interaction logs are moved to daily memory files to keep this file concise.*
