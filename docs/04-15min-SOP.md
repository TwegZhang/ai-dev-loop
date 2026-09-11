# Engineer's 15-Minute Getting-Started SOP v1.0

[English](04-15min-SOP.md) | [&#31616;&#20307;&#20013;&#25991;](04-15min-SOP.zh-CN.md)

## All You Need to Remember

```text
Read Architecture
→ $iteration start
→ Human approves this iteration
→ Execute
→ Verify the current claim
→ $iteration close
→ Human reviews actual results
→ Next iteration
```

## 1. Read First

At minimum:

```text
ARCHITECTURE.md
The current iteration file
policy/OMX-LITE-POLICY.md (or the project's copy)
```

## 2. Start a New Iteration

Run:

```text
$iteration
```

The skill automatically examines:

```text
Current code
Previous iteration result
engineering/deferred.md
Human observation
```

It then recommends the next iteration.

The Human only needs to confirm or adjust the Goal, Fidelity, Scope, and key trade-offs.

## 3. Approve the Contract

Output:

```text
iterations/iteration-XX.md
```

Focus on:

```text
Goal
Fidelity
Lanes
Hard Dependencies
Promoted Carry-over
Continue Deferred
Exit Criteria
```

## 4. Choose an Execution Mode

```text
Single task → solo
Implementation planning needed → $plan
Long execution thread → $ultragoal
Genuinely parallel lanes → $team
```

## 5. During Execution

AI handles routine issues on its own:

```text
compile
test failure
lint
local refactor
routine debug
mock
next-best verification
```

Only these five categories require the Human:

```text
Architecture
Public Contract
Material Scope
Irreversible/High-cost Decision
Iteration Invalidated
```

## 6. Do Not Create Fake Blockers

A Hard Dependency exists only when:

> Without A, B cannot meaningfully begin.

If a Windows machine is not ready but coding can continue:

```text
defer + record + continue
```

## 7. Completion Does Not Mean Release

This is allowed:

```text
Implementation: COMPLETE
Local tests: PASS
Windows validation: DEFERRED
```

Provided the current Fidelity does not require Windows to have been validated.

## 8. Close the Iteration

Run:

```text
$iteration close
```

You get:

```text
iterations/iteration-XX-result.md
engineering/deferred.md (updated)
```

Then stop.

## 9. The Human Runs It Again

Actually use the Working Software and bring new findings into the next iteration's Reality.

## 10. Five Takeaways

1. **Humans control iterations; AI controls execution.**
2. **Use Outcome Lanes, not tiny actions.**
3. **Only Hard Dependencies block progress.**
4. **Deferral is allowed, but must be recorded truthfully.**
5. **Stop when an iteration ends and replan using real feedback.**
