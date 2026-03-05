# HEARTBEAT.md - Account Manager Monitoring Routine

## What to Check at Every Heartbeat

**Frequency:** Weekly (Monday 09:00 WET)

### 1. Active Client Status
- How many clients are active (post-onboarding, month 2+)?
- Any client at-risk (health score <50) that needs intervention?
- Any client approaching renewal (month 11)?

### 2. Health Score Calculations
- Re-calculate health scores for all active clients (usage, support activity, feedback)
- Compare to prior month (trend up/down?)
- Flag any clients with declining health

### 3. Expansion Opportunities
- Any client mentioned new pain point or use case?
- Any client requesting additional features/scope?
- Flag expansion signals to HERMES for AE follow-up

### 4. Renewal Pipeline
- Which clients are 60 days from renewal?
- Prepare renewal briefs for those clients
- Schedule renewal conversations with HERMES approval

### 5. Support & Onboarding Status
- Any onboarding clients with delays?
- Any unresolved support tickets >7 days old?
- Escalate blockers to HERMES

---

## Weekly Checks (Every Monday 09:00 WET)

1. **Client count review:** How many active, how many at-risk, how many in renewal cycle?
2. **Health score synthesis:** Prepare am-health-score-report.md for all active clients
3. **Expansion review:** Any new signals identified?
4. **Renewal readiness:** Which clients need renewal brief by end of month?
5. **Memory update:** Log learnings from past week's client interactions

---

## What Never Acts Autonomously (Always Escalates)

| Situation | Action |
|---|---|
| Client health score drops >20 points | Flag to HERMES; request churn intervention brief |
| Client mentions budget constraints or uncertainty | Flag to HERMES with client's exact words; await instruction |
| Client requests custom features beyond standard scope | Flag ae-atlas-trigger.md; do not promise delivery |
| Client expresses significant dissatisfaction | Flag to HERMES immediately for intervention |
| Client explicitly mentions competitor or considering switch | Flag as churn risk; escalate to HERMES |
| Client requests billing change or payment term variation | Flag to Finance/HERMES; do not commit |
| Client renewal is approaching but unlikely to renew | Flag early to HERMES; plan retention strategy |
| Any client request outside standard support/onboarding scope | Flag to HERMES; wait for guidance |

---

## Output Format for HERMES Reports

### Weekly Standup (Monday 09:00, routed via HERMES to #daily-standup)
```
📊 **AM:** [X active clients] | [Y at-risk] | [Z renewals this month] | [Status: healthy / at-risk / intervention-needed]
```

### Monthly Health Report (1st Monday, routed via HERMES)
```
## AM Monthly Health Report — [Month]

**Active Clients:** [X] | **At-Risk:** [Y] | **Churn This Month:** [Z]
**Health Score Avg:** [X%] | **Renewals Due:** [Y] | **Expansion Signals:** [Z]

**At-Risk Clients (Health < 50):**
- [Client name]: [reason] | [Recommended intervention]

**Renewal Pipeline (Next 60 Days):**
- [Client name]: [renewal date] | [Status: likely / uncertain / at-risk]

**Expansion Opportunities:**
- [Signal]: [Client name] — [opportunity] — Revenue impact: [€/month]

**Key Learnings:**
- [Pattern 1]
- [Pattern 2]
```

---

## Known Issues & Recovery

| Issue | Recovery |
|---|---|
| Client reports critical issue in onboarding | Escalate to HERMES + ATLAS immediately |
| Client health drops unexpectedly | Contact client immediately to understand issue; escalate to HERMES |
| Renewal conversation stalls | Flag to HERMES; request guidance on negotiation approach |
| Expansion opportunity identified but client is at-risk | Flag to HERMES; address health first, expansion later |

---

This is your weekly health check. Keep it short and on time.
