# Choosing an Execution Profile

[&#31616;&#20307;&#20013;&#25991;](06-Choosing-an-Execution-Profile.zh-CN.md)

Choose execution mechanics after defining the development pass. The canonical methodology remains **Project → Iteration → Lane → Task → Inner Loop**, with **Reality → Memory → Human Judgment → Contract** at every iteration boundary.

```text
AI Dev Loop Canonical Methodology
├── Native Codex Profile
└── OMX-Lite Profile

OMX Default = upstream baseline / reference
```

Profiles apply the same methodology; they do not add competing lifecycle levels. OMX Default is the upstream operating baseline for comparison, not another AI Dev Loop methodology or a promise that every upstream mode follows this repository's iteration boundary.

## Select on six dimensions

| Dimension | Native Codex Profile | OMX-Lite Profile | OMX Default reference |
|---|---|---|---|
| Human control capability | Human can judge scope, interfaces, evidence, and integration at phase boundaries | Human retains those decisions; explicit policy and iteration artifacts help coordinate them | Evaluate the selected upstream workflow's Human checkpoints |
| Coordination complexity | A few bounded goals; main Codex can coordinate integration | Multiple outcome lanes benefit from explicit OMX coordination | Consult upstream modes for their coordination contracts |
| Environment uncertainty | Useful when Human can accept bounded local evidence and revisit gaps soon | Useful when DV/EG records must stay visible across coordinated lanes | Check whether upstream verification expectations fit unavailable environments |
| Verification rigidity | Contract defines required proof; no mandatory orchestration machinery | Contract plus OMX-Lite policy distinguish required checks from safe deferral | Evaluate actual mode gates; do not assume all upstream modes behave alike |
| Desired autonomy | Sustained execution inside a goal, followed by Human phase review | Coordinated autonomy inside one approved iteration, then STOP | Mode-dependent autonomy and stopping rules |
| Persistent orchestration state | None added; ordinary files, Git, and native goal continuity | Selected OMX runtime may keep coordination state; adopt only what is needed | Upstream runtime owns its state and lifecycle |

These dimensions are prompts for judgment, not a score or an automatic selector. Low Human availability does not make ambiguous architecture safe to delegate. High verification rigidity does not automatically require OMX: a single native goal can have strict tests. High uncertainty may call for a smaller discovery iteration under either profile. A complex project can still use Native Codex for a bounded, independent slice.

## Quick selection

```text
Low orchestration need
→ Native Codex Profile

Medium / adaptive orchestration
→ OMX-Lite Profile

High / strict orchestration
→ evaluate OMX Default
```

This is a starting point, not a size rule. A large project can use Native Codex for a few independent Goals. A small but compliance-heavy change may benefit from strict upstream verification. An uncertain environment may favor a short Native discovery Phase or an OMX-Lite Iteration with explicit DV/EG memory rather than a strict closure path.

Use [Native Codex](../profiles/native-codex/README.md) for a small feature, a focused repair, or an exploratory implementation with a clear local stopping condition and available Human review. Use [OMX-Lite](../profiles/omx-lite/README.md) when several outcomes need coordinated execution and the installed OMX runtime earns its overhead. Use the [OMX integration reference](../integrations/OMX.md) to understand the upstream baseline before selecting runtime features. Change profiles at a reviewed boundary; do not silently migrate active work or assume state is interchangeable.

## OMX Default reference

A typical strict upstream orchestration shape is:

```text
planning
→ task / dependency graph
→ team / orchestration
→ verification
→ workflow closure
```

It can fit work that benefits from strong framework control, heavy worker coordination, stable execution and validation environments, fewer Human interventions inside execution, and strict closure. Evaluate the actual installed workflow rather than assuming every OMX mode has this exact contract.

The trade-offs to examine are over-orchestration, task explosion, soft ordering hardened into blocking dependencies, and validation or environment gaps becoming blockers before the current claim requires them. AI Dev Loop does not reimplement or override OMX Default; choose it directly when its framework control is worth those costs.

## Native planning and execution

Brainstorming and architecture decisions feed an Execution Plan. The plan identifies a Human-approved Phase and bounded Goals; future phases remain proposals. **Phase ≈ Human-controlled Iteration. Goal ≈ an outcome Lane or a bounded Task**, depending on granularity. A Goal never replaces the Iteration Contract. Link the canonical contract, or put its required content in the Phase section without maintaining conflicting copies.

The default launch is one main Codex session coordinating native subagents when available. The main session owns integration and the consolidated result. Without subagents, execute serially. Advanced users may start independent Codex CLI `/goal` sessions themselves, with separate worktrees, explicit ownership, and a named integration owner. This is optional and is not an automatically managed session fleet.

`/goal` maintains one durable objective across turns toward a verifiable stopping condition. It is not a multi-goal orchestrator. Native goals do not require a custom state machine, DAG, mailbox, or scheduler. Availability depends on the Codex surface; use ordinary bounded execution when goal mode is unavailable. See the official [goal guide](https://learn.chatgpt.com/use-cases/follow-goals), [subagent guide](https://learn.chatgpt.com/docs/agent-configuration/subagents), and [Git worktree guide](https://learn.chatgpt.com/docs/environments/git-worktrees).

Parallelize only when goals can produce valid outcomes without waiting on hard dependencies and their write surfaces are disjoint. Freeze a shared interface first; serialize its owner before dependent integration. Separate worktrees isolate files, not incompatible contract changes. Use a Git worktree by default for implementation; justify exceptions such as a read-only review, a tiny serial edit in a clean checkout, or an environment tied to one checkout. Record the alternative isolation controls. Never use an exception to permit concurrent edits to the same files.

## Review, memory, and STOP

Review the integrated Phase result, including completed and incomplete outcomes, evidence and verification limits, Technical Debt (TD), Deferred Verification (DV), Environment Gaps (EG), Known Risks (KR), engineering learning, and Human decisions. Reconcile unresolved items into engineering memory; route lasting architecture facts and decisions to their respective documents. Then **STOP**.

The next Phase begins only after Human judgment using refreshed Reality + Memory. Remembered work is not automatically scheduled. Iteration Complete ≠ Fully Verified ≠ Release Ready. Use the [Execution Plan template](../profiles/native-codex/EXECUTION-PLAN-TEMPLATE.md), [Goal template](../profiles/native-codex/GOAL-TEMPLATE.md), and [worked example](../profiles/native-codex/examples/README.md).
