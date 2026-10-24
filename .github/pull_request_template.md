## Subagent Living Handoff Pull Request

### 1. Subagent Metadata
- **Subagent ID:** `[e.g. SA-B1-01 / SA-SB-02]`
- **Assigned Feature Branch:** `[e.g. feat/engine-core]`
- **Assigned Worktree Path:** `[e.g. ../trees/agent-engine-core]`

---

### 2. The 4-Point Definition of Done (DoD) Checklist
- [ ] **1. Code Complete:** Clean, typed implementation within declared `OWNS` boundaries.
- [ ] **2. Automated Tests Passing:** 100% green unit/integration tests with zero regressions.
- [ ] **3. Spec Tasks Updated:** Checkboxes ticked in `specs/<feature>/tasks.md`.
- [ ] **4. Changeset Dropped:** Snippet committed to `docs/changesets/<agent-id>-<timestamp>.md`.

---

### 3. Boundary Compliance
- [ ] Did this PR touch ONLY files declared in the `OWNS` manifest?
- [ ] Were all sibling features, root dependencies (`package.json`, `Cargo.toml`), and core configs untouched?

---

### 4. Gatekeeper Clearance
- [ ] Overlap Audit passed (zero file conflicts with active leases on `docs/BLACKBOARD.md`)
- [ ] Contract verified against downstream consumers
- [ ] Ready for fast-forward merge and worktree cleanup via `bin/reconcile-merge.sh`
