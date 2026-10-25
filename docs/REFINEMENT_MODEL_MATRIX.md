# Refinement Subagents Model Mapping & Execution Matrix

**Purpose:** Defines the specialized model allocation, task boundaries, and execution protocols for post-v1.0.0 maintenance, bug fixing, UI polish, and performance optimization.  
**Philosophy:** Elastic Lean Mode — using surgical model matching instead of monolithic swarms to prevent token burn and eliminate regressions.

---

## 1. Refinement Subagents Model Mapping Matrix

| Refinement Task Type | Subagent Role in Refinement | Active Gemini Stack Deployment | Industry Best (Budget No Bar) | Technical Logic & Rationale |
|:---|:---|:---|:---|:---|
| **1. Complex Bug Fix**<br>*(Math errors, race conditions, state desync)* | **The Investigator / Reproducer**<br>*(Failing test likhta hai)* | **`gemini-2.5-flash-thinking`** | DeepSeek-R1 / Claude 3.7 (Thinking) | Bug fix me sabse pehle "sochna" hota hai ki code kyu phata. Flash-Thinking ka CoT scratchpad silent edge cases pakad kar exact failing test case generate karta hai. |
| | **The Surgical Coder**<br>*(Logic patch karta hai)* | **`gemini-4-argon`** (`effort: medium`) | Claude 3.5 Sonnet | Invariants ko bina chhede clean, minimal diff (<50 lines) likhta hai. |
| **2. UI & Styling Polish**<br>*(Tailwind CSS, z-index, hover states, alignment)* | **UI Polish Worker**<br>*(CSS / HTML adjustments)* | **`gemini-3.8-flash`** *(or `gemini-2.5-flash`)* | Claude 3.5 Haiku / GPT-4o-mini | Visual fixes me deep algorithmic thinking ki zaroorat nahi hoti. Flash model 200+ t/s par instant react karta hai bina token budget jalaye. |
| | **UI Flow Auditor**<br>*(Keyboard focus traps, Esc/Enter)* | **`gemini-3.8-flash`** | Claude 3.5 Haiku | Keyboard listeners aur DOM properties check karta hai. Fast aur lightweight. |
| **3. Performance & Memory**<br>*(Slow queries, RAM leak, latency spikes)* | **Profiler & Query Optimizer**<br>*(DB indexes, Rust hot-paths)* | **Nano Banana Pro (`gemini-2.5-pro`)** | Claude 3.7 Sonnet (Extended) | Query execution plans, SQLite WAL locks, aur memory allocation patterns ko analyze karne ke liye highest architectural reasoning chahiye. |
| **4. Core Schema Migration**<br>*(Naya DB column, IPC payload upgrade)* | **Schema Sentinel**<br>*(Data contracts & type safety)* | **`gemini-2.5-pro`** | Claude 3.7 Sonnet | Database tables aur Rust/TS structs ke beech 100% bit-perfect type consistency maintain karta hai. |
| **5. Merge & Handoff**<br>*(Har refinement PR ke baad)* | **Gatekeeper Reconciler**<br>*(Regression test & cleanup)* | **`gemini-4-argon`** | Claude 3.5 Sonnet | Deterministic bash commands run karta hai (`git merge`, worktree prune) aur changelog update karta hai. |

---

## 2. Refinement Automated Routing Rules (Orchestrator Logic)

The Lead Orchestrator dynamically routes refinement tasks according to three deterministic rules:

1. **Rule 1: Visual / Styling Route (`gemini-3.8-flash`)**
   - **Triggers:** `CSS`, `Tailwind`, `Color`, `Padding`, `Modal UI`, `Z-index`, `Responsive`, `Border`.
   - **Model:** `gemini-3.8-flash` (or `gemini-2.5-flash`).
   - **Budget:** `< 15k` tokens. Immediate single-file commit.

2. **Rule 2: Bug Fix / Logic Route (Two-Agent Sequential Tag-Team)**
   - **Triggers:** `Crash`, `Incorrect Calculation`, `Uncaught Exception`, `Deadlock`, `State Desync`.
   - **Step A (Reproduce):** `gemini-2.5-flash-thinking` writes a failing unit/integration test capturing the bug.
   - **Step B (Patch):** `gemini-4-argon` (`effort: medium`) edits code strictly within `OWNS` until the test turns green.
   - **Budget:** `< 30k` tokens.

3. **Rule 3: Performance & Schema Route (`gemini-2.5-pro`)**
   - **Triggers:** `Latency Spike`, `Memory Leak`, `Slow Query`, `Schema Migration`, `Type Definition`.
   - **Model:** `gemini-2.5-pro` (Nano Banana Pro).
   - **Budget:** `< 40k` tokens. High architectural scrutiny.

---

## 3. SemVer Bump Triggers for Refinement

| Refinement Scope | Git Commit Prefix | Version Bump | Changelog Category |
|:---|:---|:---|:---|
| CSS/Styling fixes, typos, layout glitches | `fix(ui):` | **Patch** (`v1.0.X`) | `Fixed` |
| Internal bug fix (no user workflow break) | `fix(core):` | **Patch** (`v1.0.X`) | `Fixed` |
| Query / Algorithmic speedup | `perf(engine):` | **Patch** (`v1.0.X`) | `Performance` |
| New non-breaking filter, modal, or shortcut | `feat(ui):` | **Minor** (`v1.X.0`) | `Added` |
| Core schema migration or breaking UX change | `breaking:` | **Major** (`vX.0.0`) | `Changed` |
