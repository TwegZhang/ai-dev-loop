# 项目开发说明书 — Human Guide v1.0

[English](03-Project-Development-Guide.md) | 简体中文

> 给 Leader、架构师和工程师直接使用。
> 这是一套“Human 控宏观迭代，OMX 控单轮执行”的开发方法。

## 1. 心智模型

```text
Human:
产品 / 架构 / 本轮做到什么程度
                 ↓
$iteration:
Reality → Memory → Judgment → Contract
                 ↓
OMX/Codex:
在本轮边界内严谨执行
                 ↓
$iteration close:
Result + Deferred Memory
                 ↓
STOP
                 ↓
Human:
真实运行 / 观察 / 判断下一轮
```

## 2. 第一次把这套流程接入项目

项目至少应有：

```text
ARCHITECTURE.md
specs/...
```

从本交付包复制：

```text
policy/OMX-LITE-POLICY.md
templates/
skills/iteration/
```

并初始化：

```text
iterations/
engineering/deferred.md
```

详细安装见 `docs/05-Project-Setup.md`。

## 3. `OMX-LITE-POLICY.md` 怎么用

Policy 是稳定团队规则，不是每轮填写文件。

它定义：

- OMX 只负责当前 Iteration；
- global throughput 优先；
- 只有 hard implementation dependency 才 blocking；
- outcome lanes 而非 micro-tasks；
- safe defer + truthful evidence；
- Human Gate；
- iteration boundary 必须停止。

项目 `AGENTS.md` 应引用它。

## 4. `ITERATION-TEMPLATE.md` 怎么用

Template 是 **Human → OMX 的一轮 Contract schema**。

推荐默认由：

```text
$iteration start
```

自动生成。

Human 不需要机械填写全部字段。

Skill 自动读 Repo 和上一轮 Memory，再让 Human 只做判断。

也可以手工复制：

```bash
cp templates/ITERATION-TEMPLATE.md iterations/iteration-01.md
```

## 5. `$iteration start`：四 View

### View 1 — Reality

Skill 自动读取：

- Architecture / Spec；
- 最新代码 / Git；
- 上一轮 Result；
- 当前验证证据；
- 当前 Human 的真实运行观察。

它回答：

> 现在真的是什么状态？

### View 2 — Memory

读取：

```text
previous iteration result
+
engineering/deferred.md
```

对相关遗留项重新建议：

```text
PROMOTE
KEEP-DEFERRED
RESOLVE
OBSOLETE
ESCALATE
```

旧问题不会自动进入下一轮。

### View 3 — Judgment

Skill 先给推荐，再问 Human。

例如：

```text
我建议下一轮做 Integration Complete：
PROMOTE reconnect/cancel；
继续 defer Windows/notarization。
接受还是调整？
```

Human 主要决定：

- priority；
- fidelity；
- scope；
- risk/trade-off。

### View 4 — Contract

确认后写：

```text
iterations/iteration-XX.md
```

这就是本轮执行边界。

## 6. 执行模式怎么选

Contract 批准后：

| 情况 | 使用 |
|---|---|
| 单个清晰 bounded task | solo Codex/OMX |
| 还需把本轮拆成实现步骤 | `$plan` |
| 单条长执行主线 | `$ultragoal` |
| 多个真正并行、值得协调的 Lane | `$team` |

OMX 当前官方也区分轻量 planning、durable execution 与 coordinated team；不需要为了项目“大”而一律 Team。

## 7. 为什么不默认用完整 Autopilot 管整个 V1

本方法已经把：

```text
Architecture
Iteration Definition
Iteration Boundary
```

放回 Human。

因此常规轮次更适合显式选择当前需要的执行 surface，而不是让一个 orchestrator 从当前状态一路扩张到 Release。

## 8. Agent 工作到什么程度可以停

看当前 Iteration Fidelity。

例如 `Feature Complete`：

```text
Implementation: complete
Local build/tests: pass
Windows real-machine validation: deferred
Release readiness: not assessed
```

可能已经满足本轮。

不要把 Release Candidate 的证据要求提前套给 Feature Complete。

## 9. 什么可以 defer

如果不会让当前 claim 失真，也不会产生不可接受架构/正确性风险，可以 defer，例如：

- Windows/macOS 真机环境尚未准备；
- notarization/signing；
- full upgrade matrix；
- 企业网络验证；
- performance benchmark；
- 后期 manual QA。

必须记录到：

```text
engineering/deferred.md
```

## 10. `deferred.md` 怎么用

它不是 TODO 列表，而是 Engineering Memory。

例：

```text
DV-001 Windows clean install
Status: Deferred
Blocking current development: No
Required before: Release Candidate
Suggested trigger: Platform Validation
```

到了 Platform Validation 轮次，`$iteration` 会重新看到 trigger，建议 PROMOTE。

## 11. `$iteration status`

只读检查：

```text
$iteration status
```

它回答：

- 当前 iteration/fidelity；
- outcome progress；
- verification evidence；
- genuine hard blockers；
- relevant deferred；
- architecture drift；
- Human decisions。

不自动改计划。

## 12. `$iteration review`

当 OMX 的计划开始机械化时：

```text
$iteration review
```

重点检查：

- Lane 是否过细；
- 是否产生 fake dependencies；
- 是否把后期 validation 提前变 blocker；
- fidelity 和 evidence 是否错位；
- 有没有忽略 carry-over memory；
- stop boundary 是否消失。

## 13. `$iteration close`

本轮达到 Exit Criteria 后：

```text
$iteration close
```

它做两件最重要的事：

### 产出 Event Memory

```text
iterations/iteration-XX-result.md
```

记录这一轮真正发生了什么。

### 更新 Persistent Engineering Memory

```text
engineering/deferred.md
```

记录仍需未来面对的事情。

然后：

> **STOP，不自动启动下一轮。**

## 14. Human close 后做什么

Human 真正运行/体验系统：

```text
Working Software
    ↓
真实观察
    ↓
看 Result + Deferred
    ↓
决定下一轮
```

当前 Human observation 会成为下次 `$iteration start` 的 Reality 输入。

## 15. Engineering Learning 怎么保存

不是所有发现都是 debt。

```text
临时发现 → iteration result
长期架构事实 → ARCHITECTURE.md
重要选择原因 → DECISIONS.md
未来 unresolved obligation → deferred.md
```

## 16. 一个典型 V1

```text
Iteration 1 — Feature Complete
共享核心逻辑 + Installer/Web/Update 主代码
Windows 真机验证 defer

↓ Human 跑起来发现 integration 问题

Iteration 2 — Integration Complete
修 reconnect/cancel/lifecycle

↓ Human 再观察

Iteration 3 — Platform Validation
集中准备 Windows/macOS 环境并验证

Iteration 4 — Release Candidate
签名、公证、升级矩阵、回归
```

同样是“快速把 V1 做出来”，但不是强迫第一轮就达到 Release Ready。

## 17. 最终原则

> **OMX 管“一轮如何执行好”；Human 管“这一轮是什么、项目还需要跑几轮”。**
