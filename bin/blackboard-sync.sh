#!/usr/bin/env bash
# ==============================================================================
# blackboard-sync.sh - Query and Verify Active File Leases
# Part of Vibe Swarm Harness
# ==============================================================================
set -euo pipefail

BLACKBOARD_FILE="docs/BLACKBOARD.md"

if [ ! -f "${BLACKBOARD_FILE}" ]; then
  echo "ERROR: ${BLACKBOARD_FILE} not found."
  exit 1
fi

echo "=================================================================="
echo " LIVE BLACKBOARD: ACTIVE LEASES & CONTRACT BROADCASTS"
echo "=================================================================="

# Extract markdown table lines under Active Leases
awk '/## 1. Active File Leases & Dynamic Locks/,/## 2. Contract Changes Announced/' "${BLACKBOARD_FILE}" | grep "|" | grep -v "^| :---"

echo ""
echo "Notice: Verify your target file paths do not conflict with active leases"
echo "before initiating changes."
