# Goal — Web notification settings integration

> Fictional target-project example; not executed in this repository.

## Outcome and context

Display the runtime capability as enabled, disabled, or unavailable in the existing web settings screen. This is an outcome Lane under [Phase 01's Iteration Contract](../EXECUTION-PLAN.md#phase-01--embedded-iteration-contract). The typed runtime contract is the required input; the Goal does not substitute for the Iteration Contract. Memory includes the fake-adapter limitation from the runtime Goal.

## Inputs and boundaries

- Inputs: main's integrated runtime revision, passing contract-test evidence, the exported type, and existing settings UI/test conventions.
- Own: `src/web/NotificationSettings.tsx` and `src/web/NotificationSettings.test.tsx`.
- Read-only: `src/runtime/notifications.ts` and its tests; runtime Goal owns that boundary.
- In scope: rendering all three states through the adapter and focused component tests.
- Out of scope: native adapter, platform permissions, packaging, dependencies, unrelated UI redesign, and release.
- Escalate: runtime contract incompatibility, architecture or material scope changes, and irreversible actions; do not silently patch the runtime files.

## Dependencies and integration

Hard dependency: runtime contract is integrated and its required tests pass. Main records the accepted revision before this Goal starts. The two implementation Goals are serial even though their files differ. Read-only review may run concurrently. Main owns final integration and the combined build.

## Success criteria, deferral, and evidence

- The UI displays enabled, disabled, and unavailable states without direct platform calls.
- `npm test -- src/web/NotificationSettings.test.tsx` must pass, covering all three states.
- Main reruns both test files and `npm run build` after integration; record actual results and revision in the Phase report.
- Allowed deferral: desktop end-to-end verification (DV), unavailable signed runner (EG), and replacement of the fake runtime adapter (TD).
- Claim limit: local rendering tests and a web build do not establish desktop delivery or release readiness. Component tests and the integrated build may not be deferred.
- KR: real native capability semantics could differ from the fake and require a later Human-reviewed contract change.

## Worktree, stop, and report

Use `../settings-web`, branch `phase-01/web`, based on the accepted runtime revision. Main executes directly or assigns a bounded native subagent. No worktree exception is needed. Human may optionally start a separate CLI `/goal` session after the hard dependency is ready.

Stop when implementation and required evidence are ready for main's integration, or report the precise blocker. Return changed files, completed/incomplete scope, evidence, TD/DV/EG/KR, engineering learning, and Human decisions. Main consolidates the Phase result and memory, then STOP. Do not start native integration or Phase 02 without fresh Human judgment and a new contract.
