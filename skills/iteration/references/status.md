# Status — read-only current iteration view

Use for `$iteration status`.

Do not mutate plans, debt records, or task state.

Inspect:

- current/latest iteration contract;
- current Git/code reality;
- available verification evidence;
- deferred records relevant to this iteration;
- Human observations in the current interaction;
- architecture/public-contract drift;
- genuine hard blockers.

Return:

```text
Iteration:
Fidelity:
Outcome progress:
Verified evidence:
Hard blockers:
Relevant deferred:
Architecture/contract drift:
Human decisions needed:
```

If code reality differs from the written iteration status, state that explicitly.

Do not:
- create tasks;
- promote debt automatically;
- close the iteration;
- plan the next iteration.
