#!/bin/bash
# Registry sync check for Hermes workspace
# Exits 0 if all registries are in sync, 1 if any drift detected

WORKSPACE="$(cd "$(dirname "$0")/../.." && pwd)"
PASS=true

echo "=== Registry Sync Check ==="

# Extract playbook slugs from each location
AGENTS_PLAYBOOKS=$(grep -oP '^\|\s*\K[a-z-]+(?=\s*\|)' "$WORKSPACE/AGENTS.md" 2>/dev/null | grep -v "^slug$" | sort)
MEMORY_PLAYBOOKS=$(grep -oP '^\|\s*\K[a-z-]+(?=\s*\|)' "$WORKSPACE/MEMORY.md" 2>/dev/null | grep -v "^slug$" | sort)
INDEX_PLAYBOOKS=$(grep -oP '^\|\s*\K[a-z-]+(?=\s*\|)' "$WORKSPACE/playbooks/INDEX.md" 2>/dev/null | grep -v "^slug$" | sort)

# Extract runbook slugs from each location
AGENTS_RUNBOOKS=$(grep -A100 "Runbook Registry" "$WORKSPACE/AGENTS.md" 2>/dev/null | grep -oP '^\|\s*\K[a-z-]+(?=\s*\|)' | grep -v "^slug$" | sort)
MEMORY_RUNBOOKS=$(grep -A100 "Runbook Registry" "$WORKSPACE/MEMORY.md" 2>/dev/null | grep -oP '^\|\s*\K[a-z-]+(?=\s*\|)' | grep -v "^slug$" | sort)
INDEX_RUNBOOKS=$(grep -oP '^\|\s*\K[a-z-]+(?=\s*\|)' "$WORKSPACE/runbooks/INDEX.md" 2>/dev/null | grep -v "^slug$" | sort)

# Check playbook sync
if [ "$AGENTS_PLAYBOOKS" = "$MEMORY_PLAYBOOKS" ] && [ "$MEMORY_PLAYBOOKS" = "$INDEX_PLAYBOOKS" ]; then
  echo "PASS: Playbook registries in sync"
else
  echo "FAIL: PLAYBOOK REGISTRY DRIFT DETECTED"
  echo "  AGENTS.md: $AGENTS_PLAYBOOKS"
  echo "  MEMORY.md: $MEMORY_PLAYBOOKS"
  echo "  playbooks/INDEX: $INDEX_PLAYBOOKS"
  PASS=false
fi

# Check runbook sync
if [ "$AGENTS_RUNBOOKS" = "$MEMORY_RUNBOOKS" ] && [ "$MEMORY_RUNBOOKS" = "$INDEX_RUNBOOKS" ]; then
  echo "PASS: Runbook registries in sync"
else
  echo "FAIL: RUNBOOK REGISTRY DRIFT DETECTED"
  echo "  AGENTS.md: $AGENTS_RUNBOOKS"
  echo "  MEMORY.md: $MEMORY_RUNBOOKS"
  echo "  runbooks/INDEX: $INDEX_RUNBOOKS"
  PASS=false
fi

echo "=========================="

if [ "$PASS" = true ]; then
  echo "PASS — safe to commit"
  exit 0
else
  echo "FAIL — fix registry drift before committing"
  exit 1
fi
