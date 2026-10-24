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

## 3. The Blackboard Pattern: State Bus & Dynamic File Locks
Subagents do not communicate via conversational chat loops:
- **Lock Before Write:** Every subagent must claim its target file glob in `docs/BLACKBOARD.md` under *Active Leases & Locks*.
- **No Overlapping Leases:** If a file glob is leased by another worker, sibling agents must not modify it.
- **Contract Announcements:** Any new DTO, interface, or schema change must be written to `docs/contracts/` and posted to `docs/BLACKBOARD.md`.

## 4. Boundary Manifest & File Ownership (Strict Merge Conflict Prevention)
Every feature task specification MUST define a rigid **Boundary Manifest**:
- **OWNS (Read / Write):** Exclusive directories and files assigned to this subagent.
- **READS (Strictly Read-Only):** Shared contracts, schemas, or upstream DTOs inspected but never edited.
- **FORBIDDEN (Immediate Task Termination if Touched):** Sibling feature folders, root dependency manifests (`package.json`, `Cargo.toml`, `pyproject.toml`), and global configs.

## 5. The Living Handoff: Definition of Done (DoD)
A subagent CANNOT claim completion merely by writing code. Every feature commit MUST include:
1. **Code:** Clean, warning-free implementation.
2. **Tests:** Automated tests proving the implementation behaviorally.
3. **Spec Tick:** Task checkboxes `[x]` ticked in `specs/<feature>/tasks.md`.
4. **Changeset Snippet:** A clean YAML summary in `docs/changesets/<agent-id>-<timestamp>.md`.

## 6. Bounded Correction Loop (Never Abort Good Work)
If any DoD item is missing or failing, the task is NEVER discarded:
1. The Auditor logs an exact actionable deficiency ticket.
2. The subagent is steered with specific fix instructions (max 3 bounded correction cycles).
3. If 3 cycles fail, the Orchestrator intervenes for manual triage.

## 7. The Merge-Reconciler Gatekeeper
Implementing agents are strictly prohibited from merging directly into `main`. All merges pass through a neutral Gatekeeper performing Overlap Audit, Contract Verification, Full Regression, Document Consolidation, and Worktree Pruning.
