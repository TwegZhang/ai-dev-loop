# Goal — Runtime notification contract

> Fictional target-project example; not executed in this repository.

## Outcome and context

Implement a typed capability boundary that represents `enabled`, `disabled`, and `unavailable` without leaking platform APIs to the web. This is an outcome Lane under [Phase 01's Iteration Contract](../EXECUTION-PLAN.md#phase-01--embedded-iteration-contract); it does not replace that contract. Current Reality includes an empty adapter boundary; relevant Memory is the existing platform-isolation architecture.

## Inputs and boundaries

- Inputs: the approved architecture, existing runtime conventions, and local unit-test configuration.
- Own: `src/runtime/notifications.ts` and `src/runtime/notifications.test.ts`.
- In scope: exported capability type, deterministic fake adapter, and contract tests.
- Out of scope: web files, native delivery, packaging, dependency changes, and release.
- Shared/read-only: web consumers and test configuration; main owns integration.
- Escalate: changes to the agreed states or public boundary, architecture changes, material scope changes, or irreversible actions.

## Dependencies and integration

No hard implementation prerequisite. Native runtime access is unavailable but not needed for the approved fake-adapter claim. Main integrates the passing contract before web implementation starts. Handoff includes the accepted revision, exported type, fake behavior, and unit-test evidence. A read-only review can run alongside this goal; no other session may write its files.

## Success criteria, deferral, and evidence

- Each of the three states is representable without platform imports in the web-facing API.
- `npm test -- src/runtime/notifications.test.ts` must pass; report actual output and revision.
- Inspect the diff for platform-specific API exposure and record the result.
- Allowed deferral: native adapter implementation (TD), signed desktop behavior checks (DV), and unavailable desktop runner (EG).
- Claim limit: a tested fake contract does not prove real desktop behavior. Local contract tests may not be deferred.
- KR: divergence between the fake contract and native behavior remains possible until integration validation.

## Worktree, stop, and report

Main assigns a native subagent when available or executes directly in `../settings-runtime`, branch `phase-01/runtime`, from the recorded starting revision. Git worktree isolation is the default; no exception is needed. A Human-started independent CLI `/goal` session is optional and must receive the same inputs and ownership.

Stop when the boundary and required evidence are ready for main's integration, or report a precise blocker if the contract cannot be satisfied. Report changed files, completed/incomplete outcome, actual evidence, TD/DV/EG/KR, engineering learning, and Human decisions. Do not start web implementation or another Phase independently. Main owns the final Phase review and STOP.
