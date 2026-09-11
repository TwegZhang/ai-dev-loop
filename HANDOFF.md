# HANDOFF — AI Dev Loop v1.1.0

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

## 3. Execution profiles

The three profiles considered in selection are **Native Codex**, **OMX-Lite**, and **OMX Default**. The first two implement AI Dev Loop's canonical methodology; OMX Default is an upstream baseline/reference, not a third implementation maintained here.

```text
AI Dev Loop Canonical Methodology
├── Native Codex Profile
└── OMX-Lite Profile

OMX Default = upstream baseline / reference
```

Native Codex uses ordinary plans, bounded goals, Git worktrees, and one main Codex session coordinating native subagents when available. Human-started independent CLI `/goal` sessions are an optional advanced mode. No custom orchestrator, state machine, DAG, or mailbox is added. Phase ≈ Human-controlled Iteration; Goal ≈ outcome Lane or bounded Task and never replaces the Iteration Contract. Phase review records evidence and memory, then STOP; the next Phase requires Human judgment from refreshed Reality + Memory.

OMX-Lite preserves the existing v1.0 policy, skill modes, templates, and execution guidance. Its host installer still accepts `omx|codex`: `.codex/skills/iteration/` and `.agents/skills/iteration/` respectively. Both install OMX-Lite assets. `codex` does not select Native Codex; existing policy, template, iteration, and memory paths remain compatible.

### OMX-Lite positioning

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
docs/06-Choosing-an-Execution-Profile.md
profiles/native-codex/README.md
profiles/omx-lite/README.md
```

Machine-facing:

```text
policy/OMX-LITE-POLICY.md
templates/*
skills/iteration/*
profiles/native-codex/EXECUTION-PLAN-TEMPLATE.md
profiles/native-codex/GOAL-TEMPLATE.md
```

Validation example:

```text
examples/cross-platform-v1/
profiles/native-codex/examples/
```

### Source of Truth by concern

| Concern | Authoritative source |
|---|---|
| Canonical methodology and Human development model | `docs/03-Project-Development-Guide.md`; `docs/02-Team-Playbook.md` for team application |
| Profile selection and six comparison dimensions | `docs/06-Choosing-an-Execution-Profile.md` |
| Native execution conventions | `profiles/native-codex/README.md` |
| Native planning and bounded Goal fields | `profiles/native-codex/EXECUTION-PLAN-TEMPLATE.md`, `profiles/native-codex/GOAL-TEMPLATE.md` |
| OMX-Lite operating constraints | `policy/OMX-LITE-POLICY.md` |
| OMX-Lite interaction modes and progressive disclosure | `skills/iteration/SKILL.md` and its selected `references/` files |
| Canonical contract, result, and memory schemas | `templates/ITERATION-TEMPLATE.md`, `templates/ITERATION-RESULT-TEMPLATE.md`, `templates/DEFERRED-LEDGER-TEMPLATE.md` |
| Host installation behavior and paths | `scripts/install-into-project.sh`; explanation in `docs/05-Project-Setup.md` |
| Upstream OMX runtime behavior | Installed upstream OMX documentation/runtime; `integrations/OMX.md` is usage guidance, not a replacement specification |
| Current project authorization | The project's single Human-approved Iteration Contract; a Native Phase may embed it or link it |
| Repository artifact language | `CONTRIBUTING.md`, enforced by `scripts/validate-language.sh` and `scripts/test-language-policy.sh` |

English documents are canonical; paired Chinese explanations must remain aligned. Generated plans, goals, contracts, results, and memory remain English. Examples illustrate behavior and do not authorize project work.

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

Compare profile fit and overhead using all six selector dimensions: Human control capability, coordination complexity, environment uncertainty, verification rigidity, desired autonomy, and persistent orchestration state. Compare Native Codex and OMX-Lite at equivalent outcome fidelity; use the selected OMX Default mode only as a clearly identified upstream reference. Test exceptions rather than assuming one profile always wins.

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

Start from the stable v1.0 methodology and the additive v1.1.0 profile architecture in this repository. Preserve Human judgment, hard-dependency rules, safe deferral, truthful evidence, engineering-memory triage, and STOP at every iteration boundary.

Prefer one of:
1. real-project test result;
2. evidence-backed profile-fit or workflow simplification;
3. `$iteration` interaction improvement;
4. better deferred-memory triage;
5. evidence-backed case for an OMX core change.

Do not expand the process unless repeated real usage proves the need.
