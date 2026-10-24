#!/usr/bin/env bash
# ==============================================================================
# agent-spawn.sh - Spawn an Isolated Git Worktree for a Subagent
# Part of Vibe Swarm Harness
# ==============================================================================
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <agent-id> <feature-branch-name>"
  echo "Example: $0 SA-B1-01 feat/auth-service"
  exit 1
fi

AGENT_ID="$1"
BRANCH_NAME="$2"
TREE_DIR="../trees/agent-${BRANCH_NAME//\//-}"

echo "==> Spawning isolated Git Worktree for Subagent: ${AGENT_ID}"
echo "    Branch:   ${BRANCH_NAME}"
echo "    Worktree: ${TREE_DIR}"

mkdir -p "../trees"

if [ -d "${TREE_DIR}" ]; then
  echo "ERROR: Worktree directory ${TREE_DIR} already exists!"
  exit 1
fi

# Create worktree linked to a new branch branching off main
git worktree add "${TREE_DIR}" -b "${BRANCH_NAME}"

echo "==> Worktree successfully created at ${TREE_DIR}."
echo "    Subagent ${AGENT_ID} can now run in parallel without file collisions."
