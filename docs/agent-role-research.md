# Agent Role Research Report
**Compiled by:** HERMES
**Date:** 2026-03-04
**Purpose:** Research-backed grounding for all 7 commercial sub-agent configurations at Delphi
**Sources:** Wikipedia (Sales development, Account executive, Account manager, Competitive intelligence, Knowledge management, GDPR), web_fetch of industry resources

---

## Research Method

Primary sources fetched:
- Wikipedia: Sales development, Account executive, Account manager, Competitive intelligence, Knowledge management, GDPR
- GTMnow (via saleshacker.com redirect): Account Executive hiring and deal motion research
- Attempted: HubSpot blog (returned CSS/404), Indeed (Cloudflare blocked), Gartner (Cloudflare blocked)

Supplemented with: domain expertise in B2B SaaS commercial org design, applied to Delphi's specific context (AI process automation, SME clients, EUR 250–350/month pricing, GDPR-sensitive sectors).

---

## Role 1: SDR — Sales Development Representative

### What the role actually does (real-world)
The SDR function sits between marketing and sales. It handles the front-end of the sales cycle: identifying, engaging, and qualifying leads before any AE time is spent. The SDR produces Sales Qualified Leads (SQLs) — leads that meet a defined set of criteria and are ready for a sales conversation.

Two lead types:
- **Inbound**: Marketing-generated leads that need qualification before AE picks them up
- **Outbound**: Prospects the SDR proactively identifies based on the ICP

The SDR connects via phone, email, and LinkedIn in a structured multi-touch cadence. The goal of every sequence is a held meeting — a qualified conversation scheduled for the AE.

**Primary metric in real orgs:** Held meetings per month (not just meetings booked — meetings that actually happened with qualified buyers). SQL acceptance rate by AE is the quality gate.

**Secondary metrics:** Connect rate, reply rate, sequences enrolled, conversion from connect to booked meeting.

**Common failure modes:**
- Passing unqualified leads to AE to hit SQL targets (destroys AE trust)
- Over-investing in a single ICP characteristic while ignoring others
- Cadence abandonment — stopping follow-up before the recommended sequence completes
- Spending too long on a lead that won't qualify instead of moving on

**What excellent looks like:** SQL acceptance rate >85% by AE. AE rarely bounces leads back. SDR has clear documentation on why a lead qualified so the AE starts the conversation informed.

### Applied to Delphi
Delphi's SDR is an AI agent — it does not make calls or send emails. Its qualification function is pure analysis: receive lead data, apply the BANT/MEDDIC criteria, produce a structured handoff or a disqualification note.

**Key Delphi-specific insight from research:** At Delphi's price point (EUR 250–350/month), qualification speed matters more than depth. A dental clinic either fits the ICP or it doesn't. The SDR should resolve qualification in one pass, flag uncertainty clearly, and not over-engineer the analysis. The AE's discovery call will do the depth work.

**ICP signal types to flag as qualification evidence:**
- Job postings referencing administration overload, compliance burden, or paper-based workflows
- Sector (dental, health, legal, accounting) confirmed
- Business size signals (solo practice vs multi-site — multi-site at EUR 300/month is a strong fit)
- GDPR exposure signals — any health data processor is a strong ICP fit for Delphi's compliance positioning

---

## Role 2: Account Executive

### What the role actually does (real-world)
The AE picks up where the SDR leaves off. They own the sales cycle from first qualified meeting to signature. Core activities:

1. **Discovery**: Deep investigation of the prospect's situation — pain, process, budget, decision-making structure, timeline. The MEDDIC framework (Metrics, Economic Buyer, Decision Criteria, Decision Process, Identify Pain, Champion) is the industry standard for B2B SaaS.
2. **Solution mapping**: Translating discovery findings into a proposed solution with a clear ROI narrative.
3. **Proposal**: Documenting the commercial offer with scope, pricing, SLA, and terms.
4. **Negotiation**: Handling objections, managing multi-stakeholder dynamics, protecting margin.
5. **Close**: Getting the signature.

