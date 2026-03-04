# Agent Role Research Report
**Compiled by:** HERMES
**Version:** 2.0 (improved)
**Date:** 2026-03-04
**Purpose:** Research-backed grounding for all 7 commercial sub-agent configurations at Delphi
**Sources:** Wikipedia, industry knowledge (B2B SaaS commercial org design), domain expertise applied to Delphi context (AI process automation, SME clients, EUR 250–350/month, GDPR-sensitive sectors)

---

## Cross-Role Architecture

Before the individual roles: the commercial team at Delphi is a **pipeline machine**. Every role has a single handoff point. Leads flow in one direction — SDR → AE → AM. Finance, Legal, Market Intelligence, and Knowledge Curator are support functions that feed into the core pipeline at defined trigger points.

```
Market Intelligence → [ICP signals, sector intel]
         ↓
       SDR → [qualified handoff] → AE → [closed deal] → AM
         ↑                          ↑         ↑
      Legal ←──── triggers ────── Legal     Finance
      Finance ←── triggers ──── Finance   Legal
         ↓
  Knowledge Curator ← [all lessons, outcomes, patterns]
```

HERMES sits above all of this — receiving reports, directing escalations, making commercial decisions, and routing approvals to Boss.

---

## Role 1: SDR — Sales Development Representative

### What the role actually does

The SDR is the top of the funnel. It does one thing: convert raw leads into qualified opportunities that the AE can close. The SDR does not sell. It qualifies.

**The two flows:**
- **Inbound**: A prospect showed interest (website form, referral, event). SDR verifies they meet ICP criteria before passing to AE.
- **Outbound**: SDR identifies prospects that match the ICP, initiates outreach (calls, email sequences, LinkedIn), qualifies them through the conversation.

**The SDR's only deliverable:** A Sales Qualified Lead (SQL) — a lead that has been verified against BANT or MEDDIC criteria, with enough context for the AE to open a discovery conversation immediately.

### KPIs

| KPI | Definition | Good benchmark |
|---|---|---|
| SQLs generated / month | Leads that pass qualification and are accepted by AE | 15–25 at early stage |
| SQL acceptance rate | % of SDR-passed leads AE accepts as qualified | >85% — anything below means SDR is padding |
| Touch-to-meeting rate | % of outreach sequences that result in a booked meeting | 3–8% outbound; 20–40% inbound |
| Meeting show rate | % of booked meetings that actually happen | >80% — low rate = poor qualification |
| Lead-to-SQL conversion | % of total leads that reach SQL | Varies by channel; inbound >30%, outbound 5–15% |
| Response time on inbound | Time from lead submission to first SDR contact | <5 minutes significantly increases conversion |

### Daily workflow

1. Review inbound leads — score against ICP criteria
2. Run outbound sequences — identify new prospects matching ICP, enrol in cadence
3. Follow up on open sequences — touch 2, 3, 4 of active cadences
4. Qualify conversations — apply BANT: Budget confirmed? Authority confirmed? Need confirmed? Timeline real?
5. Produce handoff brief for any lead reaching SQL — fill template, pass to AE
6. Log all disqualified leads with reason — feeds Market Intelligence and future ICP refinement

### Common failure modes

- **SQL inflation**: Passing unqualified leads to hit targets. Destroys AE trust within weeks.
- **Cadence abandonment**: Stopping follow-up after 1–2 touches. Most B2B replies come at touch 5–8.
- **Over-qualifying**: Spending 3 sessions on a lead that should have been disqualified in 10 minutes. At Delphi's price point, qualification should take one structured interaction.
- **Weak handoff documentation**: Passing a name and company name with no context. AE opens discovery call blind and wastes the lead.

### Applied to Delphi

The SDR at Delphi is an AI agent — no phone calls, no emails. It processes lead data (website forms, referrals, manual entries), applies the qualification framework, and produces a structured handoff or a documented disqualification.

**ICP signal strength for Delphi:**

| Signal | Strength | Why |
|---|---|---|
| Sector: dental, health, legal, accounting | Strong | Pre-validated GDPR exposure + admin overhead |
| Business size: 3–20 employees | Strong | Too small for enterprise software, too complex for spreadsheets |
| Existing paper-based or manual workflows visible | Strong | Pain is explicit |
| Multi-site practice | Very strong | Coordination overhead scales sharply |
| Solo practitioner | Weak | Budget sensitivity high, integration complexity low |
| IT department present | Weak | Long procurement cycles, enterprise competition |

