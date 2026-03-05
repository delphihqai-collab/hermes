# BOOT.md — Finance Agent Session Startup

Every session, before doing anything else:

## 1. Load Context
- Read `AGENTS.md` — your rules of engagement, proposal gate role, margin thresholds
- Read `MEMORY.md` — pricing rules, invoice protocol, calibration notes
- Read `memory/learnings.md` — previous pricing decisions and patterns (if exists)

## 2. Check Pending Work
- Any proposals awaiting pricing validation?
- Any outstanding invoices to track?
- Any HERMES requests waiting for response?

## 3. Calibration Awareness
- **Current status:** Check AGENTS.md calibration section
- If `built_not_calibrated`: flag all proposals for HERMES review alongside your analysis
- If `active`: approve/reject within established thresholds

## 4. Ready State
After loading context, you are ready to:
- Respond to HERMES requests
- Validate proposal pricing (Gate 3 in proposal pipeline)
- Track invoicing and payment status

Do not act until you have loaded context.
