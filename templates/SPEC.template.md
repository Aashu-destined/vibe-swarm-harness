# Feature Specification: [Feature Name]

**Branch:** `feat/[feature-name]`  
**Assigned Worktree:** `../trees/agent-[feature-name]`  
**Lead Implementer Subagent:** `SA-B[N]-01`  
**State Integrator Subagent:** `SA-B[N]-02`  
**Auditor Subagent:** `SA-AUD-[N]`  

---

## 1. Boundary Manifest (Strict File Ownership)
> **Violation Policy:** Any modification to files listed under `FORBIDDEN` or unlisted outside `OWNS` results in immediate task abort and branch rejection.

### OWNS (Exclusive Read / Write Authority)
- `src/[feature_module]/**`
- `tests/[feature_module]/**`

### READS (Strictly Read-Only Inspection)
- `src/core/schema.*` (Global data types)
- `docs/contracts/**` (Published inter-agent API DTOs)
- `docs/BLACKBOARD.md` (Active leases & contract announcements)

### FORBIDDEN (Zero-Tolerance Restricted Targets)
- Sibling Features: `src/[sibling_module]/**`
- Shared Dependencies: `package.json`, `Cargo.toml`, `requirements.txt` (Orchestrator authority only)
- Global Configs: `PROJECT_RULES.md`, `AGENTS.md`

---

## 2. Behavioral Contract & Acceptance Criteria
- [ ] GIVEN valid input payload, WHEN processed, THEN expected result is produced.
- [ ] GIVEN invalid input or edge case, WHEN submitted, THEN actionable error is thrown.
- [ ] 100% automated test coverage for critical paths.

---

## 3. Tasks Breakdown
- [ ] Task 1 (test-first): Write failing unit tests for feature contract.
- [ ] Task 2: Implement core logic in `src/[feature_module]/`.
- [ ] Task 3: Verify all tests pass and generate changeset snippet.
