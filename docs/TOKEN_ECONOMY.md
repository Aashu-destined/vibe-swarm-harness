# Token Economy & Anti-Context-Rot Guide

## 1. The Cost of Context Bloat
Modern LLMs advertise 1M+ token context windows, leading developers into a deceptive trap: **assuming large context equals high intelligence.**

In multi-agent software engineering, large unmanaged context causes three catastrophic failure modes:

1. **Context Rot & "Lost-in-the-Middle":**
   As prompt history expands beyond 40k–50k tokens, the model's adherence to negative constraints (*"Do NOT edit file X"*, *"Do NOT use floating-point math"*) degrades by up to 40%.
2. **TTFT (Time-To-First-Token) Latency Spikes:**
   Prefilling 100k tokens on every tool interaction introduces 15–30 second latency pauses. A 5-step task balloons from 30 seconds to 4 minutes.
3. **Provider Ceiling / TPM (Tokens Per Minute) Exhaustion:**
   5 parallel agents running 80k context windows prefill 400,000 tokens on every coordinated turn, quickly hitting HTTP 429 Rate Limits.

---

## 2. Hard Token Boundaries per Tier

| Tier Level | Designation | Max Run Budget | Retention Policy | Enforcement Mechanism |
|:---|:---|:---|:---|:---|
| **Level 0** | **Lead Orchestrator** | `< 80,000` tokens | Persistent across session | Periodic `/compact` or state anchor continuation |
| **Level 1** | **Main Branch Swarm** | `< 40,000` tokens | Task lifecycle only | Single-responsibility output; exits upon commit |
| **Level 2** | **Feature Teams** | `< 40,000` tokens | Feature lifecycle only | Bound to worktree directory; auto-terminates on PR |
| **Level 3** | **Sub-Branch Workers** | `< 15,000` tokens | Ephemeral micro-task | Implements single function/file and exits immediately |
| **Level 4** | **Branch Auditors** | `< 30,000` tokens | Zero long-term memory | Inspects only `git diff` and test logs; stateless |
| **Level 5** | **Merge-Reconciler** | `< 25,000` tokens | Zero long-term memory | Inspects manifest diffs and runs test commands |

---

## 3. Surgical Context Discipline

* **Never Dump the Entire Monorepo:** Pass only the relevant task's `spec.md` and explicit path pointers.
* **Stateless Auditors:** Auditors must never receive the developer agent's chat history. Retaining conversational history introduces confirmation bias.
* **Micro-Changesets over Monolithic Logs:** Subagents record a 6-line markdown changeset snippet rather than rewriting the master project changelog.
