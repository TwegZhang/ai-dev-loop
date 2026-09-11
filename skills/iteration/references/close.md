# Close — persist result and engineering memory

Use for `$iteration close [id|path]`.

Goal: convert one execution pass into trustworthy durable project state, then stop.

## 1. Identify the iteration

Resolve from:

1. explicit ID/path;
2. active marker if the project has one;
3. latest iteration contract without a matching result.

Ask one question only if genuinely ambiguous.

## 2. Build closing reality

Inspect:

- iteration contract;
- relevant commits/diffs/current implementation;
- build/test/verification evidence;
- useful worker handoffs;
- existing deferred memory;
- current Human observations.

Determine:

```text
actually completed
partial/not completed
verified/not verified
architecture/interface changes
assumptions
engineering learning
new/revised debt, gaps, risks
Human decisions
```

Worker self-report is not proof.

## 3. Reconcile memory

Read `references/memory.md`.

Update existing records instead of duplicating the same issue.

For relevant records determine:

```text
promoted?
resolved with evidence?
keep deferred?
trigger/risk changed?
obsolete?
escalated?
```

Add new records only if they have future decision/validation value.

Route lasting architecture facts / decisions to their proper durable docs when appropriate.

## 4. Write result

Create `iterations/iteration-XX-result.md` using `templates/ITERATION-RESULT-TEMPLATE.md` when available.

Required content:

- completed outcomes;
- partial/not completed;
- current system state;
- Human observations incorporated;
- architecture/interface changes;
- verification performed;
- deferred verification;
- technical debt;
- environment gaps;
- known risks;
- assumptions;
- important engineering learning;
- Human decisions;
- advisory inputs for next iteration;
- deferred-memory reconciliation summary.

"Recommended inputs for next iteration" is advisory, **not automatically scheduled backlog**.

## 5. Human closing view

Show concise:

```text
Iteration closed:
Working state:
Verification:
New/updated deferred:
Engineering learning:
Architecture/interface changes:
Human decisions:
Possible next focus:
```

Then stop.

Do not start the next iteration.
