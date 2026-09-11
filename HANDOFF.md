# HANDOFF — AI Dev Loop v1.0

## 1. Current thesis

The research has converged on:

> **Human-led Architecture + Human-controlled Iterations + Parallel AI Execution**

The target is not maximum Agent autonomy. It is:

```text
Human Judgment Amplification
+
Human Attention Multiplication
```

## 2. What is now considered stable

### Canonical levels

```text
Project → Iteration → Lane → Task → Inner Loop
```

### Iteration planning views

```text
Reality → Memory → Human Judgment → Contract
```

### Cross-iteration loop

```text
Iteration Contract
→ Execution
→ Working Software / Evidence
→ Iteration Result
→ Deferred Engineering Memory
→ Human Observation
→ Next Iteration
```

### Key semantics

```text
Iteration Complete ≠ Fully Verified ≠ Release Ready
Remembered ≠ Scheduled Now
```

Only hard implementation dependencies block.

## 3. OMX positioning

OMX is used as an **Iteration Execution Coordinator**, not as a full project lifecycle owner.

Use its execution surfaces selectively:

```text
solo
$plan
$ultragoal
$team
```

Do not default to Team simply because the overall project is large.

Do not attempt to make one giant task DAG from today's code to final release.

## 4. Main artifacts

Human-facing:

```text
docs/01-Research-Report.md
docs/02-Team-Playbook.md
docs/03-Project-Development-Guide.md
docs/04-15min-SOP.md
docs/05-Project-Setup.md
```

Machine-facing:

```text
policy/OMX-LITE-POLICY.md
templates/*
skills/iteration/*
```

Validation example:

```text
examples/cross-platform-v1/
```

## 5. `$iteration` skill

The skill is intentionally thin and progressively disclosed.

Modes:

```text
$iteration start
$iteration status
$iteration review
$iteration close
```

The start path implements the four Views.

The close path creates an evidence-backed result and reconciles Engineering Memory.

## 6. Engineering Memory

`deferred.md` is not a backlog.

Records:

```text
DV / TD / EG / KR
```

are re-evaluated each relevant iteration:

```text
PROMOTE / KEEP-DEFERRED / RESOLVE / OBSOLETE / ESCALATE
```

Important engineering learnings are routed to Architecture/Decisions rather than dumped into deferred memory.

## 7. What not to reopen without evidence

Do not restart generic research on:
- Prompt engineering;
- generic multi-agent frameworks;
- full autonomy as the goal;
- building a custom orchestration platform before real-project evidence.

Do not reintroduce:
- a huge whole-V1 task DAG;
- verification-as-universal-blocker;
- automatic backlog inheritance;
- Human approval for routine reversible engineering.

## 8. Next phase: real-project validation

Use 2–3 active projects.

Track:

- time from iteration approval to working output;
- number of top-level lanes;
- Human interruptions;
- hard vs fake blockers;
- deferred items created/promoted/resolved;
- architecture drift;
- task/coordination overhead;
- verification claims that failed later evidence;
- merge/integration rework;
- Human time per unit of useful project progress.

## 9. Decision rule for modifying OMX itself

Stay on usage-layer adaptation while the workflow can be expressed through:

```text
Policy + Iteration Contract + Skill
```

Only consider OMX code changes when repeated real cases show hard runtime/state-machine semantics that cannot be avoided through these interfaces.

## 10. Next session instruction

Start from the v1.0 model and evidence in this repository.

Prefer one of:
1. real-project test result;
2. workflow simplification;
3. `$iteration` interaction improvement;
4. better deferred-memory triage;
5. evidence-backed case for an OMX core change.

Do not expand the process unless repeated real usage proves the need.
