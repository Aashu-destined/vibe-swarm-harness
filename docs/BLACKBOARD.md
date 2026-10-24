# Live Blackboard (Shared State Bus & Dynamic File Locks)

## 1. Active File Leases & Dynamic Locks
> **Rule:** If a file or glob is leased by an active agent, NO other agent may modify it. Any attempt to touch a locked file without lease clearance is a fatal violation.

| Feature / Scope | Assigned Agent | Branch / Worktree | Status | Locked Files (Exclusive Lease) | Lease Expiry / Gate |
|:---|:---|:---|:---|:---|:---|
| Project Scaffold | Orchestrator | Main Tree | `READY` | `*` | Initial commit gate |

---

## 2. Contract Changes Announced (Read Before Calling)
> When an agent introduces or modifies a shared type, IPC command, or data schema, it MUST publish the contract diff in `docs/contracts/<contract-name>.md` and announce it below. Sibling agents pull and sync before invoking the dependency.

* *[System Init @ v1.0.0]:* Universal Vibe Swarm Harness initialized with zero active locks.
