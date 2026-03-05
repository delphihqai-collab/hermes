# TOOLS.md - SDR Tools & Access

## Permitted Tools

### Read Operations
- **read** — Read any file in my workspace (memory/, templates/, AGENTS.md, etc.)
- **web_fetch** — Fetch HTTPS URLs for prospect research (company websites, public profiles, news articles)
- **web_search** — Search public web for prospect and sector information

### Write Operations
- **write** — Write files to my workspace (memory/learnings.md, memory/pipeline-state.md, local research notes)
- **message** — Post to #hermes-logs only (when HERMES explicitly requests; typically not needed)

### No Other Tools
- No `exec` — I do not run shell commands
- No `subagents` — I do not spawn sub-agents
- No `browser` — I do not automate web browsing
- No direct **Discord/channel posting** — all output goes to HERMES, not to shared channels
- No **Airtable API** — HERMES manages all CRM access; I read locally

---

## Delphi Infrastructure & Services

### Connected (Available)
- **Discord:** Full access for reading HERMES communications in #hermes-chat
- **Web:** Public internet for prospect research (LinkedIn, company websites, news)
- **Local workspace:** All files in teams/commercial/sdr/

### Not Connected (Do Not Attempt)
| Service | Status | What's Missing | Workaround |
|---|---|---|---|
| **Airtable** | Not connected | No API key configured | Request lead data from HERMES; maintain local notes |
| **Google Workspace** | Not connected | No OAuth token | HERMES manages document access; you read locally |
| **Slack / Teams** | Not integrated | No bot access | Communicate via Discord #hermes-chat only |

**Important Rule:** Do not attempt API calls to disconnected services. Request data from HERMES instead. Attempting to connect without credentials will fail silently and waste time.

---

## Prospect Research Tools

### Best Practices

**LinkedIn Research**
- Use web_fetch to read publicly available LinkedIn profiles
- Confirm contact role, company tenure, and connections
- High confidence source for authority and decision-maker verification
- Limit: personal profile details are semi-public; only use work-relevant data

**Company Website Research**
- Fetch company careers page (hiring activity = growth signal)
- Fetch company about/leadership pages (decision-maker identification)
- Fetch recent news/blog (sector pain points, recent announcements)
- High confidence source for sector confirmation and pain point identification

**Public News & Sector Intelligence**
- Search for company acquisitions, funding, leadership changes
- Search for sector trends (e.g., "GDPR compliance" + "dental practices")
- Search for regulatory changes affecting sector
- Medium confidence: older articles lose relevance; always check publication date

**Referral Source Validation**
- If a prospect is referred, verify the referrer if possible (LinkedIn search, web search)
- High confidence: directly referred by known contact
- Medium confidence: referred by someone we know professionally
- Low confidence: referred by someone we don't know; treat as cold lead

### Tools Not Available Yet

**Once Airtable Connects:**
- Direct CRM access to historical prospect data
- Lead source attribution (which channel brought them in?)
- Prospect tags and segmentation
- Currently: HERMES pulls this data; you work with what's provided

**Once Google Workspace Connects:**
- Prospect account history (past interactions, if any)
- Sales playbooks and templates
- Currently: HERMES manages documents; reference what they provide

---

## Specific Research Workflows

### LinkedIn Research for BANT Assessment

**Authority Check:**
```
1. Fetch prospect LinkedIn profile: web_fetch("https://www.linkedin.com/in/[person]")
2. Confirm role (do they match the role provided by HERMES?)
3. Confirm company tenure (>1 year = likely decision-maker credibility)
4. Note: "Authority — [Prospect name] is [role] at [company]; tenure [X months]; LinkedIn confirms role"
5. Confidence: HIGH if role and company match primary source; MEDIUM if partial match
```

**Budget Check (Indirect Signals):**
```
1. Fetch company website: web_fetch("https://company.com")
2. Look for recent funding announcements, hiring, growth signals
3. Search news for company financials or sector benchmarks
4. Note: "Budget — [Company] recently hired [X] staff (LinkedIn hiring activity)" or "Budget — company website shows no recent growth signals"
5. Confidence: LOW-MEDIUM for budget (not directly stated); ask AE to confirm
6. Mark as UNKNOWN if no signals found; don't assume
```

**Timeline Check:**
```
1. Fetch news: web_search("[company] [sector pain point] 2024-2025")
2. Look for recent hires in compliance, operations, automation roles (= active projects)
3. Look for regulatory deadlines in sector (e.g., GDPR deadline = urgency)
4. Note: "Timeline — [company] recently hired Compliance Officer (active project signal)" or "Timeline — UNKNOWN; no public signals"
5. Confidence: MEDIUM if public signals exist; LOW if only internal contact mentioned timeline
```

### Need Identification

```
1. Company website research: does their current website mention workflow automation, compliance, data handling?
2. LinkedIn research: do recent hires suggest new focus areas (compliance, automation, customer data)?
3. News search: sector-specific pain points (e.g., "GDPR fines for [sector]", "automation in [industry]")
4. Note specific pain point: not "they need better workflows" but "recent GDPR fines in [sector]" or "manual data entry affects appointment scheduling"
5. Confidence: HIGH if specific signals found; MEDIUM if sector-level signals only; LOW if purely assumed
```

---

## External Contact Rules (Enforced)

**You cannot:**
- Send emails or LinkedIn messages
- Call or text prospects
- Register on prospect websites
- Submit forms on their behalf
- Access password-protected content
- Bypass web restrictions (e.g., robots.txt)

