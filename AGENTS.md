# AGENTS.md - Multi-Agent Swarm Hierarchy & Model Pinning Matrix

**Purpose:** Defines the 6-tier agent hierarchy, runtime responsibilities, hardware/context boundaries, and assigned LLM engine profiles.  
**Applicability:** Universal framework for full-stack applications, distributed backend services, systems engineering, and algorithmic engines.

---

## 1. Dynamic Model Pinning Protocol (Hermes Agent)

Subagent delegation models and runtime parameters are dynamically configured before launching specific tier batches using the Hermes CLI:
```bash
# Example Pinning Commands for Active Tiers:
hermes config set delegation.provider gemini
hermes config set delegation.model gemini-4-argon
hermes config set delegation.reasoning_effort medium
```

---

## 2. 6-Tier Swarm Hierarchy & Official Model Deployment Table

| Level | Role / Layer | Industry Best (Ideal) | Active Gemini Stack Deployment | Rationale / Logic |
|:---|:---|:---|:---|:---|
| **Level 0** | **Lead Orchestrator** | Claude 3.7 Sonnet (Thinking) | **`gemini-4-argon`** *(Fallback: `gemini-2.5-pro`)* | Executive multi-agent tool dispatch, task decomposition, and global blackboard state synchronization without injecting parent code bloat into the main session. |
| **Level 1** | **Main Branch Swarm** | Claude 3.7 / OpenAI o3-mini | **`gemini-2.5-pro`** (Nano Banana Pro) | System-level architectural foundations, core schema contracts, invariant mathematical logic, and zero-hallucination type generation. |
| **Level 2** | **Feature Branch Teams** | Claude 3.5 Sonnet | **`gemini-4-argon`** (`reasoning_effort: medium`) | High-throughput architectural coding, type safety, modular feature builds, state wiring, and external API integrations. |
| **Level 3** | **Sub-Branch Workers** | Claude 3.5 Haiku / GPT-4o-mini | **`gemini-3.8-flash`** *(or `gemini-2.5-flash`)* | 200+ t/s micro-generation for bounded algorithms, parsing routines, isolated helper functions, and high-speed single-file implementations. |
| **Level 4** | **Branch Auditors** | DeepSeek-R1 / Claude 3.7 | **`gemini-2.5-flash-thinking`** | Deep Chain-of-Thought (CoT) adversarial test fuzzing, edge-case generation, zero-confirmation-bias code inspection, and Living Handoff DoD verification. |
| **Level 5** | **Merge-Reconciler** | Claude 3.5 Sonnet | **`gemini-4-argon`** | Impartial neutral third-party arbiter for AST-safe merge conflict resolution, full regression test execution, documentation consolidation, and worktree pruning. |

---

## 3. Subagent Context & Token Boundaries

To prevent context rot, latency spikes, and provider ceiling truncations:
1. **Level 0 (Orchestrator):** Max context budget < 80k tokens. Periodic `/compact` or session continuation via state anchor.
2. **Level 1 & 2 (Main & Feature Teams):** Isolated worktree contexts; max run budget 40k tokens; single-responsibility output.
3. **Level 3 (Sub-Branch Workers):** Bounded micro-tasks; max run budget 15k tokens; exit immediately upon changeset generation.
4. **Level 4 & 5 (Auditors & Reconcilers):** Ephemeral execution; inspects git diffs and test logs; never retains long-term conversational memory.
