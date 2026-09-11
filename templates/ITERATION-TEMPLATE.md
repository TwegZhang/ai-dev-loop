# Iteration {{ID}} — {{NAME}}

> Human-owned contract for **one bounded development pass**.
> Normally generated through `$iteration start`; this file may also be edited manually.
> Generated iteration artifacts must be written in English.

This canonical schema is used by the OMX-Lite Profile and may also be referenced by the Native Codex Profile. Keep one authoritative Iteration Contract per pass; a Native Phase or Goal must not create a conflicting copy.

## 1. Goal

{{GOAL}}

## 2. Why this iteration exists

{{CONTEXT}}

## 3. Priority

Default:

> **Global project throughput > local workflow completeness.**

Additional priorities:

- {{PRIORITY}}

## 4. Human observations

Current real-world observations that materially affect this iteration:

- {{OBSERVATION_OR_NONE}}

## 5. In scope

Prefer outcome-level work.

- {{OUTCOME_1}}
- {{OUTCOME_2}}
- {{OUTCOME_3}}

## 6. Out of scope

- {{OUT_OF_SCOPE}}

## 7. Fidelity target

Choose the claim this pass intends to achieve:

```text
Prototype
Architecture Proof
Code Complete
Feature Complete
Integration Complete
Platform Validation
Hardening
Release Candidate
```

**Selected:** {{FIDELITY}}

**Meaning in this project:** {{FIDELITY_MEANING}}

## 8. Hard constraints

Workers must not cross these without a Human Gate:

- Architecture: {{ARCH_CONSTRAINT}}
- Public/shared contracts: {{CONTRACT_CONSTRAINT}}
- Data/security boundaries: {{DATA_SECURITY_CONSTRAINT}}
- Scope: {{SCOPE_CONSTRAINT}}
- Other: {{OTHER_CONSTRAINT_OR_NONE}}

## 9. Allowed local autonomy

Workers may independently make reversible local implementation choices, refactor internals, choose test structure, use mocks/local substitutes, reorder local substeps, and use next-best verification while preserving the hard constraints.

Project-specific additions:

- {{AUTONOMY_OR_NONE}}

## 10. Promoted carry-over

Historical items intentionally scheduled now:

- {{PROMOTED_OR_NONE}}

## 11. Continue deferred

Relevant historical items explicitly reviewed and intentionally **not** scheduled now:

- {{CONTINUE_DEFERRED_OR_NONE}}

## 12. Allowed deferrals

New items of these kinds may be deferred if they do not block meaningful implementation:

- {{ALLOWED_DEFERRAL}}

Deferred items must be recorded in `engineering/deferred.md`.

## 13. Hard dependencies

Only genuine implementation blockers belong here.

- {{HARD_DEPENDENCY_OR_NONE}}

## 14. Expected outcome lanes

Planner may refine wording while preserving boundaries. Avoid micro-task explosion.

### Lane 1 — {{LANE_1}}
Goal: {{LANE_1_GOAL}}

### Lane 2 — {{LANE_2}}
Goal: {{LANE_2_GOAL}}

### Lane 3 — {{LANE_3}}
Goal: {{LANE_3_GOAL}}

Add/remove lanes when the architecture clearly warrants it. Default target is 3–7 when parallelism is useful.

## 15. Verification expected now

Verification must match the current claim/fidelity.

- {{VERIFY_NOW}}

## 16. Verification explicitly deferred

These checks are not required to declare **this iteration** complete:

- {{VERIFY_DEFERRED_OR_NONE}}

## 17. Exit criteria

- [ ] Major in-scope outcomes meet the selected fidelity
- [ ] Genuine hard dependencies are resolved
- [ ] Required current verification is complete
- [ ] No unapproved architecture/public-contract change remains
- [ ] Relevant deferred validation/debt/risk is recorded
- [ ] Important engineering learning is routed to the appropriate durable document
- [ ] Iteration Result is produced

Additional criteria:

- [ ] {{EXIT_CRITERION_OR_NONE}}

## 18. Human gates

Interrupt Human only for architecture change, public/shared contract change, material scope change, irreversible/high-cost decision, or evidence invalidating this iteration.

## 19. Stop condition

> When the Exit Criteria are met, write/update the iteration result and engineering memory, then **STOP** for Human review. Do not automatically continue into later platform validation, hardening, release work, debt cleanup, or future features.

## 20. Artifact locations

```text
Result:   iterations/iteration-{{ID}}-result.md
Deferred: engineering/deferred.md
```
