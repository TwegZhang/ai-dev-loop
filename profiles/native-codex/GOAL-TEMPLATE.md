# Goal — {{ID_AND_NAME}}

> Generated artifact: English only. A bounded outcome specification for a native Codex goal or ordinary execution; not a replacement for the Iteration Contract.

## Outcome and context

- Parent Execution Plan / current Phase: {{PATH_AND_PHASE}}
- Iteration Contract / Human decision: {{PATH_OR_SECTION_AND_REFERENCE}}
- Granularity: {{OUTCOME_LANE_OR_BOUNDED_TASK}}
- Verifiable outcome: {{WHAT_WILL_BE_TRUE}}
- Context and current Reality: {{FACTS_AND_LIMITS}}
- Relevant Memory: {{DEFERRED_ITEMS_PRIOR_RESULTS_OR_NONE}}

## Inputs and boundaries

- Required inputs / source of truth: {{CODE_DOCS_FIXTURES_INTERFACES}}
- In scope: {{SCOPE}}
- Out of scope: {{EXCLUSIONS}}
- Owned write surface: {{EXACT_FILES_OR_MODULES}}
- Shared/read-only surfaces: {{PATHS_AND_OWNER}}
- Escalate for: {{ARCHITECTURE_PUBLIC_CONTRACT_SCOPE_IRREVERSIBLE_OR_CONTRACT_INVALIDATION}}

## Dependencies and integration

- Hard prerequisites and readiness evidence: {{PREREQUISITES_OR_NONE}}
- Non-blocking ordering preferences / unavailable environments: {{ITEMS_OR_NONE}}
- Shared interface version / contract: {{REFERENCE}}
- Integration owner and handoff: {{OWNER_AND_ARTIFACT}}
- Safe parallel peers: {{GOALS_WITH_DISJOINT_WRITES_OR_NONE}}

Do not start dependent implementation before its hard prerequisite is ready. Do not concurrently edit another goal's files. Report contract conflicts to the integration owner; worktrees alone cannot resolve them.

## Success criteria and evidence

| Claim | Required check / evidence | Acceptance threshold |
|---|---|---|
| {{CLAIM}} | {{COMMAND_OR_INSPECTION_ARTIFACT}} | {{EXPECTED_RESULT}} |

- Allowed deferral: {{ITEMS_AND_WHY_SAFE_OR_NONE}}
- Claim limits caused by deferral: {{WHAT_CANNOT_BE_CLAIMED}}
- Memory classification: {{TD_DV_EG_KR_OR_NONE}}
- Required proof that may not be deferred: {{CHECKS}}

Distinguish Implemented, Verified, Partially Verified, Not Verified, Deferred, and Assumed. Never count an unperformed check as passed.

## Worktree and execution

- Session / owner: {{MAIN_SUBAGENT_OR_HUMAN_STARTED_CLI_SESSION}}
- Git worktree path / branch / base revision: {{VALUES}}
- Exception and alternative isolation controls: {{JUSTIFICATION_OR_NONE}}
- Goal mode available: {{YES_OR_ORDINARY_BOUNDED_EXECUTION}}

Default to Git worktree isolation for implementation. `/goal` is a durable single objective across turns toward a verifiable stopping condition, not an orchestrator. No custom state machine, DAG, mailbox, or automatic next-goal scheduling is needed.

## Stop and report

Stop at {{VERIFIABLE_OUTCOME_OR_PRECISE_BLOCKER}}. Report changed files, completed/incomplete scope, evidence with actual results, TD, DV, EG, KR, engineering learning, and needed Human decisions to {{INTEGRATION_OWNER_AND_RESULT_PATH}}. Do not expand scope or start another Phase. The main session consolidates Phase evidence and memory, then STOP; only Human judgment from refreshed Reality + Memory can authorize the next Phase.
