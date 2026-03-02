# Teams

This directory contains all agent teams deployed under Delphi.

Each team lives in its own subdirectory. Each agent within a team has its own folder containing:
- `SOUL.md` — identity, personality, tone, communication style
- `AGENTS.md` — operational rules, workflows, responsibilities

## Structure

```
teams/
├── README.md              ← this file
├── commercial/            ← HERMES commercial department
│   ├── README.md
│   ├── sdr/
│   ├── account-executive/
│   ├── account-manager/
│   ├── finance/
│   ├── legal/
│   ├── market-intelligence/
│   └── knowledge-curator/
└── [future-team]/
```

## Adding a New Team

1. Create a subdirectory under `teams/` with the team name (kebab-case)
2. Add a `README.md` for the team explaining its purpose and agents
3. Create one subfolder per agent with `SOUL.md` and `AGENTS.md`
4. Register the team and agents in `openclaw.json` under `agents.list`
