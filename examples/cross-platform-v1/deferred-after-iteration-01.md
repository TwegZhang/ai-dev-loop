# Deferred Engineering Memory

> Example after Iteration 01. This is memory, not an automatically scheduled backlog.

## DV-001 Windows install/startup/uninstall

Type: Deferred Verification
Status: Deferred
Found in: Iteration 01
Last reviewed in: Iteration 01

Blocking current development: No
Required before: Release Candidate
Suggested trigger: Platform Validation

### Reason

Windows test environment is not currently prepared and integration issues have higher learning value.

### What is already known

Installer code path exists; macOS/local logic and static review are complete.

### Evidence

No Windows real-machine evidence yet.

### Future action

Validate clean install, startup, uninstall, and basic service/runtime behavior on supported Windows targets.

---

## DV-002 macOS notarization

Type: Deferred Verification
Status: Deferred
Found in: Iteration 01
Last reviewed in: Iteration 01

Blocking current development: No
Required before: Release Candidate
Suggested trigger: Hardening

### Reason

Feature/integration code is still changing.

### What is already known

Installer core exists.

### Evidence

No notarization run in this iteration.

### Future action

Perform signing/notarization validation after installer behavior stabilizes.

---

## DV-003 Full upgrade matrix

Type: Deferred Verification
Status: Deferred
Found in: Iteration 01
Last reviewed in: Iteration 01

Blocking current development: No
Required before: Release Candidate
Suggested trigger: Platform Validation

### Reason

Upgrade lifecycle needs another implementation pass before broad matrix testing.

### What is already known

Basic update flow exists.

### Evidence

Local development path only.

### Future action

Validate supported previous→current upgrade combinations.

---

## TD-001 Reconnect retry duplication

Type: Technical Debt
Status: Deferred
Found in: Iteration 01
Last reviewed in: Iteration 01

Blocking current development: No
Required before: Platform Validation
Suggested trigger: Integration Complete

### Reason

Working behavior exists but duplicate retry policy now affects integration reliability.

### What is already known

Human integrated run exposed inconsistent reconnect behavior.

### Evidence

Iteration 01 Human observation and local logs.

### Future action

Consolidate retry/reconnect policy and verify cancel/reconnect interaction.

---

## TD-002 Installer upgrade lifecycle

Type: Technical Debt
Status: Deferred
Found in: Iteration 01
Last reviewed in: Iteration 01

Blocking current development: No
Required before: Platform Validation
Suggested trigger: Integration Complete

### Reason

Basic code exists but lifecycle structure is too fragile for useful platform matrix testing.

### What is already known

Clean local path works; upgrade edge behavior is incomplete.

### Evidence

Iteration 01 integrated development run.

### Future action

Simplify lifecycle and establish an integration-level upgrade smoke path.

---

## EG-001 Windows test environment

Type: Environment Gap
Status: Deferred
Found in: Iteration 01
Last reviewed in: Iteration 01

Blocking current development: No
Required before: Platform Validation
Suggested trigger: Platform Validation

### Reason

No prepared Windows target.

### What is already known

Current work can proceed without it.

### Evidence

N/A

### Future action

Prepare Windows 10/11 validation environment when entering Platform Validation.

---

## KR-001 Windows startup assumption

Type: Known Risk
Status: Deferred
Found in: Iteration 01
Last reviewed in: Iteration 01

Blocking current development: No
Required before: Release Candidate
Suggested trigger: Platform Validation

### Reason

Startup behavior is based on design/static reasoning only.

### What is already known

No evidence contradicts it yet.

### Evidence

Code/static review only.

### Future action

Validate startup semantics on Windows and convert any discovered permanent constraint into architecture/decision documentation.
