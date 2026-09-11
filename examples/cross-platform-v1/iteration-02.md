# Iteration 02 — Integration Correction

## 1. Goal

Stabilize the integrated V1 user flow before spending time on platform validation.

## 2. Why this iteration exists

Iteration 01 produced working software and new evidence: reconnect/cancel behavior and installer upgrade lifecycle are higher-value problems than immediate Windows validation.

## 3. Priority

> Fix integration reality before broad platform verification.

## 4. Human observations

- Main user flow runs.
- Reconnect feels unreliable.
- Installer upgrade behavior is fragile.
- Windows preparation should remain deferred for this pass.

## 5. In scope

- reconnect/cancel integration
- installer upgrade lifecycle
- integration smoke coverage

## 6. Out of scope

- Windows platform validation
- notarization
- full upgrade matrix
- performance hardening

## 7. Fidelity target

**Selected:** Integration Complete

**Meaning:** Core V1 paths behave coherently in the active integration environment; broad target-platform evidence is still deferred.

## 8. Hard constraints

- Preserve public localhost API unless a Human Gate approves change.
- Preserve V1 scope.
- No release-hardening expansion.

## 9. Allowed local autonomy

Standard OMX-Lite local autonomy.

## 10. Promoted carry-over

- TD-001 reconnect retry duplication
- TD-002 installer upgrade lifecycle

## 11. Continue deferred

- DV-001 Windows install/startup/uninstall
- DV-002 macOS notarization
- DV-003 full upgrade matrix
- EG-001 Windows test environment
- KR-001 Windows startup assumption

## 12. Allowed deferrals

- all listed Continue Deferred items unless new evidence turns one into a Human Gate/blocker

## 13. Hard dependencies

- None between the two main correction lanes.

## 14. Expected outcome lanes

### Lane 1 — Runtime Integration Correction
Consolidate reconnect policy and complete cancel/reconnect behavior.

### Lane 2 — Installer Lifecycle Correction
Simplify upgrade lifecycle and establish reliable local integration behavior.

### Lane 3 — Integration Evidence
Strengthen smoke/integration checks for the corrected flows.

## 15. Verification expected now

- build
- unit tests
- local integration smoke
- reconnect/cancel scenarios
- local upgrade lifecycle smoke

## 16. Verification explicitly deferred

- Windows real-machine checks
- notarization
- full supported upgrade matrix

## 17. Exit criteria

- [ ] reconnect/cancel integration meets Integration Complete claim
- [ ] installer local lifecycle meets Integration Complete claim
- [ ] integration evidence passes
- [ ] platform/deferred records remain reconciled
- [ ] result produced

## 18. Human gates

Standard five Human Gates.

## 19. Stop condition

Stop when Integration Complete criteria are met. Do not automatically prepare Windows or start release hardening.

## 20. Artifact locations

```text
Result: iterations/iteration-02-result.md
Deferred: engineering/deferred.md
```
