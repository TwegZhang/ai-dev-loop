# AI-Native 迭代式并行研发：方法论与行业实践研究报告

[English](01-Research-Report.md) | 简体中文

> 版本：v1.0
> 核心范式：**Human-led Architecture + Human-controlled Iterations + AI Parallel Execution**

## 1. 结论

AI Coding 的方法论正在从“让 AI 写代码”演进为：

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

关键不再只是 Prompt，而是：

- Context：AI 此刻知道什么；
- Spec：Human Intent 如何持久化；
- Loop：局部任务如何持续收敛；
- Verification：什么证据说明当前 claim 成立；
- Parallelism：哪些工作能安全并行；
- Iteration：项目何时停止执行、回到 Human 重新判断。

## 2. 方法论演进

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

这些阶段不是互相替代，而是逐层叠加。

### 2.1 Prompt 时代

自然语言成为开发接口，但复杂项目很快暴露出：Prompt 写得更漂亮不能解决长期上下文、架构漂移、跨 session 记忆、验证和集成问题。

### 2.2 Vibe Coding

Human 从逐行实现转向描述效果、观察结果、继续修改。它大幅降低 Prototype 成本，但大型项目容易出现聊天上下文漂移、修 A 坏 B、局部正确但全局失控。

### 2.3 Loop / Convergence

成熟实践不再要求一次生成正确，而是：

```text
Inspect → Implement → Run/Test → Observe → Fix ↺
```

评价指标从 One-shot Quality 转向 **Convergence Ability**。

### 2.4 Context / Spec

项目知识开始从 Human 脑中和 Chat 中外化为：

```text
PRODUCT.md
ARCHITECTURE.md
DECISIONS.md
specs/
tests/
```

Spec 的价值不是“写更多文档”，而是把 Intent 变成可版本控制、可被新 AI session 恢复的持久控制面。

### 2.5 Verification

AI 让代码生成变便宜后，稀缺资源转向：

> 如何证明实现真的满足当前 claim？

因此 build、tests、contract checks、integration flow 和真实运行反馈成为 Agent 的外部 Ground Truth。

### 2.6 Parallel AI Development

当一个 Coding Agent 已能连续完成较大任务，下一个瓶颈变成 Human 的串行注意力。

因此出现：

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

## 3. 为什么还需要 Iteration 层

只把 V1 拆成大量任务并一次性执行到底，会产生一个新的失败模式：**Over-orchestration**。

真实研发存在：

- 平台环境暂时不可用；
- 某些验证应该集中到后期；
- 新代码第一次整体跑起来后才暴露真正问题；
- 技术债可以被显式接受一段时间；
- 计划无法提前精确预测所有工程事实。

因此：

```text
Plan ≠ rigid execution script
Plan = current best navigation map
```

项目必须允许：

```text
Iteration 1 → Working Software → Human Observation
→ Iteration 2 → New Evidence → Human Judgment
→ Iteration 3 → ...
```

Iteration 的目的不是复制 Scrum ceremony，而是借用敏捷最核心的思想：

> **Working software + feedback + adaptive replanning**

AI 把实现周期缩短后，一轮可能是几小时、一天或数天，而不必是固定两周 Sprint。

## 4. 两种循环必须分开

### 项目级 Iteration

Human 控制：

> 这一轮整个项目做到什么程度？

例如：

```text
Feature Complete
Integration Complete
Platform Validation
Hardening
Release Candidate
```

### 任务级 Inner Loop

Agent 控制：

```text
Inspect → Implement → Test → Fix ↺
```

这是 Ralph-style 的局部收敛思想。

**不能把整个 V1 变成一个巨大 Ralph loop。**

## 5. Canonical 五层模型

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

## 6. 四 View：Iteration 的 Human Judgment Interface

每轮开始不应该让 Human 手填一大份问卷。

Iteration planning 应该是：

```text
VIEW 1 — REALITY
当前代码、证据、真实运行到底是什么状态？

VIEW 2 — MEMORY
上一轮留下哪些技术债、验证债、环境缺口和风险？

VIEW 3 — JUDGMENT
基于 Reality + Memory，Human 现在最值得做什么？

VIEW 4 — CONTRACT
把 Human 判断转成当前一轮的执行契约。
```

核心原则：

> **Repo-first, Memory-first, Propose-first, Ask-second.**

