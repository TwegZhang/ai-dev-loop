# 工程师 15 分钟上手 SOP v1.0

[English](04-15min-SOP.md) | 简体中文

## 你只需要记住

```text
读 Architecture
→ $iteration start
→ Human 批准本轮
→ 执行
→ 验证当前 claim
→ $iteration close
→ Human 看真实结果
→ 下一轮
```

## 1. 先读

至少：

```text
ARCHITECTURE.md
当前 iteration 文件
policy/OMX-LITE-POLICY.md（或项目副本）
```

## 2. 新一轮

运行：

```text
$iteration
```

Skill 会自动看：

```text
当前代码
上一轮 result
engineering/deferred.md
Human observation
```

然后推荐下一轮。

Human 只需要确认/修改 Goal、Fidelity、Scope 和关键取舍。

## 3. 批准 Contract

输出：

```text
iterations/iteration-XX.md
```

重点看：

```text
Goal
Fidelity
Lanes
Hard Dependencies
Promoted Carry-over
Continue Deferred
Exit Criteria
```

## 4. 选择执行模式

```text
单任务 → solo
需要实现规划 → $plan
长主线 → $ultragoal
真正并行 lanes → $team
```

## 5. 执行时

普通问题 AI 自己解决：

```text
compile
test failure
lint
local refactor
routine debug
mock
next-best verification
```

只有这五类找 Human：

```text
Architecture
Public Contract
Material Scope
Irreversible/High-cost Decision
Iteration Invalidated
```

## 6. 不要制造假 blocker

只有：

> 没有 A，B 无法有意义开始

才是 Hard Dependency。

Windows 真机没准备，但代码能继续：

```text
defer + record + continue
```

## 7. 完成不是 Release

允许：

```text
Implementation: COMPLETE
Local tests: PASS
Windows validation: DEFERRED
```

前提是当前 Fidelity 不要求 Windows 已验证。

## 8. 本轮结束

运行：

```text
$iteration close
```

得到：

```text
iterations/iteration-XX-result.md
engineering/deferred.md（更新）
```

然后停止。

## 9. Human 再跑一遍

真正使用 Working Software，把新发现作为下一轮 Reality。

## 10. 五句话

1. **Human 控迭代，AI 控执行。**
2. **Outcome Lane，不拆微动作。**
3. **只有 Hard Dependency 才阻塞。**
4. **可以 defer，但必须诚实记录。**
5. **一轮结束就停，用真实反馈重新规划。**
