#!/usr/bin/env bash
# ==============================================================================
# reconcile-merge.sh - Gatekeeper Merge & Worktree Cleanup Automation
# Part of Vibe Swarm Harness
# ==============================================================================
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <feature-branch-name> <agent-id>"
  echo "Example: $0 feat/auth-service SA-B1-01"
  exit 1
fi

BRANCH_NAME="$1"
AGENT_ID="$2"
TREE_DIR="../trees/agent-${BRANCH_NAME//\//-}"

echo "=================================================================="
echo " GATEKEEPER AUDIT: Reconciling ${BRANCH_NAME} (Agent: ${AGENT_ID})"
echo "=================================================================="

# 1. Verify we are on main branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "${CURRENT_BRANCH}" != "main" ]; then
  echo "ERROR: Reconcile must be executed from main branch."
  exit 1
fi

# 2. Check for unstaged changes on main
if ! git diff-index --quiet HEAD --; then
  echo "ERROR: Working tree on main is dirty. Stash or commit before merging."
  exit 1
fi

# 3. Fast-forward or safe merge
echo "==> Merging branch ${BRANCH_NAME} into main..."
git merge --no-ff "${BRANCH_NAME}" -m "feat(reconcile): merge ${BRANCH_NAME} verified by Gatekeeper"

# 4. Cleanup Worktree
if [ -d "${TREE_DIR}" ]; then
  echo "==> Cleaning up physical worktree ${TREE_DIR}..."
  git worktree remove "${TREE_DIR}"
  git worktree prune
fi

# 5. Delete feature branch
echo "==> Deleting feature branch ${BRANCH_NAME}..."
git branch -d "${BRANCH_NAME}"

echo "==> Reconciliation complete. Tree is clean and consolidated."
