# Team Playbook — AI-Native 迭代式并行研发 v1.0

[English](02-Team-Playbook.md) | 简体中文

> 团队统一工作方式。
> 核心范式：**Human-led Architecture + Human-controlled Iterations + Parallel AI Execution**

## 1. 团队目标

最大化两个杠杆：

### Human Judgment Amplification
AI 帮助研究、比较、批判和整理；Human 保留产品、架构、scope 和关键 trade-off 决策。

### Human Attention Multiplication
架构和迭代边界明确后，多个 Coding Workers 并行实现，Human 不再逐步 pair-program。

## 2. Canonical 生命周期

先按[选择执行 Profile](06-Choosing-an-Execution-Profile.zh-CN.md) 确定执行方式。[Native Codex](../profiles/native-codex/README.zh-CN.md) 和 [OMX-Lite](../profiles/omx-lite/README.zh-CN.md) 是 Canonical Methodology 下的同级实现；OMX Default 是上游基线/参考。

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

## 3. 五层工作模型

| 层级 | Owner | 产物/目标 |
|---|---|---|
| Project | Human | 产品、架构、V1、Release |
| Iteration | Human | 本轮 Goal/Fidelity/Scope |
| Lane | Human + Planner | 可独立并行的 Outcome |
| Task | AI | bounded engineering result |
| Inner Loop | AI | implement/test/fix/verify |

## 4. Human 必须负责

- 产品目标与 V1 scope；
- Architecture 和关键边界；
- Public/shared contract 的重要变化；
- Build vs Buy / 高成本不可逆选择；
- Iteration 目标、fidelity 和 stop boundary；
- Release Gate。

## 5. AI 默认负责

- 局部实现；
- 编译/测试问题；
- 局部重构；
- routine debugging；
- mocks / next-best verification；
- 可逆实现选择；
- 技术债/验证债记录；
- iteration handoff。

## 6. 项目知识必须持久化

推荐项目：

```text
ARCHITECTURE.md
DECISIONS.md
specs/
iterations/
engineering/deferred.md
```

核心知识不得只存在于 Chat History。

## 7. Iteration 原则

一轮只追求一个明确 Fidelity，例如：

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

Iteration Complete 不等于 Release Ready。

## 8. Lane 原则

好的 Lane：

- Outcome 明确；
- Interface 稳定；
- ownership 清晰；
- 可独立实现；
- 可独立验证当前 claim；
- 最好可独立 commit/merge。

默认 3–7 个顶层 Lane；不需要并行时不要为了形式硬拆。

## 9. Dependency 原则

只允许 **Hard Implementation Dependency** blocking。

```text
Without A, B cannot meaningfully begin.
```

以下默认不 blocking：

- preferred order；
- later platform verification；
- manual QA；
- unavailable hardware；
- signing/notarization；
- polish/performance；
- future release checklist。

## 10. Deferred Engineering Memory

`engineering/deferred.md` 记录：

```text
DV Deferred Verification
TD Technical Debt
EG Environment Gap
KR Known Risk
```

它是跨轮 Memory，不是强制 backlog。

每轮相关项重新评估为：

```text
PROMOTE / KEEP-DEFERRED / RESOLVE / OBSOLETE / ESCALATE
```

## 11. Human Gate

AI 只有遇到以下情况才默认停下来找 Human：

1. Architecture change
2. Public/shared contract change
3. Material scope change
4. Irreversible/high-cost decision
5. 当前 Iteration 已被新证据否定

## 12. Verification 原则

验证强度匹配当前 claim。

不要为了“流程完整”把最终平台验证提前变成所有研发的 blocker。

但：

> 可以 defer ≠ 可以伪造通过。

## 13. 执行 Profile 规则

**Methodology > Tooling。** 先明确当前 Iteration 的边界，再选择执行机制。

### Native Codex Profile

采用 Execution Plan → Human-approved Phase ≈ Iteration → bounded Goals。Goal 对应 outcome Lane 或范围明确的 Task。使用 worktrees 隔离，按需使用 native subagents，并明确集成负责人。集成成果、收集匹配当前 claim 的证据、记录结果和 deferred memory，然后 STOP。模板与隔离指引见 [Native Profile](../profiles/native-codex/README.zh-CN.md)。

### OMX-Lite Profile

使用 `$iteration` 和 [policy](../policy/OMX-LITE-POLICY.md)，从下列方式中选择满足需求的最轻执行模式。把 OMX 当作当前 Iteration 的执行器。

### Solo
一个 scoped task/ lane 可由单 Agent 完成。

### `$plan`
当前 iteration 边界清楚，但内部实现分解仍需规划。

### `$ultragoal`
一条较长、需要持久 checkpoint/resume 的执行主线。

### `$team`
多个真正可并行、协调价值明显的 Lane。

原则：

> **Large project ≠ must use Team**

## 14. 每轮标准动作

```text
1. 审视 Reality + Memory，在选定 Profile 中提出 Contract
2. Human approve Iteration Contract
3. 选择最轻执行模式
4. AI execute + local convergence
5. 集成/当前 claim 验证
6. 记录 result + deferred memory；STOP
7. Human 真正运行/观察
8. 下一轮重新规划
```

Native Codex 将批准的 Phase 记录到 Execution Plan 并执行其 bounded Goals。OMX-Lite 的第 1、6 步使用 `$iteration start` 和 `$iteration close`。两者都保留 **Remembered ≠ Scheduled Now** 与 **Iteration Complete ≠ Fully Verified ≠ Release Ready**。

## 15. Release Gate

早期 Iteration 可以带着显式欠账结束。

进入 Release 前，Human 明确哪些必须清零，例如：

```text
Critical DV = 0
P0/P1 bugs = 0
target-platform validation pass
signing/notarization pass
upgrade regression pass
critical security checks pass
```

## 16. Leader 工作界面

Leader 重点关注：

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

不要把主要精力花在 Agent 的普通编译错误和微观 task 状态。

## 17. 团队 Definition of Good Iteration

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
