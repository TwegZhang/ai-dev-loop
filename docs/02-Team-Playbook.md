# Team Playbook — AI-Native Iterative Parallel Development v1.0

[English](02-Team-Playbook.md) | [&#31616;&#20307;&#20013;&#25991;](02-Team-Playbook.zh-CN.md)

> A shared way of working for the team.
> Core paradigm: **Human-led Architecture + Human-controlled Iterations + Parallel AI Execution**

## 1. Team Goals

Maximize two sources of leverage:

### Human Judgment Amplification
AI helps research, compare, critique, and organize; Humans retain decisions about product, architecture, scope, and key trade-offs.

### Human Attention Multiplication
Once architecture and iteration boundaries are clear, multiple coding workers implement in parallel, and Humans no longer pair-program through every step.

## 2. Canonical Lifecycle

Select an execution profile first using [Choosing an Execution Profile](06-Choosing-an-Execution-Profile.md). [Native Codex](../profiles/native-codex/README.md) and [OMX-Lite](../profiles/omx-lite/README.md) are sibling implementations of the Canonical Methodology; OMX Default is an upstream baseline/reference.

```text
Product / Architecture
       ↓
Human defines Iteration
       ↓
Reality → Memory → Judgment → Contract
       ↓
Execution inside the selected profile
       ↓
Working Software + Evidence
       ↓
Close the approved iteration
       ↓
Result + Deferred Engineering Memory
       ↓
STOP
       ↓
Human run / observe / replan
       ↓
Next Iteration
       ↓
...
       ↓
Release Gate
```

## 3. Five-Layer Working Model

| Layer | Owner | Artifact / Goal |
|---|---|---|
| Project | Human | Product, architecture, V1, Release |
| Iteration | Human | Goal/Fidelity/Scope for the current iteration |
| Lane | Human + Planner | An independently parallelizable Outcome |
| Task | AI | bounded engineering result |
| Inner Loop | AI | implement/test/fix/verify |

## 4. Human Responsibilities

- Product goals and V1 scope;
- Architecture and key boundaries;
- Important changes to public/shared contracts;
- Build vs Buy / high-cost, irreversible choices;
- Iteration goal, fidelity, and stop boundary;
- Release Gate.

## 5. AI Responsibilities by Default

- Local implementation;
- Build and test issues;
- Local refactoring;
- Routine debugging;
- Mocks / next-best verification;
- Reversible implementation choices;
- Recording technical debt and verification debt;
- Iteration handoff.

## 6. Persist Project Knowledge

Recommended project artifacts:

```text
ARCHITECTURE.md
DECISIONS.md
specs/
iterations/
engineering/deferred.md
```

Core knowledge must not exist only in chat history.

## 7. Iteration Principles

Each iteration pursues one clear Fidelity, for example:

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

Iteration Complete does not mean Release Ready.

## 8. Lane Principles

A good lane has:

- A clear Outcome;
- A stable Interface;
- Clear ownership;
- Independently implementable work;
- Independent verification of the current claim;
- Ideally, the ability to commit/merge independently.

Default to 3–7 top-level lanes; do not split work merely for formality when parallelism is unnecessary.

## 9. Dependency Principles

Only a **Hard Implementation Dependency** may block work.

```text
Without A, B cannot meaningfully begin.
```

The following are non-blocking by default:

- Preferred order;
- Later platform verification;
- Manual QA;
- Unavailable hardware;
- Signing/notarization;
- Polish/performance;
- Future release checklist.

## 10. Deferred Engineering Memory

`engineering/deferred.md` records:

```text
DV Deferred Verification
TD Technical Debt
EG Environment Gap
KR Known Risk
```

It is memory across iterations, not a mandatory backlog.

Reassess relevant items in each iteration as:

```text
PROMOTE / KEEP-DEFERRED / RESOLVE / OBSOLETE / ESCALATE
```

## 11. Human Gate

By default, AI pauses to consult the Human only when it encounters:

1. Architecture change
2. Public/shared contract change
3. Material scope change
4. Irreversible/high-cost decision
5. New evidence that invalidates the current Iteration

## 12. Verification Principles

Match verification strength to the current claim.

Do not bring final platform validation forward and make it a blocker for all development merely for "process completeness."

However:

> Permission to defer ≠ permission to fabricate a pass.

## 13. Execution Profile Rules

**Methodology > Tooling.** Select mechanics after agreeing on the current Iteration's boundary.

### Native Codex Profile

Use an Execution Plan → Human-approved Phase ≈ Iteration → bounded Goals. A Goal maps to an outcome Lane or bounded Task. Use worktrees for isolation and native subagents when useful; name the integration owner. Integrate outcomes, collect claim-matched evidence, record the result and deferred memory, then STOP. See the [Native profile](../profiles/native-codex/README.md) for templates and isolation guidance.

### OMX-Lite Profile

Use `$iteration` and the [policy](../policy/OMX-LITE-POLICY.md), selecting the lightest execution mode below. Treat OMX as the executor for the current Iteration.

### Solo
One agent can complete a scoped task/lane.

### `$plan`
The current iteration's boundaries are clear, but its internal implementation breakdown still needs planning.

### `$ultragoal`
A longer execution track that needs durable checkpoint/resume.

### `$team`
Multiple truly parallelizable lanes where coordination provides clear value.

Principle:

> **Large project ≠ must use Team**

## 14. Standard Actions for Each Iteration

```text
1. Review Reality + Memory and propose a Contract in the selected profile
2. Human approve Iteration Contract
3. Select the lightest execution mode
4. AI execute + local convergence
5. Integrate / verify the current claim
6. Record result + deferred memory; STOP
7. Human actually run / observe
8. Replan for the next iteration
```

For Native Codex, capture the approved Phase in the Execution Plan and execute its bounded Goals. For OMX-Lite, steps 1 and 6 use `$iteration start` and `$iteration close`. Both preserve **Remembered ≠ Scheduled Now** and **Iteration Complete ≠ Fully Verified ≠ Release Ready**.

## 15. Release Gate

Early iterations may end with explicitly recorded debt.

Before release, the Human specifies which items must be cleared, for example:

```text
Critical DV = 0
P0/P1 bugs = 0
target-platform validation pass
signing/notarization pass
upgrade regression pass
critical security checks pass
```

## 16. The Leader's Working Interface

The leader focuses on:

```text
Architecture
Iteration Goal / Fidelity
Lane progress
Hard blockers
Architecture drift
Deferred growth
Evidence
Human decisions
```

Do not spend most of your attention on agents' routine compilation errors or detailed task statuses.

## 17. The Team's Definition of a Good Iteration

```text
Clear Outcome
+ High Throughput
+ Architecture Preserved
+ Claim-matched Evidence
+ Honest Deferred Memory
+ Working Software
+ Better Human Information
= Good Iteration
```
