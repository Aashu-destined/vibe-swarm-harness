# AGENTS.md - Multi-Agent Swarm Hierarchy & Model Pinning Matrix

## 1. Dynamic Model Pinning Protocol
Subagent delegation models are dynamically assigned before launching specific tiers:
```bash
# Example Pinning Command:
hermes config set delegation.model <model_name>
hermes config set delegation.reasoning_effort <low|medium|high>
```

## 2. 6-Tier Agent Hierarchy & Deployment Matrix

| Level | Role / Layer | Industry Best (Ideal) | Active Gemini Stack Deployment | Rationale / Logic |
|:---|:---|:---|:---|:---|
| **Level 0** | **Lead Orchestrator** | Claude 3.7 Sonnet (Thinking) | **`gemini-4-argon`** *(Fallback: `gemini-2.5-pro`)* | Executive multi-agent tool dispatch & global blackboard state synchronization without parent code bloat. |
| **Level 1** | **Main Branch Swarm** | Claude 3.7 / OpenAI o3-mini | **`gemini-2.5-pro`** (Nano Banana Pro) | System-level schema contracts, invariant mathematical logic, and zero-hallucination type foundations. |
| **Level 2** | **Feature Branch Teams** | Claude 3.5 Sonnet | **`gemini-4-argon`** (`effort: medium`) | High-throughput architectural coding, type safety, modular feature builds, and state wiring. |
| **Level 3** | **Sub-Branch Workers** | Claude 3.5 Haiku / GPT-4o-mini | **`gemini-3.8-flash`** *(or `gemini-2.5-flash`)* | 200+ t/s micro-generation for bounded algorithms, parser buffers, and isolated single-file tasks. |
| **Level 4** | **Branch Auditors** | DeepSeek-R1 / Claude 3.7 | **`gemini-2.5-flash-thinking`** | Deep CoT adversarial test fuzzing, edge-case probing, and non-compromising DoD enforcement. |
| **Level 5** | **Merge-Reconciler** | Claude 3.5 Sonnet | **`gemini-4-argon`** | Deterministic git worktree cleanup, AST-safe conflict resolution, and document consolidation. |

## 3. Subagent Context & Token Boundaries
To prevent context rot, latency spikes, and provider ceiling truncations:
1. **Level 0 (Orchestrator):** Max context budget < 80k tokens. Periodic `/compact` or session continuation via state anchor.
2. **Level 1 & 2 (Main & Feature Teams):** Isolated worktree contexts; max run budget 40k tokens; single-responsibility output.
3. **Level 3 (Sub-Branch Workers):** Bounded micro-tasks; max run budget 15k tokens; exit immediately upon changeset generation.
4. **Level 4 & 5 (Auditors & Reconcilers):** Ephemeral execution; inspects git diffs and test logs; never retains long-term memory.
