# AI-Native Iterative Parallel Development: Methodology and Industry Practice Research Report

[English](01-Research-Report.md) | [&#31616;&#20307;&#20013;&#25991;](01-Research-Report.zh-CN.md)

> Version: v1.0
> Core paradigm: **Human-led Architecture + Human-controlled Iterations + AI Parallel Execution**

## 1. Conclusions

The methodology of AI coding is evolving from "having AI write code" toward:

```text
Human Intent
   ↓
Architecture / Spec
   ↓
Human-controlled Iteration
   ↓
Parallel AI Execution
   ↓
Evidence / Working Software
   ↓
Human Observation + Judgment
   ↓
Next Iteration
```

The key concerns now extend beyond prompts:

- Context: what AI knows at this moment;
- Spec: how Human Intent is made durable;
- Loop: how a local task keeps converging;
- Verification: what evidence supports the current claim;
- Parallelism: which work can safely run in parallel;
- Iteration: when the project stops executing and returns to Human judgment.

## 2. Methodological Evolution

```text
Code Completion
→ Prompt Engineering
→ Conversational / Vibe Coding
→ Execution Loop
→ Context Engineering
→ Spec-driven Development
→ Verification / Convergence
→ Parallel AI Development
→ Adaptive Human-controlled Iterations
```

These stages build on one another rather than replace one another.

### 2.1 The Prompt Era

Natural language became a development interface, but complex projects quickly exposed its limits: better-written prompts cannot solve long-term context, architecture drift, cross-session memory, verification, or integration.

### 2.2 Vibe Coding

Humans shifted from implementing line by line to describing the desired effect, observing results, and requesting further changes. This greatly reduces the cost of prototypes, but large projects are prone to conversation context drift, fixes that break other behavior, and locally correct results that lose overall coherence.

### 2.3 Loop / Convergence

Mature practice no longer expects a correct result in a single generation. Instead, it follows:

```text
Inspect → Implement → Run/Test → Observe → Fix ↺
```

The evaluation criterion shifts from One-shot Quality to **Convergence Ability**.

### 2.4 Context / Spec

Project knowledge starts moving out of people's heads and chats into:

```text
PRODUCT.md
ARCHITECTURE.md
DECISIONS.md
specs/
tests/
```

The value of a spec is not "writing more documentation." It turns intent into a durable control surface that can be versioned and restored by a new AI session.

### 2.5 Verification

As AI makes code generation cheaper, the scarce resource becomes:

> How do we prove that the implementation actually satisfies the current claim?

Builds, tests, contract checks, integration flows, and feedback from real execution therefore become the agent's external Ground Truth.

### 2.6 Parallel AI Development

Once a coding agent can carry a substantial task through to completion, the next bottleneck becomes the human's sequential attention.

This leads to:

```text
             Human
               │
        Architecture / Plan
               │
      ┌────────┼────────┐
      ▼        ▼        ▼
   Lane A    Lane B    Lane C
      │        │        │
   Worker    Worker    Worker
      └────────┼────────┘
               ▼
           Integration
```

## 3. Why an Iteration Layer Is Still Needed

Breaking V1 into many tasks and executing all of them in one uninterrupted run introduces a new failure mode: **Over-orchestration**.

Real development involves:

- Temporarily unavailable platform environments;
- Verification that should be concentrated in later stages;
- Problems that emerge only when the new code first runs as a whole;
- Technical debt that can be explicitly accepted for a time;
- Engineering facts that cannot all be predicted accurately in advance.

Therefore:

```text
Plan ≠ rigid execution script
Plan = current best navigation map
```

The project must allow:

```text
Iteration 1 → Working Software → Human Observation
→ Iteration 2 → New Evidence → Human Judgment
→ Iteration 3 → ...
```

The purpose of iteration is not to copy Scrum ceremonies, but to adopt the central idea of agile development:

> **Working software + feedback + adaptive replanning**

As AI shortens implementation cycles, an iteration may last hours, a day, or several days; it need not be a fixed two-week sprint.

## 4. Keep the Two Loops Separate

### Project-level Iteration

The Human controls:

> How far should the whole project progress in this iteration?

For example:

```text
Feature Complete
Integration Complete
Platform Validation
Hardening
Release Candidate
```

### Task-level Inner Loop

The agent controls:

```text
Inspect → Implement → Test → Fix ↺
```

This is the Ralph-style idea of local convergence.

**Do not turn all of V1 into one giant Ralph loop.**

## 5. The Canonical Five-Layer Model

```text
PROJECT
│  Human: product / architecture / release
▼
ITERATION
│  Human: goal / fidelity / priority / stop boundary
▼
LANE
│  Human + planner: parallelizable outcome
▼
TASK
│  AI: bounded engineering result
▼
INNER LOOP
   AI: implement / test / fix / verify
```

## 6. Four Views: The Human Judgment Interface for an Iteration

Starting an iteration should not require the Human to fill out a lengthy questionnaire.

Iteration planning should follow:

```text
VIEW 1 — REALITY
What is the actual state of the code, evidence, and real execution?

VIEW 2 — MEMORY
What technical debt, verification debt, environment gaps, and risks remain from the previous iteration?

VIEW 3 — JUDGMENT
Given Reality + Memory, what is most worth doing now in the Human's judgment?

VIEW 4 — CONTRACT
Turn Human judgment into an execution contract for the current iteration.
```

The core principle:

> **Repo-first, Memory-first, Propose-first, Ask-second.**

AI gathers facts automatically, leaving priorities, scope, fidelity, and important trade-offs to Human judgment.

## 7. Engineering Memory Across Iterations

The previous iteration's output must become the next iteration's input, without creating "Backlog Gravity."

```text
Iteration Result
+
Deferred Engineering Memory
       ↓
Reassess in the next iteration
```

Existing items may be:

```text
PROMOTE
KEEP-DEFERRED
RESOLVE
OBSOLETE
ESCALATE
```

Therefore:

> **Remembered ≠ Scheduled Now**

This is a key distinction between agile iteration and a rigid task workflow.

## 8. Architecture as a Concurrency Control Mechanism

In Parallel AI Development:

```text
Architecture Boundary = Parallel Boundary
Interface Contract     = Synchronization Boundary
Git Worktree           = Isolation Boundary
Tests / Evidence       = Correctness Boundary
Git Merge / PR         = Convergence Mechanism
```

An ideal lane has this property:

> Agent A can complete A correctly without knowing exactly how Agent B is implementing B at that moment.

## 9. "Done" Must Be Layered

```text
Iteration Complete
≠ Implementation Fully Verified
≠ Release Ready
```

A feature may have the following status:

```text
Implementation: COMPLETE
Local Verification: PASS
Windows Validation: DEFERRED
Release Readiness: NOT ASSESSED
```

This is a valid state as long as the current iteration's fidelity allows it.

## 10. Verification Debt and Technical Debt

Real development allows debt, but it must be explicit.

Suggested categories:

```text
DV — Deferred Verification
TD — Technical Debt
EG — Environment Gap
KR — Known Risk
```

Important fields:

```text
Blocking current development
Required before
Suggested trigger
Evidence
Last reviewed in
```

"Physical Windows hardware is temporarily unavailable" can be deferred during Feature Complete. Once the project enters Platform Validation and the trigger is reached, it should be reassessed and may need to be classified as PROMOTE.

## 11. The Changing Human Role

```text
Programmer
→ Prompt Writer
→ Vibe Director
→ Context Designer
→ Architect
→ Iteration Controller
→ Parallel Work Director
→ Engineering Leader
```

High-value Human work centers on:

- Intent;
- Architecture;
- Scope;
- Trade-off;
- Iteration boundaries;
- Verification claims;
- Final accountability.

## 12. Execution Profiles: Methodology > Tooling

The Canonical Methodology has two sibling execution profiles: [Native Codex](../profiles/native-codex/README.md) and [OMX-Lite](../profiles/omx-lite/README.md). They preserve the five layers and four Views above. OMX Default is the upstream baseline/reference, not a third methodology.

| Surface | Execution approach | Trade-off |
|---|---|---|
| Native Codex Profile | Execution Plan → Phase ≈ Iteration → bounded Goals → worktrees/subagents when useful → integration/evidence → STOP | Less orchestration overhead; the main session and Human must keep boundaries, integration, and memory explicit |
| OMX-Lite Profile | `$iteration` + policy, then solo / `$plan` / `$ultragoal` / `$team` as needed, then close and STOP | Explicit iteration artifacts and selected runtime coordination, with installation and state-management overhead |
| OMX Default reference | Selected upstream workflow and its own operating contract | Capabilities, checkpoints, and persistence depend on the mode and installed version; assess their fit rather than assuming this repository's policy applies |

A Native Goal maps to an outcome Lane or bounded Task; it does not replace the Human-controlled Iteration. OMX-Lite positions the chosen OMX tools as an Iteration Execution Coordinator. Neither profile hands the whole path to Release to an unbounded execution loop.

See [Choosing an Execution Profile](06-Choosing-an-Execution-Profile.md) for selection criteria and [OMX integration](../integrations/OMX.md) for upstream context. This comparison describes this repository's intended usage, not every upstream mode's behavior.

## 13. Areas of Strong Consensus

1. Prompting is a foundational capability, not the central control surface.
2. Intent, architecture, and decisions should be persisted in the repository.
3. Large goals should be split into bounded outcomes rather than a giant prompt.
4. Parallel work requires code and context isolation.
5. An agent declaring itself Done cannot substitute for evidence.
6. Humans should step out of the ordinary implementation inner loop.
7. Architecture boundaries should determine the degree of parallelism; more is not inherently better.
8. Projects need feedback-driven replanning rather than a single prediction of the entire path.

## 14. Questions Still Evolving

- How much task decomposition should Humans and AI each own?
- How much should workers communicate with one another?
- What level of detail is best for a spec?
- Which verification can be deferred, and which must be completed now?
- What iteration length works best?
- How can a deferred ledger avoid becoming a permanent graveyard of debt?

These questions should be answered gradually with data from real projects, rather than by designing a vast process system first.

## 15. Methodology Summary

The resulting model:

```text
Human Intent / Architecture
          ↓
   Iteration Planning
 Reality + Memory + Judgment
          ↓
   Bounded Contract
          ↓
 Parallel AI Execution
          ↓
 Evidence / Working Software
          ↓
 Result + Engineering Memory
          ↓
          STOP
          ↓
 Human Observe / Replan
```

In one sentence:

> **Humans control direction and iteration boundaries; AI executes quickly and in parallel within those boundaries. Working software and engineering memory continually produce new evidence that Humans use to decide the next iteration.**

## References

- OpenAI Codex Skills documentation: https://developers.openai.com/codex/skills
- Oh My Codex repository: https://github.com/Yeachan-Heo/oh-my-codex
- OMX current workflow guidance: https://github.com/Yeachan-Heo/oh-my-codex/blob/main/templates/AGENTS.md
- GitHub Spec Kit: https://github.com/github/spec-kit
- Agile Manifesto principles: https://agilemanifesto.org/principles.html
