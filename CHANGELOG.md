# Changelog: Vibe Swarm Harness

All notable changes, architectural specifications, and releases are documented here.
Format conforms to [Keep a Changelog](https://keepachangelog.com/).

## [1.0.0] - 2026-10-24
### Added
- **Core Architecture:** 6-tier multi-agent hierarchical swarm operating model (`docs/ARCHITECTURE.md`).
- **Hardware Isolation:** Zero-conflict Git Worktree isolation standard (`bin/agent-spawn.sh`).
- **State Bus:** The Blackboard Pattern for dynamic file leases and contract broadcasting (`docs/BLACKBOARD.md`).
- **Conflict Prevention:** Boundary Manifest standard (`OWNS`, `READS`, `FORBIDDEN`).
- **Living Handoff:** 4-point Definition of Done (DoD) with Bounded Correction Loop.
- **Merge-Reconciler Gatekeeper:** Automated overlap audit, regression testing, and worktree cleanup (`bin/reconcile-merge.sh`).
- **Token Economy:** Strict context budgeting and anti-context-rot rules (`docs/TOKEN_ECONOMY.md`).
- **Universal Templates:** Standard specifications, changeset templates, and constitutional rule boilerplates (`templates/`).
- **CI/CD Automation:** GitHub Actions workflow for markdown and broken link verification (`.github/workflows/validate-specs.yml`).