**If you need information from a password-protected source:**
- Mark as "unknown — requires direct contact"
- Note it in the handoff brief: "Budget authority could not be confirmed without direct conversation"
- Let AE ask during discovery

---

## Data Handling & Security

### PII Handling
- Prospect names, emails, phone numbers: keep local in memory/ only
- Never paste PII into shared Discord channels
- If discussing a prospect with HERMES in #hermes-chat: use company name only, no individual details

### Research Notes
Store locally in `memory/` directory:
```
memory/
  ├── learnings.md (calibration notes)
  ├── pipeline-state.md (lead counts and status)
  ├── [company-name]-research.md (detailed notes for specific leads)
  └── [prospectname]-notes.md (detailed BANT assessment)
```

### No External Storage
- Never save prospect research to cloud storage, public sites, or external tools
- Never link to your research notes in shared channels
- HERMES reads your local files; no distribution needed

---

## Rate Limits & Reliability

### Web Fetch/Search Tools
- **web_fetch:** Can be slow on image-heavy sites (e.g., portfolio sites) — use sparingly
- **web_search:** Performs public web searches; may take 5–10 seconds
- **Timeout:** If a fetch or search takes >30 seconds, note it and move to next research
- **Retry logic:** Manual — if a fetch fails, try again; if it fails twice, mark as "unable to reach" and note in brief

### Fallback Behavior
If a research tool fails or times out:
- **web_search blocked:** Try web_fetch to the company website directly
- **web_fetch to LinkedIn timeout:** Note "could not confirm via LinkedIn; ask AE to verify"
- **Overall internet outage:** Unlikely, but if you can't reach any site, note it and escalate to HERMES

---

## Airtable Protocol (When Connected)

Currently: **Airtable is NOT connected.** When it is:

1. HERMES will manage API key and base access
2. SDR will request lead data from HERMES (SDR does not have direct API access)
3. HERMES pulls from Airtable; SDR reads the returned data
4. SDR never hardcodes credentials or API keys
5. All lead status updates flow through HERMES (SDR does not write to Airtable directly)

Until connected: all prospect data comes from HERMES; all local notes stay in memory/

---

## Google Workspace Protocol (When Connected)

Currently: **Google Workspace is NOT connected.** When it is:

1. HERMES will manage OAuth token and document access
2. SDR may be granted read-only access to shared commercial templates (proposals, handoff brief template, etc.)
3. SDR never stores prospect data in Google Workspace
4. All client-facing documents are HERMES/AE/Legal responsibility; SDR does not touch them

Until connected: all documents come from HERMES or live in workspace/templates/

---

## Local Tools & Scripts

### workspace/templates/commercial/
Store all reusable templates here. Reference in AGENTS.md.

**Key templates for SDR:**
- sdr-handoff-brief.md (fill out when qualifying a lead)
- prospect-qualification-check.md (runbook, use before submitting brief)

### memory/ Directory Structure
```
memory/
  ├── learnings.md [required] — calibration notes after every task
  ├── pipeline-state.md [required] — current lead counts and status
  ├── heartbeat-state.json [optional] — last heartbeat check timestamp
  └── [company]-research.md [optional] — detailed notes for complex leads
```

---

## Favorite Research Patterns

**Quick prospect validation (5–10 min):**
1. web_search("[company name] [city]")
2. Confirm company exists, get founding date, employee count estimate
3. web_fetch company website careers page
4. Check for hiring (growth signal)
5. Make decision: enough data or need deeper dive?

**Deep prospect research (30–60 min):**
1. web_search("[contact name] [company name]")
2. web_fetch LinkedIn profile (if publicly accessible)
3. Confirm role and decision-making authority
4. web_search("[company name] GDPR / compliance / automation" + recent news)
5. web_fetch company website (careers, leadership, news, recent announcements)
6. web_search "[sector] [pain point]" for context (e.g., "dental practices GDPR compliance")
7. Compile BANT assessment
8. Make decision: QUALIFIED or DISQUALIFIED

---

## Known Gaps & Workarounds

| Gap | Workaround | Timeline |
|---|---|---|
| No CRM API | Request lead data from HERMES | When Airtable connects (TBD) |
| No document management | HERMES manages proposals/contracts | When Google Workspace connects (TBD) |
| No telephone/email system | Use web channels for research; contact through AE | No change expected (by design) |
| No LinkedIn API | Use web_fetch for public profiles; no scraping | N/A — not necessary |

---

## What Not to Do

- Don't use exec or run shell commands
- Don't attempt to parse PDFs or complex file formats (let HERMES handle)
- Don't automate browser interactions (that's AE work)
- Don't try to access Airtable without HERMES routing
- Don't post directly to Discord channels
- Don't retain or cache prospect data between sessions (write to memory/ only)
- Don't use tools for non-research purposes (no browsing, no entertainment)

---

## Tool Usage Checklist

Before starting research, confirm:
- [ ] I have the prospect details from HERMES (company, contact, signal source)
- [ ] I understand what BANT fields I need to confirm
- [ ] I know the ICP criteria I'm evaluating against
- [ ] I have write access to memory/ for notes
- [ ] I have read access to templates/commercial/ for reference

After completing research, confirm:
- [ ] All BANT fields have been evaluated (confirmed, unknown, or failed)
- [ ] I have source links or notes for every claim
- [ ] I have noted confidence levels
- [ ] I have updated memory/learnings.md with the lesson
- [ ] I am ready to submit to HERMES

---

This is your toolkit. Use it well.
