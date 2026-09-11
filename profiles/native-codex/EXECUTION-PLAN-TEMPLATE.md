# Execution Plan — {{PROJECT_OR_OUTCOME}}

> Generated artifact: English only. An ordinary planning document, not an executable DAG or runtime state machine.

## 1. Direction and planning inputs

- Human product intent: {{INTENT}}
- Brainstorming conclusions / architecture decisions: {{DECISIONS_AND_LINKS}}
- Reality: {{CURRENT_CODE_ENVIRONMENTS_TESTS_AND_LIMITS}}
- Memory reviewed: {{PREVIOUS_RESULTS_DEFERRED_ITEMS_ARCHITECTURE_DECISIONS}}
- Human Judgment: {{WHY_THIS_PASS_NOW_AND_ACCEPTED_TRADEOFFS}}
- Planning assumptions requiring confirmation: {{ASSUMPTIONS_OR_NONE}}

Preserve Project → Iteration → Lane → Task → Inner Loop and Reality → Memory → Human Judgment → Contract. Phase ≈ Human-controlled Iteration; Goal ≈ outcome Lane or bounded Task. Goals never replace the Iteration Contract.

## 2. Current Phase / Iteration Contract

- Phase ID and outcome: {{ID_AND_OUTCOME}}
- Canonical Iteration Contract: {{PATH_TO_COMPLETED_ITERATION_CONTRACT}}
- Human approval / decision reference: {{REFERENCE}}
- Fidelity and exact claims: {{CLAIMS}}
- In scope / out of scope: {{BOUNDARIES}}
- Required verification / exit criteria: {{CHECKS_AND_STOP_CONDITION}}
- Allowed deferral and claim limits: {{DEFERRALS_OR_NONE}}
- Escalation boundaries: {{ARCHITECTURE_SHARED_CONTRACT_SCOPE_OR_IRREVERSIBLE_DECISIONS}}

Complete the linked [Iteration Contract](../../templates/ITERATION-TEMPLATE.md) before execution. Alternatively, embed all its required content here as the single source of truth; do not maintain conflicting copies. Future phases are recommendations until Human reviews new Reality + Memory.

## 3. Bounded Goals and execution order

| Goal / document | Lane or Task | Outcome | Hard prerequisite | Owned write surface | Integration owner / interface |
|---|---|---|---|---|---|
| {{GOAL_PATH}} | {{GRANULARITY}} | {{OUTCOME}} | {{PREREQUISITE_OR_NONE}} | {{FILES_OR_MODULES}} | {{OWNER_AND_CONTRACT}} |

A hard dependency exists only if useful valid implementation cannot proceed without it. Parallelize ready goals only when write surfaces are disjoint and shared interfaces are stable. Serialize overlapping writers; worktree isolation does not settle contract conflicts. List accepted evidence required before a dependent goal begins: {{READINESS_EVIDENCE}}.

## 4. Launch and isolation

- Default: one main Codex session, using native subagents when available and useful; otherwise serial execution.
- Main session / integration owner: {{OWNER}}
- Optional advanced mode: {{HUMAN_STARTED_INDEPENDENT_CLI_GOAL_SESSIONS_OR_NOT_USED}}
- Git worktree and branch for each implementation writer: {{MAPPING}}
- Worktree exception and alternative controls: {{JUSTIFICATION_OR_NONE}}
- Integration order and combined checks: {{ORDER_AND_CHECKS}}

Use Git worktrees by default. A read-only task, tiny serial change in a clean checkout, or environment bound to one checkout may justify an exception; document it and prevent concurrent writes. Independent CLI `/goal` sessions are Human-started, not auto-scheduled. `/goal` sustains one durable objective across turns toward a verifiable stop; it is not an orchestrator. Add no custom orchestrator, state machine, DAG, or mailbox.

## 5. Review and STOP

- Result destination: {{PHASE_RESULT_PATH}}
- Memory destination: {{ENGINEERING_DEFERRED_PATH}}
- Architecture / decision destinations: {{PATHS}}

Report completed and incomplete outcomes, evidence and verification limits, TD, DV, EG, KR, engineering learning, and Human decisions. Reconcile memory using the canonical [result](../../templates/ITERATION-RESULT-TEMPLATE.md) and [deferred ledger](../../templates/DEFERRED-LEDGER-TEMPLATE.md) structures. Then STOP and return control to Human. Do not start a proposed next Phase until Human judgment has used refreshed Reality + Memory.

## 6. Possible later phases — advisory only

{{OPTIONS_WITHOUT_AUTOMATIC_AUTHORIZATION}}

Remembered ≠ Scheduled Now. Iteration Complete ≠ Fully Verified ≠ Release Ready.