AI 自动获取事实，只把优先级、scope、fidelity 和重要 trade-off 留给 Human 判断。

## 7. 跨 Iteration Engineering Memory

上一轮输出必须成为下一轮输入，但不能产生“Backlog Gravity”。

```text
Iteration Result
+
Deferred Engineering Memory
       ↓
下一轮重新评估
```

旧事项可能：

```text
PROMOTE
KEEP-DEFERRED
RESOLVE
OBSOLETE
ESCALATE
```

因此：

> **Remembered ≠ Scheduled Now**

这是敏捷迭代和严格任务工作流的关键区别。

## 8. Architecture 是并发控制机制

在 Parallel AI Development 中：

```text
Architecture Boundary = Parallel Boundary
Interface Contract     = Synchronization Boundary
Git Worktree           = Isolation Boundary
Tests / Evidence       = Correctness Boundary
Git Merge / PR         = Convergence Mechanism
```

理想 Lane 的特征：

> Agent A 不知道 Agent B 此刻具体怎么实现，也能正确完成 A。

## 9. “Done” 必须分层

```text
Iteration Complete
≠ Implementation Fully Verified
≠ Release Ready
```

一个功能可能是：

```text
Implementation: COMPLETE
Local Verification: PASS
Windows Validation: DEFERRED
Release Readiness: NOT ASSESSED
```

只要当前 iteration 的 fidelity 允许，这就是合法状态。

## 10. Verification Debt 与 Technical Debt

真实开发允许欠债，但必须显式化。

建议：

```text
DV — Deferred Verification
TD — Technical Debt
EG — Environment Gap
KR — Known Risk
```

重要字段：

```text
Blocking current development
Required before
Suggested trigger
Evidence
Last reviewed in
```

“Windows 真机暂时不可用”可以在 Feature Complete 阶段 defer，但进入 Platform Validation 后其 trigger 到达，就应被重新评估甚至 PROMOTE。

## 11. Human 的角色变化

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

Human 的高价值工作集中在：

- Intent；
- Architecture；
- Scope；
- Trade-off；
- Iteration boundaries；
- Verification claims；
- Final accountability。

## 12. OMX 在本方法中的位置

OMX 很适合提供：

- planning；
- durable execution；
- team/worktree execution；
- runtime state / resume；
- verification support。

但不应要求 OMX 管理从当前状态一直到最终 Release 的完整 lifecycle。

本方法把它定位为：

> **Iteration Execution Coordinator**

每轮 Human 定义边界，再按需要使用：

```text
solo
$plan
$ultragoal
$team
```

OMX 当前也明确区分轻量 planning、durable execution、parallel team，并提醒不应为了大项目本身而默认过度使用协调型 workflow。

## 13. 已形成的强共识

1. Prompt 是基础能力，不是核心控制面。
2. Intent / architecture / decisions 应持久化到 repo。
3. 大目标要拆 bounded outcomes，而非 giant prompt。
4. 并行工作需要代码/上下文隔离。
5. Agent 自称 Done 不能代替 evidence。
6. Human 应退出普通实现 inner loop。
7. 并行数量应由架构边界决定，而不是越多越好。
8. 项目需要反馈驱动的 replanning，而非一次预测到底。

## 14. 仍在演化的问题

- Human 和 AI 各负责多少任务拆解？
- 多 worker 应该互相通信多少？
- Spec 的最佳详细程度是多少？
- 哪些验证可以 defer，哪些必须当前完成？
- Iteration 多长最合适？
- 如何防止 deferred ledger 变成永久债务坟场？

这些问题应通过真实项目数据逐步回答，而不是先设计一套巨大流程系统。

## 15. 方法论总结

最终模型：

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

一句话：

> **Human 控制方向和迭代边界，AI 在边界内并行快速执行；Working Software 和工程记忆不断产生新证据，Human 再据此决定下一轮。**

## 参考资料

- OpenAI Codex Skills documentation: https://developers.openai.com/codex/skills
- Oh My Codex repository: https://github.com/Yeachan-Heo/oh-my-codex
- OMX current workflow guidance: https://github.com/Yeachan-Heo/oh-my-codex/blob/main/templates/AGENTS.md
- GitHub Spec Kit: https://github.com/github/spec-kit
- Agile Manifesto principles: https://agilemanifesto.org/principles.html
