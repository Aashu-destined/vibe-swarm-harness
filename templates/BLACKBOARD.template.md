# Live Blackboard (Shared State Bus & File Leases)

## 1. Active File Leases & Dynamic Locks
> **Rule:** If a file or glob is leased by an active agent, NO other agent may modify it.

| Feature / Scope | Assigned Agent | Branch / Worktree | Status | Locked Files (Exclusive Lease) | Lease Expiry / Gate |
|:---|:---|:---|:---|:---|:---|
| Core Engine | SA-B1-01 | `../trees/agent-core-engine` | `IN_PROGRESS` | `src/core/*`, `tests/core/*` | Unit test pass |
| REST API | SA-B2-01 | `../trees/agent-rest-api` | `IN_PROGRESS` | `src/api/*`, `tests/api/*` | Integration check |
| DB Migrations | SA-MB-01 | Main Tree | `READY` | `src/db/migrations/*` | Migration verify |

---

## 2. Contract Changes Announced (Read Before Calling)
> When an agent modifies an interface or DTO, it must publish the contract in `docs/contracts/<name>.md` and announce it here.

* *[Example @ 19:35]:* `SA-B1-01` Exported new payload interface in `docs/contracts/order_v2.md`.