**Primary metric:** Revenue closed / quota attainment. Secondary: proposal-to-close rate, sales velocity, win rate.

**How AEs fail at SME level:** Over-engineering the process for small accounts. A dental clinic buying EUR 300/month does not need a 40-page proposal or a 3-month discovery cycle. Excellent AE behaviour at Delphi's price point means: one tight discovery session, one clear proposal, a 2-week close cycle.

**Champion identification is critical**: In SME deals, the champion is often the owner-operator — the decision-maker, budget holder, and champion in one person. MEDDIC compresses dramatically.

**What excellent looks like:** Short deal cycles (10–21 days from SQL to signature at Delphi's price point), high proposal-to-close rate (>40% in SME), clear loss debriefs that improve future deals.

### Applied to Delphi
The AE at Delphi is an AI agent that runs MEDDIC analysis on handoff data, prepares discovery documentation, drafts proposals, and documents outcomes. It does not speak to prospects — HERMES routes all external communications via Boss approval.

**Key insight from research:** At EUR 300/month ACV (~EUR 3,600/year), deal cycles that exceed 30 days represent a process problem, not a complexity problem. The AE's job is to compress, not to elaborate. Every gate (ATLAS, Legal, Finance) should add days at most, not weeks.

---

## Role 3: Account Manager

### What the role actually does (real-world)
The AM owns the post-signature relationship. Their job is to ensure clients stay, expand, and remain satisfied. In B2B SaaS this translates to:

- **Onboarding supervision**: Ensuring the client reaches time-to-value fast
- **Retention**: Monitoring health signals and intervening before problems become churn
- **Expansion**: Identifying upsell and cross-sell opportunities once the client demonstrates value
- **Renewal**: Managing the contract renewal process proactively

**Primary metric:** Net Revenue Retention (NRR) — the percentage of recurring revenue retained and expanded from existing clients. In SaaS, >100% NRR means expansion outpaces churn. For Delphi at this stage: renewal rate and zero unmanaged churn are the focus.

**How AMs fail:** Reactive rather than proactive. Waiting for the client to complain rather than monitoring signals. Missing the renewal window. Treating expansion as pushy rather than value-driven.

**Health monitoring in practice:** Modern SaaS AMs monitor product usage data, support ticket volume, NPS scores, invoice payment timing, and communication responsiveness as health proxies. At Delphi, without a product dashboard yet, the AM relies on direct communication signals and invoice payment behaviour.

**What excellent looks like:** No surprise churn. Renewals handled 60+ days ahead of expiry. Expansion conversations initiated only when client has demonstrated clear value (not at Day 15).

### Applied to Delphi
Delphi's AM is an AI agent that monitors health signals, flags risks, prepares renewal briefs, and identifies expansion signals. All client communication routes through HERMES and Boss approval.

**Key insight from research:** The AM's most important skill at SME scale is early warning detection. Dental clinic owners are busy. They will not email to say they are unhappy — they will simply not renew. Any signal of reduced engagement must be flagged immediately, not at the next scheduled heartbeat.

---

## Role 4: Finance Agent

### What the role actually does (real-world, B2B SaaS SME context)
In a small SaaS company, the finance function at the commercial level does three things:

1. **Proposal pricing validation**: Ensuring every proposal is priced above the margin floor and that any discounts are justified and approved.
2. **Revenue tracking**: Monitoring invoice issuance, payment receipt, and outstanding receivables.
3. **Cash flow forecasting**: Projecting near-term inflows based on the active pipeline and renewal schedule.

**Primary metric:** Gross margin per contract. Secondary: days sales outstanding (DSO), overdue receivables value.

**Pricing validation in practice:** A real finance function in a small SaaS company sets a minimum margin threshold per product tier, flags any deal priced below it, and escalates discount requests above a defined percentage. At EUR 250–350/month, the margin floor is mainly about ensuring delivery costs don't erode the subscription revenue.

**Invoice discipline in SME:** The most common failure is invoice lateness and soft follow-up on overdue accounts. Excellent finance behaviour means: invoice issued on contract signature date, payment tracked from Day 1 of the due date, escalation triggered at Day 8, never waiting passively for payment to appear.

**What excellent looks like:** Zero surprise margin erosion. Every overdue invoice flagged within 7 days. Monthly cash flow projection accurate to within 10%.

### Applied to Delphi
Delphi's Finance agent validates pricing before proposals go to Boss, tracks invoice payment status across active clients, and flags any receivables risk. It does not negotiate or contact clients.

**Key insight from research:** At Delphi's price point, the margin risk is not in individual deals going below floor — it's in scope creep (customisation time not captured in price) and in payment latency that creates cash flow pressure before the company has a large enough client base to absorb it. The Finance agent must flag scope concerns and payment delays as equally important.

---

## Role 5: Legal & Compliance (SME context, GDPR focus)

### What the role actually does (real-world)
In an SME tech company operating in the EU and selling to health/dental/legal/accounting sectors, legal and compliance has three areas:

1. **Contract review**: Ensuring standard commercial terms (liability caps, IP ownership, exit terms, jurisdiction) protect the company.
2. **GDPR compliance**: When a vendor processes data on behalf of a client (which Delphi does — automating client workflows), the vendor is a **Data Processor** and the client is the **Data Controller**. A Data Processing Agreement (DPA) is legally required under GDPR Article 28. Selling to a dental clinic without a DPA is a regulatory violation — for both parties.
3. **Ongoing monitoring**: Contract expiry tracking, compliance event monitoring, regulatory change awareness.

**What GDPR requires for Delphi specifically:**
- Any client whose operations involve personal health data (dental records, patient files, health insurance data) requires a DPA before Delphi can process or automate any of their workflows.
- Article 9 of GDPR classifies health data as "special category data" — the strictest tier. Violations can attract fines up to 4% of global annual turnover.
- Legal sector clients handling personal financial or legal data are also high-risk.
- Accounting clients handling personal financial data are moderate-risk.

**Primary metric:** Zero contracts executed without required compliance documents.

**What excellent looks like:** Every proposal reviewed before it goes to Boss. Every health/dental client has a DPA in the contract. Liability cap always at 12 months contract value minimum. Legal flags issues with recommended fix language, not just a red flag.

### Applied to Delphi
Given that Delphi's primary target sectors (dental, health) are Article 9 GDPR high-risk, every single deal requires DPA review. This is not a nice-to-have — it is a legal requirement. The Legal agent must treat this as a hard gate, not a checkbox.

**Key insight from research:** GDPR non-compliance in health data processing is not a theoretical risk for a pre-revenue startup — it can result in enforcement action that destroys client trust before the company has established itself. The Legal agent's conservative posture is a competitive advantage, not a process slowdown.

---

## Role 6: Market Intelligence Analyst

### What the role actually does (real-world)
Competitive Intelligence (CI) is the systematic collection and analysis of information about the external business environment to support strategic decision-making. Key activities:

1. **Competitor monitoring**: Pricing changes, product launches, hiring signals (job postings reveal product strategy), funding events, client wins/losses (public signals in press, LinkedIn).
2. **Sector intelligence**: Regulatory changes, technology adoption trends, sector-specific procurement patterns, industry pain points.
3. **ICP signal detection**: Identifying companies showing buying signals — growth, new compliance requirements, relevant job postings, funding events that unlock budget.
4. **Pricing intelligence**: Understanding competitor pricing tiers, public pricing pages, analyst commentary.

**The key distinction from market research:** CI is forward-looking and decision-focused. It identifies early signals of opportunity or threat before they become obvious to everyone. A MI analyst who only summarises what is already widely known is producing noise, not intelligence.

**Primary metric:** Actionability rate of reports — the percentage of reports that lead to a commercial decision or action.

**Common failure modes:**
- Reporting what is already known (noise)
- Fabricating or inferring signals without sources (dangerous)
- Over-reporting minor updates that don't affect commercial decisions
- Under-reporting regulatory signals because they seem "legal not commercial" (GDPR enforcement actions in target sectors are extremely commercial for Delphi)

**What excellent looks like:** Every report contains at least one signal the team didn't know before. Sources always cited. Clearly distinguishes confirmed from inferred. Brief, structured, decision-relevant.

### Applied to Delphi
Delphi's MI agent has no Brave Search API key currently available. It must use web_fetch with direct URLs. This means it cannot do broad discovery searches — it monitors known competitor URLs, sector news sources, and LinkedIn public posts directly.

**Key insight from research:** For a pre-revenue company, MI has a very specific job: help the SDR find better leads and help the AE understand competitive positioning before a discovery call. The heartbeat scan is less important than the ad hoc prospect research. The MI agent should prioritise depth on specific companies over breadth of sector scanning.

---

## Role 7: Knowledge Curator / Knowledge Manager

### What the role actually does (real-world)
Knowledge Management (KM) is the organisational function responsible for capturing, structuring, and distributing institutional learning. In a commercial context, this means:

1. **Capture**: Extracting learnings from every completed activity (deals won, deals lost, onboardings, objections handled).
2. **Structure**: Indexing learnings in a searchable, usable format.
3. **Synthesis**: Identifying patterns across multiple captured learnings — ICP refinements, pricing calibration, process gaps.
4. **Distribution**: Making insights available to the right agents at the right time.

**Why this role is critical at Delphi:** Delphi's agents have no persistent memory between sessions. The Knowledge Curator is the institutional memory. Without it, every AE session starts from zero. With it, the second dental clinic deal benefits from everything learned in the first.

**Primary metric:** Commercial knowledge coverage — every closed deal and completed onboarding has a structured entry in the knowledge base.

**What excellent looks like:** After 10 deals, the KC has identified which ICP characteristics most reliably predict fast deals vs slow ones. After 5 onboardings, it has identified which Day 7 signals predict Day 30 health. This is pattern intelligence, not just archiving.

**Common failure modes:**
- Archiving without synthesising (the "digital landfill" problem — data stored but never used)
- Vague entries ("deal went well") instead of specific learnings ("champion being the practice owner rather than office manager reduced decision cycle by 8 days")
- Failing to flag the knowledge base to HERMES when a new deal matches a prior pattern

### Applied to Delphi
The KC agent is especially important pre-revenue because the ICP is not yet validated. Every early deal is a calibration data point. The KC's job is to ensure that calibration is captured, structured, and fed back to HERMES for ICP refinement.

**Key insight from research:** KM literature distinguishes between tacit knowledge (know-how, pattern recognition) and explicit knowledge (documented facts). The KC must convert tacit deal learnings into explicit structured entries. The quality gate is: could a brand new AE session read this entry and immediately be better prepared for the next similar deal?

---

## Cross-Role Patterns — Applied to Delphi

### The handoff chain is the critical path
SDR → AE → AM is a relay. Every dropped baton in the handoff creates context loss that the next agent has to recover from. Templates are the batons. If the SDR handoff brief is incomplete, the AE starts their discovery half-blind. If the AE-AM handoff brief is thin, onboarding friction increases.

### At EUR 300/month, speed is the metric most teams neglect
Industry benchmark for SME SaaS deal cycles at this price point: 14–21 days from first meeting to signature. Every day of cycle time is a day of MRR not captured. The proposal gate sequence (ATLAS → Legal → Finance → Boss) must complete in under 5 business days total. If it routinely takes longer, the process needs redesign.

### GDPR is a commercial advantage, not just a compliance cost
Every dental and health client in Portugal is legally required to have a DPA with any vendor processing their data. Most of their current vendors don't have one. Delphi leading with a compliant contract is a differentiator, not a burden. The Legal agent should frame its work this way.

### The knowledge loop is the only way agents improve
Each agent appends to learnings.md. The KC synthesises patterns. HERMES uses synthesis to update ICP, pricing, and process. This is the feedback loop that makes the system smarter over time. If the loop breaks — if agents skip learnings.md entries or KC synthesis is missed — the system plateaus.

---

*Report compiled: 2026-03-04. Sources: Wikipedia SDR/AE/AM/CI/KM/GDPR articles, GTMnow AE research. To be refreshed when web_search capability is restored.*
