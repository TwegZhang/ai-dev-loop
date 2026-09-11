# Execution Plan — Shared settings boundary

> Fictional target-project example. Evidence in this example is illustrative.

## Direction: brainstorm and architecture

Human wants a web settings screen to show whether desktop notifications are enabled. Architecture discussion chooses a small runtime adapter returning a typed capability result, keeping platform details outside web components. Desktop notification delivery and a production release are not part of this pass.

## Phase 01 — Embedded Iteration Contract

This section is the single canonical Iteration Contract for the example, not a second goal contract.

- Reality: the web settings screen exists; a runtime adapter folder exists but has no notification capability contract. Local unit and web build tools are available; no signed desktop runner is available.
- Memory: no previous iteration result or open deferred item exists for this new feature. Existing architecture keeps platform APIs behind the runtime adapter.
- Human Judgment: prove the boundary and web behavior locally before investing in desktop packaging. Human approves local prototype fidelity with explicit desktop validation deferral.
- Priority: global project throughput over local workflow completeness; establish a stable boundary before expanding platform support.
- Human observations: Human can review the local web behavior now; a signed desktop runner is not available for this pass.
- Goal: display enabled, disabled, and unavailable notification states through a typed runtime boundary.
- In scope: runtime capability type and fake adapter, runtime unit tests, web display and tests, combined web build.
- Out of scope: operating-system notification delivery, signing, release, a new state management library, and changes to the selected architecture.
- Fidelity: locally tested prototype; no desktop end-to-end or release-readiness claim.
- Exit criteria: runtime contract tests pass, web tests cover all three states, combined web build passes, result and deferred memory are reconciled, and control returns to Human.
- Allowed deferral: signed desktop execution and native adapter integration. Record the absent runner as EG, unperformed integration checks as DV, and the fake-only adapter as TD.
- Required verification: local contract tests, local web tests, and integrated build may not be deferred under this contract.
- Hard constraints: preserve platform isolation and the agreed three-state shared contract; do not access production data, credentials, or notification services; do not expand beyond the local prototype.
- Allowed local autonomy: choose reversible internal implementation and test structure, use the approved fake adapter, and debug within the owned surfaces. Shared-contract changes remain outside this autonomy.
- Promoted carry-over: None. Continue deferred from earlier iterations: None; this is the first pass for this feature.
- Escalation: architecture or shared-contract changes, material scope growth, irreversible actions, or evidence invalidating this contract require Human judgment.
- Launch: one main Codex session owns coordination, integration, and final verification; native subagents may perform bounded tasks if available. Otherwise execute serially.
- Result: `phase-01-result.md`; lasting memory goes to target-project `engineering/deferred.md`, `ARCHITECTURE.md`, and `DECISIONS.md` as appropriate.

Exit also requires resolved hard dependencies, no unapproved architecture or shared-contract changes, and routing of engineering learning to the appropriate durable documents. The Goal table below defines the expected outcome lanes and their hard dependencies. Stop after the result and memory are complete; do not automatically continue to platform validation, hardening, release, debt cleanup, or future features.

## Bounded Goals

| Goal | Granularity | Owned write surface | Hard dependency | Integration |
|---|---|---|---|---|
| [Runtime contract](goals/goal-runtime-contract.md) | Outcome Lane | `src/runtime/notifications.ts`, `src/runtime/notifications.test.ts` | None | Main integrates tested contract first |
| [Web integration](goals/goal-web-integration.md) | Outcome Lane | `src/web/NotificationSettings.tsx`, `src/web/NotificationSettings.test.tsx` | Integrated runtime contract and passing contract tests | Main verifies combined result |

The web Goal cannot validly implement against an unsettled runtime contract; run it after the first Goal. Read-only review may run in parallel with either. Separate worktrees do not make conflicting interface decisions safe.

## Worktrees and handoff

Use `../settings-runtime` on branch `phase-01/runtime` from the recorded starting revision, then `../settings-web` on `phase-01/web` from the integrated runtime revision. Main records actual revision IDs at launch and integrates each result. No worktree exception is needed. Do not share writable files across sessions.

Advanced alternative: Human may start these as independent CLI `/goal` sessions in the same order, explicitly handing off the accepted runtime revision before starting web integration. `/goal` persists one objective across turns; it does not orchestrate the plan. No custom DAG, state machine, mailbox, or scheduler is introduced.

## Phase review and next boundary

Main reports completion, evidence, TD, DV, EG, KR, engineering learning, and Human decisions, reconciles memory, then **STOP**. A possible Phase 02 could implement the native adapter and obtain desktop evidence, but it is advisory only. Human must inspect refreshed Reality + Memory and decide whether that work is valuable before a new contract authorizes it.
