# Architecture & Multi-Agent Swarm Design

## 1. Executive Overview
**Vibe Swarm Harness** converts stochastic, chaotic vibe coding into a deterministic, high-throughput agentic engineering pipeline. 

Instead of treating AI models as chat participants who overwrite each other's work and trigger massive merge conflicts, the system treats them as **specialized, isolated compute nodes** governed by strict filesystem boundaries, shared memory buses, and automated gatekeepers.

---

## 2. Swarm Topology & Information Flow

```mermaid
flowchart TD
    Orch[Level 0: Lead Orchestrator\nZero-Code Air-Traffic Controller]
    
    subgraph SharedState [Shared State & Memory Bus]
        Rules[PROJECT_RULES.md\nConstitutional Laws]
        Board[docs/BLACKBOARD.md\nDynamic File Leases & Contracts]
        Specs[specs/<feature>/spec.md\nBoundary Manifest: OWNS / FORBIDDEN]
    end

    subgraph ParallelWorktrees [Git Worktree Filesystem Isolation]
        W1[Worktree 1: feat/module-a\nSubagent 1]
        W2[Worktree 2: feat/module-b\nSubagent 2]
        W3[Worktree 3: feat/module-c\nSubagent 3]
    end

    subgraph Gatekeeper [Living Handoff & Merge Gate]
        Auditor[Level 4: Adversarial Auditor\nBounded Correction Loop]
        Reconciler[Level 5: Merge-Reconciler\nOverlap Audit + Regression + Clean Pruning]
    end

    Orch -->|Dispatches with Spec| ParallelWorktrees
    Orch --- SharedState
    ParallelWorktrees -->|Reads Contracts & Leases| Board
    ParallelWorktrees -->|DoD: Code + Tests + Changeset| Auditor
    Auditor -->|100% Green Gate| Reconciler
    Reconciler -->|Fast-Forward Merge| MainBranch[Production main Trunk]
```

---

## 3. The 3 Zero-Conflict Engineering Pillars

### Pillar I: Git Worktree Hardware Isolation
* **Failure Mode:** Running multiple agents in the same working tree while executing `git checkout` causes catastrophic file lock race conditions.
* **The Fix:** Every agent operates in a dedicated physical directory outside the repository (`../trees/agent-<branch>`). They share the same underlying `.git` object store, ensuring concurrent builds and zero checkout collisions.

### Pillar II: The Blackboard Pattern (Shared State Bus)
* **Failure Mode:** Peer-to-peer agent conversational chat creates endless token loops and context rot.
* **The Fix:** Agents coordinate asynchronously via `docs/BLACKBOARD.md`. Before modifying any file glob, an agent claims an exclusive lease. If another agent holds the lock, sibling agents wait or pivot.

### Pillar III: Boundary Manifests & Living Handoff
* **Failure Mode:** Agents modifying unassigned root files (`package.json`, global configs) or touching sibling modules.
* **The Fix:** Every feature spec defines `OWNS`, `READS`, and `FORBIDDEN` file sets. Any violation results in immediate rejection. Tasks exit only when accompanied by passing tests, updated task checklists, and a micro-changeset snippet.
