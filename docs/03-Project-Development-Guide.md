# Project Development Guide — Human Guide v1.0

[English](03-Project-Development-Guide.md) | [&#31616;&#20307;&#20013;&#25991;](03-Project-Development-Guide.zh-CN.md)

> For leaders, architects, and engineers to use directly.
> This development method puts Humans in charge of overall iteration direction and OMX in charge of execution within each iteration.

## 1. Mental Model

```text
Human:
Product / Architecture / How far this iteration should go
                 ↓
$iteration:
Reality → Memory → Judgment → Contract
                 ↓
OMX/Codex:
Execute rigorously within this iteration's boundaries
                 ↓
$iteration close:
Result + Deferred Memory
                 ↓
STOP
                 ↓
Human:
Run the software / Observe / Decide on the next iteration
```

## 2. Adopting This Workflow in a Project for the First Time

The project should have at least:

```text
ARCHITECTURE.md
specs/...
```

Copy from this workflow package:

```text
policy/OMX-LITE-POLICY.md
templates/
skills/iteration/
```

Then initialize:

```text
iterations/
engineering/deferred.md
```

See `docs/05-Project-Setup.md` for detailed installation instructions.

## 3. Using `OMX-LITE-POLICY.md`

The Policy defines stable team rules; it is not a form to fill out for each iteration.

It establishes:

- OMX is responsible only for the current Iteration;
- global throughput takes priority;
- only hard implementation dependencies are blocking;
- use outcome lanes rather than micro-tasks;
- defer safely and report truthful evidence;
- the Human Gate;
- execution must stop at the iteration boundary.

The project's `AGENTS.md` should reference it.

## 4. Using `ITERATION-TEMPLATE.md`

The Template is the **Contract schema for one iteration handed from Human to OMX**.

The recommended default is to generate it automatically with:

```text
$iteration start
```

Humans do not need to mechanically fill in every field.

The skill reads the repository and the previous iteration's Memory, then asks Humans only for judgments.

You can also copy it manually:

```bash
cp templates/ITERATION-TEMPLATE.md iterations/iteration-01.md
```

## 5. `$iteration start`: Four Views

### View 1 — Reality

The skill automatically reads:

- Architecture / Spec;
- the latest code / Git state;
- the previous iteration's Result;
- current verification evidence;
- the Human's current observations from running the software.

It answers:

> What is the actual state right now?

### View 2 — Memory

It reads:

```text
previous iteration result
+
engineering/deferred.md
```

For relevant carry-over items, it reassesses and recommends:

```text
PROMOTE
KEEP-DEFERRED
RESOLVE
OBSOLETE
ESCALATE
```

Old issues do not automatically enter the next iteration.

### View 3 — Judgment

The skill offers a recommendation before asking the Human.

For example:

```text
I recommend Integration Complete for the next iteration:
PROMOTE reconnect/cancel;
continue to defer Windows/notarization.
Accept or adjust?
```

The Human primarily decides:

- priority;
- fidelity;
- scope;
- risk/trade-off.

### View 4 — Contract

After confirmation, it writes:

```text
iterations/iteration-XX.md
```

This defines the execution boundary for the iteration.

## 6. Choosing an Execution Mode

After the Contract is approved:

| Situation | Use |
|---|---|
| One clear bounded task | solo Codex/OMX |
| The iteration still needs to be broken down into implementation steps | `$plan` |
| One long execution thread | `$ultragoal` |
| Multiple genuinely parallel Lanes that warrant coordination | `$team` |

Current official OMX guidance also distinguishes lightweight planning, durable execution, and coordinated teams; a project being “large” does not mean every iteration needs Team.

## 7. Why Full Autopilot Is Not the Default for Managing All of V1

This method already puts the following back in Human hands:

```text
Architecture
Iteration Definition
Iteration Boundary
```

For routine iterations, explicitly choosing the execution surface currently needed is therefore a better fit than letting an orchestrator expand from the current state all the way to Release.

## 8. When the Agent Can Stop

Look at the current Iteration Fidelity.

For example, at `Feature Complete`:

```text
Implementation: complete
Local build/tests: pass
Windows real-machine validation: deferred
Release readiness: not assessed
```

This may already satisfy the iteration.

Do not impose Release Candidate evidence requirements prematurely on Feature Complete.

## 9. What Can Be Deferred

Work can be deferred if doing so does not make the current claim misleading or create unacceptable architectural or correctness risks. Examples include:

- Windows/macOS real-machine environments that are not yet ready;
- notarization/signing;
- the full upgrade matrix;
- enterprise network validation;
- performance benchmarks;
- later-stage manual QA.

Deferred work must be recorded in:

```text
engineering/deferred.md
```

## 10. Using `deferred.md`

It is Engineering Memory, not a TODO list.

Example:

```text
DV-001 Windows clean install
Status: Deferred
Blocking current development: No
Required before: Release Candidate
Suggested trigger: Platform Validation
```

When a Platform Validation iteration arrives, `$iteration` sees the trigger again and recommends PROMOTE.

## 11. `$iteration status`

Run a read-only check:

```text
$iteration status
```

It reports:

- the current iteration/fidelity;
- outcome progress;
- verification evidence;
- genuine hard blockers;
- relevant deferred items;
- architecture drift;
- Human decisions.

It does not automatically change the plan.

## 12. `$iteration review`

When OMX's plan starts becoming mechanical:

```text
$iteration review
```

Focus the review on whether:

- Lanes are too granular;
- fake dependencies have been introduced;
- later-stage validation has prematurely become a blocker;
- fidelity and evidence are misaligned;
- carry-over memory has been ignored;
- the stop boundary has disappeared.

## 13. `$iteration close`

Once the iteration meets its Exit Criteria:

```text
$iteration close
```

It performs two essential actions:

### Produce Event Memory

```text
iterations/iteration-XX-result.md
```

Record what actually happened during this iteration.

### Update Persistent Engineering Memory

```text
engineering/deferred.md
```

Record what still needs to be addressed in the future.

Then:

> **STOP. Do not automatically start the next iteration.**

## 14. What Humans Do After Close

The Human actually runs and experiences the system:

```text
Working Software
    ↓
Actual observations
    ↓
Read Result + Deferred
    ↓
Decide on the next iteration
```

The Human's current observations become Reality input for the next `$iteration start`.

## 15. Preserving Engineering Learning

Not every finding is debt.

```text
Temporary findings → iteration result
Lasting architectural facts → ARCHITECTURE.md
Reasons for important choices → DECISIONS.md
Future unresolved obligations → deferred.md
```

## 16. A Typical V1

```text
Iteration 1 — Feature Complete
Shared core logic + main Installer/Web/Update code
Defer Windows real-machine validation

↓ Human runs the software and discovers integration issues

Iteration 2 — Integration Complete
Fix reconnect/cancel/lifecycle

↓ Human observes again

Iteration 3 — Platform Validation
Prepare Windows/macOS environments and validate them together

Iteration 4 — Release Candidate
Signing, notarization, upgrade matrix, regression
```

This still aims to “build V1 quickly,” without forcing the first iteration to reach Release Ready.

## 17. Final Principle

> **OMX owns “how to execute one iteration well”; Humans own “what this iteration is and how many more iterations the project needs.”**
