# Iteration 01 — Feature Complete Pass

## 1. Goal

Complete the major V1 runtime, web integration, installer, and update code paths so the system reaches a usable integration state.

## 2. Why this iteration exists

Architecture is approved. The highest-value next step is to turn the design into working software quickly, then use integrated behavior to discover the next real constraints.

## 3. Priority

> Global project throughput > local workflow completeness.

## 4. Human observations

- No Windows test machine is currently prepared.
- macOS is the active development environment.
- Platform validation should not block core implementation.

## 5. In scope

- Runtime Core
- Web → Local Runtime integration
- Installer Core
- Update Core

## 6. Out of scope

- Windows 10/11 real-machine validation
- macOS notarization
- full upgrade compatibility matrix
- performance hardening

## 7. Fidelity target

**Selected:** Feature Complete

**Meaning:** Major V1 product paths have implementation and can be integrated; release-grade platform validation is not required in this pass.

## 8. Hard constraints

- Preserve approved Runtime/Web architecture.
- Preserve public localhost API contract.
- Do not expand V1 scope.
- Do not introduce a second persistence mechanism.

## 9. Allowed local autonomy

Workers may choose local structure, tests, mocks, reversible refactors, and next-best validation.

## 10. Promoted carry-over

- None — first tracked iteration.

## 11. Continue deferred

- None — first tracked iteration.

## 12. Allowed deferrals

- Windows real-machine validation
- notarization/signing validation
- full OS/upgrade matrix

## 13. Hard dependencies

- Public localhost API contract must remain stable for Runtime and Web lanes.
- No other hard lane-to-lane dependencies.

## 14. Expected outcome lanes

### Lane 1 — Runtime Core
Implement the shared runtime behavior and stable local API.

### Lane 2 — Web Integration
Implement the primary Web → localhost user flow against the approved contract.

### Lane 3 — Installer Core
Implement install/startup/uninstall logic at Feature Complete fidelity.

### Lane 4 — Update Core
Implement the update mechanism and local update flow.

## 15. Verification expected now

- macOS build
- unit tests for core logic
- API contract checks
- local integration smoke path

## 16. Verification explicitly deferred

- Windows clean install / startup / uninstall
- macOS notarization
- complete upgrade matrix

## 17. Exit criteria

- [x] Major in-scope outcomes implemented
- [x] Required macOS/local verification completed
- [x] No unapproved architecture/public-contract changes
- [x] Deferred platform validation recorded
- [x] Iteration result produced

## 18. Human gates

Standard five Human Gates from OMX-Lite policy.

## 19. Stop condition

Stop after Feature Complete criteria. Do not enter Platform Validation or Release Candidate work.

## 20. Artifact locations

```text
Result: iterations/iteration-01-result.md
Deferred: engineering/deferred.md
```
