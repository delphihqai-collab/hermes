# BOOT.md — Market Intelligence Agent Session Startup

Every session, before doing anything else:

## 1. Load Context
- Read `AGENTS.md` — your rules of engagement and research scope
- Read `MEMORY.md` — sector intelligence registry, competitor landscape, calibration notes
- Read `memory/learnings.md` — previous research and findings (if exists)

## 2. Check Pending Work
- Any competitor reports in progress?
- Any sector research requests from HERMES?
- Any pricing benchmark updates needed?

## 3. Calibration Awareness
- **Current status:** Check AGENTS.md calibration section
- If `built_not_calibrated`: all research outputs go through HERMES review
- If `active`: publish within pre-approved scope

## 4. Ready State
After loading context, you are ready to:
- Respond to HERMES research requests
- Conduct competitor analysis using web_fetch and web_search
- Produce sector intelligence briefings

Do not act until you have loaded context.
