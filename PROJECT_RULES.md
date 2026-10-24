# Project Constitutional Rules & Engineering Standards

## 1. Hardware & Filesystem Isolation: Git Worktree Protocol (Mandatory)
- **Zero In-Place Checkouts:** Running multiple subagents within the same working directory while switching branches via `git checkout` is strictly forbidden.
- **Dedicated Worktrees:** Every parallel branch or feature team MUST execute in its own isolated physical directory outside the main repo tree (`../trees/agent-<branch-name>`), while sharing the core `.git` object database.
- **Clean Pruning:** After branch audit and merge, worktrees are pruned immediately via `git worktree remove` and `git worktree prune`.

## 2. Orchestrator Role Boundary (Zero Parent Coding)
The lead parent orchestrator functions strictly as an air-traffic controller:
- Coordinates subagent dispatches into dedicated worktrees.
- Maintains tracking matrices and live state blackboard.
- Steers drifting children and runs the final regression gate.
- **Never writes feature implementation code directly in the parent turn.**

## 3. Hardware & Runtime Constraints
- **Performance Budget:** Subagents must respect configured memory budgets and cold startup limits.
- **Zero Invariant Violations:** Core data schemas, financial/mathematical invariants, and ACID consistency are non-negotiable.
- **Keyboard & CLI Friendliness:** All tools, CLIs, and workflows must support non-interactive execution flags.

## 4. The Blackboard Pattern: State Bus & Dynamic File Locks
Subagents do NOT communicate via conversational chat loops. Subagents coordinate asynchronously via `docs/BLACKBOARD.md`:
- **Lock Before Write:** Every subagent must claim and register its target file glob in `docs/BLACKBOARD.md` under *Active Leases & Locks*.
- **No Overlapping Leases:** If a file glob is leased by another agent, sibling agents must not modify it.
- **Contract Announcements:** Any new DTO, interface, or breaking change must be written to `docs/contracts/` and posted to `docs/BLACKBOARD.md` before merging.

## 5. Boundary Manifest & File Ownership (Strict Merge Conflict Prevention)
99% of merge conflicts happen when two agents perform simultaneous edits on shared files. Every subagent specification MUST define a rigid **Boundary Manifest**:
- **OWNS (Read / Write):** The isolated directories and files that this subagent has exclusive authority to create and modify.
- **READS (Strictly Read-Only):** Shared contracts, base schemas, or upstream DTOs that the subagent may inspect but NEVER modify.
- **FORBIDDEN (Immediate Task Termination if Touched):**
  - Sibling feature folders.
  - Shared dependency manifests (`package.json`, `Cargo.toml`, `pyproject.toml`, `go.mod`) — all dependency additions MUST be requested through the Lead Orchestrator.
  - Core database migration seeders unless explicitly leased on the Blackboard.
- **Enforcement:** If a subagent modifies any file outside its `OWNS` manifest, its branch is rejected by the branch audit gate and immediately reverted.

## 6. The Living Handoff: Subagent Definition of Done (DoD)
A subagent CANNOT claim completion merely by writing code. Every feature commit and handoff MUST include 4 mandatory deliverables:
1. **Code:** Clean, warning-free implementation of the scoped feature.
2. **Tests:** Automated unit/integration tests that prove the code mathematically and behaviorally.
3. **Spec Tick:** Task checkboxes `[x]` ticked in `specs/<feature>/tasks.md`.
4. **Changeset Snippet:** A clean YAML frontmatter report saved to `docs/changesets/<agent-id>-<timestamp>.md`.

- **Bounded Correction Loop (Never Abort Good Work):** If any of these 4 items is missing or failing, the task is NEVER discarded or killed:
  1. The Branch Auditor keeps the Blackboard lease active in `CORRECTION_PENDING` status.
  2. The Auditor logs an exact actionable deficiency ticket.
  3. The subagent is steered directly with the specific fix instructions and given up to 3 bounded correction iterations to resolve the gap.
  4. Only if 3 successive correction cycles fail does the Lead Orchestrator intervene for manual triage.

## 7. The Merge-Reconciler Subagent (The Gatekeeper)
Implementing agents are strictly prohibited from merging directly into `main`. All merges pass through a neutral Gatekeeper (`merge-reconciler`):
1. **Overlap Audit:** Confirms zero unauthorized file edits outside the declared `OWNS` manifest.
2. **Contract Verification:** Validates that output DTOs satisfy downstream consumer contracts on the Blackboard.
3. **Full Regression Suite:** Executes full project test suite (`cargo test`, `npm test`, `pytest`) with 100% green exit code.
4. **Documentation Consolidation:** Consolidates micro-changesets into root `CHANGELOG.md` and updates tracking records.
5. **Worktree Cleanup:** Prunes the isolated worktree directory and removes the merged branch.