**Key insight:** At EUR 300/month, qualification speed > qualification depth. One structured pass is enough. The AE's discovery call fills the gaps. SDR that over-qualifies creates artificial delay.

---

## Role 2: Account Executive

### What the role actually does

The AE takes a qualified lead and converts it into a signed contract. This is a consultative sale — the AE does not pitch features, they diagnose problems and position the solution as the right fix.

**The MEDDIC framework** (industry standard for B2B SaaS):
- **M**etrics — what measurable outcome does the client expect?
- **E**conomic buyer — who controls the budget and signs?
- **D**ecision criteria — what does the client use to evaluate solutions?
- **D**ecision process — how do they make a buying decision internally?
- **I**dentify pain — what problem is costing them time, money, or compliance risk?
- **C**hampion — who inside the organisation wants this to succeed?

At SME level (Delphi's market), MEDDIC compresses dramatically. The dentist who owns the clinic is often the economic buyer, champion, and decision process in one person. The AE's job is to run a tight discovery, build a clear ROI narrative, and close.

### KPIs

| KPI | Definition | Good benchmark |
|---|---|---|
| Quota attainment | Revenue closed / target | >80% sustained = strong |
| Win rate | Closed won / total closed | >35% at SME level |
| Average sales cycle | Days from SQL to signature | 10–21 days at Delphi's price point |
| Proposal-to-close rate | % of proposals that result in a signature | >35% |
| Deal velocity | Revenue / average days in pipeline | Maximise — stalled deals rarely close |
| Loss categorisation accuracy | Every loss has a documented reason | 100% — powers MI and playbook refinement |

### Daily workflow

1. Review new SQL handoffs from SDR — read handoff brief fully
2. Prepare discovery call: confirm MEDDIC hypothesis based on handoff data
3. Run or prepare discovery: map pain → solution → ROI
4. Trigger ATLAS (if technical scope required) — ae-atlas-trigger.md template
5. Trigger Legal (if GDPR or contract review required) — ae-legal-trigger.md template
6. Draft proposal — based on discovery log + ATLAS estimate + Legal sign-off
7. Follow proposal-sent cadence: 48h, 5d, 10d
8. Close or document loss — ae-loss-debrief.md on every closed-lost deal
9. Handoff to AM on closed-won — ae-am-handoff-brief.md

### Common failure modes

- **Skipping discovery**: Jumping to pitch without understanding the specific pain. Results in proposals that don't land.
- **Long cycles at low ACV**: An EUR 3,600/year deal that takes 90 days to close loses money on AE time. At Delphi's price point, 30+ day cycles are a process failure.
- **Proposal before gates clear**: Sending a proposal before ATLAS estimate or Legal review is complete exposes Delphi to scope risk and compliance liability.
- **No loss debrief**: Losing a deal and not documenting why means the next AE (or next session) repeats the same mistake.
- **Discounting on instinct**: Offering a discount at the first price objection without understanding whether price is the real blocker.

### Applied to Delphi

The AE at Delphi prepares discovery documentation, produces proposal drafts, triggers the gate sequence, manages the follow-up cadence, and documents outcomes. All external communication routes through HERMES → Boss approval → execution.

**Gate sequence target timings:**
- ATLAS estimate: ≤2 business days
- Legal review: ≤2 business days
- Finance sign-off: ≤1 business day
- Total gate time: ≤5 business days

Anything beyond 5 days is a bottleneck that must be escalated to HERMES.

**Key insight:** The AE's ROI narrative for dental/health clients has a specific structure: (1) hours saved on admin per week × hourly cost, (2) GDPR fine exposure eliminated, (3) patient data error reduction. These three levers cover 90% of the closing argument.

---

## Role 3: Account Manager

### What the role actually does

The AM takes a signed client and ensures they stay, expand, and refer. The AE closes the deal; the AM makes it worth having closed.

The AM is not a support role. It is a commercial role. Retention and expansion are revenue functions. A churned client is a negative revenue event. An expanded client is new revenue without CAC.

**Core AM activities:**
- **Onboarding**: First 30 days determine whether a client succeeds or struggles. AM owns onboarding completion.
- **Health monitoring**: Continuous tracking of engagement signals, support volume, and satisfaction. Healthy clients renew. Unhealthy clients churn.
- **Renewal management**: Proactive renewal preparation at 90 days before expiry. Never reactive.
- **Expansion**: Identifying and qualifying upsell and cross-sell opportunities from within the client base.
- **Escalation handling**: When something goes wrong for a client, the AM is the first internal responder.

### KPIs

| KPI | Definition | Good benchmark |
|---|---|---|
| Net Revenue Retention (NRR) | (Starting MRR + expansion - churn - contraction) / starting MRR | >105% = growth from existing base |
| Churn rate | % of clients lost in period | <3% monthly at SME level |
| Health score average | Mean health score across all clients | >70/100 |
| Onboarding completion rate | % of clients completing all 30-day milestones | >90% |
| Time to first value | Days from contract signature to first automation live | <14 days at Delphi |
| Renewal rate | % of renewals completed on or before expiry date | >90% |
| Expansion pipeline | MRR value of active upsell/cross-sell opportunities | Track monthly |

### Daily workflow

1. Check health signals across all active clients — flag anything below threshold
2. Review onboarding status for clients in first 30 days — chase any stalled milestones
3. Act on any risk flags — no activity in 14 days, health score drop, support spike
4. Prepare upcoming renewals — 90-day window: review usage, prepare renewal brief
5. Identify expansion signals — usage growth, new hires, new locations, compliance changes
6. Log all interactions — every client touchpoint documented

### Common failure modes

- **Reactive management**: Only responding when clients complain. In dental/health, unhappy clients don't email — they don't renew. Proactive health monitoring is the only defence.
- **Onboarding drift**: Letting first-30-days milestones slip without intervention. Onboarding failure at week 2 is recoverable. At week 6, it is usually terminal.
- **Renewal surprise**: Finding out at day 0 that a client is not renewing. Renewal risk must be visible at 90 days.
- **Expansion too early**: Pitching upsell before the client has reached first value. Creates resentment rather than appetite.

### Applied to Delphi

At Delphi's current stage (pre-first-client), the AM's configuration is forward-looking. The frameworks must be ready before the first client is onboarded — not retrofitted after the first churn.

**Health score components for Delphi clients:**
- Automation usage rate (% of available automations active) — 30 points
- Support ticket volume (inverse — fewer = healthier) — 20 points
- Last client contact recency — 20 points
- Onboarding milestone completion — 20 points
- Invoice payment timeliness — 10 points

**Key insight:** Dental and health clients are not natural SaaS buyers. They evaluate software by how invisible it is — if they have to think about it, something is wrong. AM success at Delphi looks like clients who never need to contact support because the automation just runs.

---

## Role 4: Finance Agent

### What the role actually does

In a B2B SaaS company at Delphi's stage, the Finance function is primarily operational — invoicing, cash flow tracking, margin monitoring, and financial reporting. Strategic finance (fundraising, modelling, M&A) comes later. Today's finance function is about keeping the money flowing and the numbers honest.

**Core activities:**
- **Invoicing**: Generating invoices on time, sending them, tracking payment status
- **Revenue recognition**: Confirming when MRR is earned and recorded
- **Margin tracking**: Per-client margin — what does it actually cost to service this client vs what we charge?
- **Cash flow monitoring**: Upcoming invoices, outstanding receivables, payment timing
- **Reporting**: MRR, ARR, churn impact on revenue, cost per acquisition summary

### KPIs

| KPI | Definition | Good benchmark |
|---|---|---|
| DSO (Days Sales Outstanding) | Average days to collect payment after invoice | <30 days for SME clients |
| Invoice accuracy rate | % of invoices sent without error | >99% |
| Cash collection rate | % of invoiced revenue collected within payment terms | >95% |
| Gross margin per client | (Revenue - direct costs) / revenue | Target >70% at Delphi's model |
| MRR accuracy | Reported MRR vs contracted MRR | 100% — no drift |
| Overdue invoice rate | % of invoices past due date | <5% |

### Daily workflow

1. Check payment status on all outstanding invoices
2. Flag any invoice past due date — produce escalation note for HERMES
3. Process any new closed-won deals — prepare invoice brief for HERMES approval
4. Track MRR changes — new clients, churned clients, expansions, contractions
5. Produce weekly financial pulse report for HERMES

### Applied to Delphi

Finance at Delphi is currently dormant — no clients, no invoices. The Finance agent's first real activation is when the first deal closes. The configuration must be ready for that moment.

**Payment terms recommendation:** Net-14 for SME clients. Net-30 creates cash flow lag that hurts a pre-revenue company. Net-14 with automated reminder at day 10 is the right default.

**Key insight:** VAT treatment for digital services in Portugal requires attention from day one. Portuguese VAT (23% standard rate) applies to B2B digital services. Invoices must be compliant — SAF-T format required for Portuguese tax authority (AT). Legal agent must review the invoice template before first use.

---

## Role 5: Legal & Compliance

### What the role actually does

At a company handling SME client data in GDPR-sensitive sectors (dental, health, legal, accounting), legal and compliance is not optional box-ticking — it is a commercial differentiator and a liability management function.

**Core scope:**
- **Contract review**: Every client contract reviewed before execution. MSA terms, SLA liability caps, IP ownership, termination clauses.
- **GDPR compliance**: Delphi processes data on behalf of clients who are themselves data controllers. Delphi is a data processor. This creates specific GDPR obligations.
- **Data Processing Agreements (DPAs)**: Required by law before Delphi touches any client's personal data. Article 28 GDPR mandates DPAs between controllers and processors.
- **Sector-specific compliance**: Health data (Article 9 GDPR) is "special category" — higher protection requirements. Every dental/health client engagement requires explicit DPA review.

### GDPR Risk Map for Delphi

| Risk | Category | Consequence if missed |
|---|---|---|
| No DPA before processing health data | Article 9 violation | Up to 4% global turnover fine |
| Data stored outside EEA without safeguards | Article 46 violation | Up to 2% global turnover fine |
| No record of processing activities | Article 30 violation | Regulatory action |
| No breach notification procedure | Article 33 violation | Fine + reputational damage |
| Automated decision-making without disclosure | Article 22 | Fine + client liability |

### KPIs

| KPI | Definition | Target |
|---|---|---|
| DPA completion rate | % of active clients with signed DPA before data processing begins | 100% — no exceptions |
| Contract review turnaround | Hours from trigger to review complete | <48 business hours |
| Open compliance gaps | Issues identified but not yet resolved | 0 at any given time |
| Policy update lag | Days between regulatory change and internal policy update | <14 days |

### Applied to Delphi

The Legal agent reviews every contract and DPA before execution. No proposal leaves Delphi without Legal sign-off. No data processing begins without a signed DPA.

**DPA essentials for Delphi (as processor):**
- Purpose and duration of processing
- Nature and purpose of processing
- Type of personal data and categories of data subjects
- Obligations and rights of the controller
- Sub-processor list (OpenAI/Anthropic APIs if used in automation)

**Key insight:** Most dental clinics in Portugal have never been asked to sign a DPA by any software vendor. Delphi requiring a DPA before processing is not a friction point — it is a trust signal. Position it as: "We take your patients' data more seriously than anyone else you've worked with."

---

## Role 6: Market Intelligence Analyst

### What the role actually does

The MI analyst monitors the competitive landscape, sector developments, and ICP signal changes — and turns that raw information into actionable commercial intelligence. It is not a research role for its own sake. Every output must answer: "Does this change how we sell, price, or position?"

**Core activities:**
- **Competitor monitoring**: Pricing changes, new features, customer win/loss patterns, funding rounds
- **Sector tracking**: Regulatory changes in dental/health/legal/accounting that create new pain points (and new opportunities for Delphi)
- **ICP signal tracking**: Signs that a target company is becoming a better or worse fit
- **Win/loss intelligence**: Synthesising patterns from AE loss debriefs into positioning improvements

### KPIs

| KPI | Definition | Target |
|---|---|---|
| Actionable intel reports / month | Reports that directly influenced a proposal, positioning change, or pricing decision | >2/month |
| Regulatory change lag | Days from regulatory announcement to briefing delivered to HERMES | <5 days |
| Competitor pricing accuracy | % accuracy of tracked competitor pricing vs published rates | >90% |
| Win/loss pattern identification | Quarterly synthesis of AE loss data into positioning recommendations | 1 per quarter |

### Competitor landscape (initial)

| Competitor type | Example | Delphi's position |
|---|---|---|
| Generic process automation (enterprise) | Zapier, Make.com | Too complex, no sector expertise, no GDPR focus |
| Dental practice management software | Carestream, Cliniface | Operational, not automation. No AI. No GDPR specialisation |
| Generic AI tools (ChatGPT etc.) | OpenAI | No sector compliance, no integration, no support |
| Local IT consultants | Various in Porto | Bespoke, expensive, not scalable, no AI |

**Delphi's defensible position:** Sector-specific AI automation with GDPR compliance built in, at SME pricing, with ongoing support. No current competitor combines all four.

### Applied to Delphi

Without Brave API key, the MI agent's web search capability is limited to direct URL fetching via agent-browser. This means it can monitor known competitor URLs and sector publication pages directly, but cannot do broad discovery scanning. This is a known limitation — document it clearly so MI doesn't silently deliver degraded reports.

**Key insight:** The most valuable MI output for Delphi at this stage is **regulatory change tracking**. Portugal's healthcare data regulations, EU AI Act compliance requirements for automated decision systems, and GDPR enforcement actions in the health sector are all directly relevant to Delphi's positioning. Each regulatory tightening is a new sales trigger.

---

## Role 7: Knowledge Curator

### What the role actually does

The Knowledge Curator maintains Delphi's institutional memory — the accumulated learning from every deal won, deal lost, client onboarded, client churned, and market insight gathered. Without curation, this knowledge decays. With good curation, every agent gets better at their job over time because they can access prior experience.

**The core distinction in knowledge management:**
- **Explicit knowledge**: Documented, transferable — templates, runbooks, playbooks, case studies
- **Tacit knowledge**: Experience-based, harder to capture — judgment calls, pattern recognition, intuition about a sector

The KC's job is to turn tacit knowledge into explicit knowledge, then keep the explicit knowledge current and findable.

**Core activities:**
- **Capture**: After every significant event (deal won, deal lost, client churned, major objection handled), capture the lesson
- **Structure**: Organise knowledge so it is findable — not a dump, a searchable library
- **Synthesise**: Identify patterns across multiple cases — "we lose every deal where X happens" is more valuable than ten individual loss notes
- **Maintain**: Remove outdated entries, update templates when practices change, version control on all documents
- **Distribute**: Push relevant knowledge to agents who need it at the right moment

### KPIs

| KPI | Definition | Target |
|---|---|---|
| Knowledge entry quality rate | % of entries that pass the "new AE test" (could a new session immediately act on this?) | >90% |
| Entry freshness | % of entries updated within last 90 days OR explicitly marked as still current | >80% |
| Capture latency | Days from significant event to knowledge entry created | <2 days |
| Retrieval success rate | % of knowledge searches that return a useful result | >85% |

### Quality gate

Every knowledge entry must pass this test before being marked complete:
> "If a brand-new AE agent session read only this entry, would it perform meaningfully better on the relevant situation?"

If the answer is no, the entry needs more work.

### Applied to Delphi

At pre-revenue stage, the KC's first job is to build the foundation — document the ICP hypothesis, the current competitive positioning, the known objection patterns, and the sector-specific context for each target market. This gives every future agent a starting baseline instead of a blank page.

**Knowledge domains for Delphi (initial):**
1. ICP patterns — what good and bad leads look like, with examples
2. Sector intelligence — dental, health, legal, accounting context
3. Objection library — known objections and validated responses
4. Competitive positioning — how Delphi beats each competitor type
5. GDPR playbook — DPA process, Article 9 requirements, compliance positioning
6. Onboarding patterns — what successful vs struggling onboardings look like
7. Deal patterns — win and loss patterns by sector, size, objection type

---

## Cross-Role Patterns

### The handoff chain

Every handoff is a trust transaction. When SDR passes to AE, the AE is trusting the SDR's qualification. When AE passes to AM, the AM is trusting the AE's relationship context. Weak handoffs create downstream failures that feel like AM problems but are actually SDR or AE problems.

**Solution:** Templates enforce minimum documentation at every handoff. No handoff without a complete template. HERMES reviews handoff quality during heartbeats.

### Deal velocity at EUR 300/month

ACV (annual contract value) drives how much process a deal can absorb. At EUR 3,600/year:
- Discovery: 1 session
- Proposal: 1 document, max 4 pages
- Gates: ≤5 business days total
- Close: 2–3 follow-ups max

Any process heavier than this destroys unit economics. A deal that costs 3 weeks of agent time at EUR 300/month is a loss before it's signed.

### GDPR as competitive advantage

Every dental or health client has latent GDPR liability. Most of their existing software vendors have never asked about it. Delphi leading with GDPR compliance is not a compliance overhead — it is a sales accelerant in sectors where the regulatory exposure is real and the risk of a data breach is financially significant.

### The knowledge loop

MI feeds SDR with ICP signals → SDR feeds AE with qualified leads → AE feeds AM with onboarded clients → AM feeds KC with client outcomes → KC feeds all agents with improved patterns → MI incorporates competitive context. This loop is how the commercial department gets better over time. HERMES must ensure the loop completes after every significant event.

---

*Last updated: 2026-03-04 v2.0 — substantially improved from v1.0: added KPI benchmarks, daily workflows, failure mode details, competitive landscape, GDPR risk map, VAT note, knowledge quality gate, cross-role architecture diagram, deal velocity framework.*
