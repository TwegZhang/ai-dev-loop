# Native Codex Profile

[&#31616;&#20307;&#20013;&#25991;](README.zh-CN.md)

A lightweight execution profile of AI Dev Loop, alongside OMX-Lite. OMX Default remains the upstream baseline/reference. The canonical hierarchy is **Project → Iteration → Lane → Task → Inner Loop**, and each iteration starts with **Reality → Memory → Human Judgment → Contract**.

## Start here

1. Resolve product and architecture questions with Human, then write an [Execution Plan](EXECUTION-PLAN-TEMPLATE.md).
2. Approve only the current Phase and its Iteration Contract. Phase ≈ Human-controlled Iteration; later phases are advisory.
3. Define [bounded Goals](GOAL-TEMPLATE.md). Goal ≈ outcome Lane or bounded Task, depending on granularity; it never replaces the Iteration Contract.
4. Start one main Codex session. It coordinates native subagents when available, integrates their work, and verifies the combined outcome. Execute serially if subagents are unavailable or add no value.
5. Produce the Phase result, reconcile memory, surface Human decisions, and **STOP**. Start another Phase only after Human judgment from refreshed Reality + Memory.

The main session can use `/goal` for one durable objective across turns toward a verifiable stopping condition. `/goal` is not an orchestrator or permission to execute future phases. This profile adds no custom orchestrator, state machine, DAG, mailbox, or scheduler. Templates are ordinary planning documents, not runtime state. If goal mode is unavailable, use ordinary bounded execution with the same contract.

Advanced option: Human starts independent Codex CLI `/goal` sessions, each with a bounded goal, a separate worktree, and explicit ownership. Human or a named main session owns dependency readiness, integration, and final review. Separate sessions do not imply shared memory or automatic coordination.

## Scope and parallelism

Each Goal states outcome, context, inputs, boundaries, success criteria, allowed deferral, hard dependencies, integration surface, evidence, worktree, and stop/report rules. A hard dependency blocks only when its absence prevents valid implementation. An unavailable check can be deferred only when the current contract permits the narrower claim.

Parallel goals need both independent readiness and disjoint write surfaces. Establish shared interfaces first; serialize dependent implementation or assign a single interface owner. Worktrees do not resolve semantic conflicts. Use a Git worktree by default for implementation. Record justified exceptions and controls: read-only work, a tiny serial change in a clean checkout, or an environment bound to a single checkout. Never allow concurrent writers to the same files.

Phase review reports completed/incomplete work, evidence, TD, DV, EG, KR, engineering learning, and Human decisions. Use the canonical [Iteration Result](../../templates/ITERATION-RESULT-TEMPLATE.md) and [Deferred Engineering Memory](../../templates/DEFERRED-LEDGER-TEMPLATE.md) structures. Remembered ≠ Scheduled Now; Iteration Complete ≠ Fully Verified ≠ Release Ready. Write generated plans, goals, results, and memory in English; Human discussion may use the preferred language.

See the [worked example](examples/README.md) and [profile selector](../../docs/06-Choosing-an-Execution-Profile.md). Official capabilities: [goals](https://learn.chatgpt.com/use-cases/follow-goals), [subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents), [Git worktrees](https://learn.chatgpt.com/docs/environments/git-worktrees). The Human phase boundary is AI Dev Loop policy, not a claim about automatic product behavior.
