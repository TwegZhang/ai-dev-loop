# AI Dev Loop

[English](README.md) | 简体中文

> **由人主导、迭代推进、借助 AI 编码代理并行开展的软件开发。**

AI Dev Loop 是一套面向真实软件项目、使用 Coding Agents（编码代理）的轻量级开发工作流。

它适合希望做到以下几点的团队：

- 让产品和架构决策始终由人主导；
- 使用 AI Coding Agents 高效完成实现工作；
- 并行推进工作，同时避免让项目变成过度编排的任务机器；
- 延后不阻塞当前工作的验证与技术债处理，同时持续跟踪它们；
- 不断将可运行的软件转化为下一轮开发的新证据。

它**不是** Agent 框架，不是 Git 的替代品，不是一套新的 Scrum 方法论，也不是 OMX 的分支。

---

## 核心循环

```text
Human Architecture / Product Direction
                ↓
        Human-controlled Iteration
                ↓
     Reality → Memory → Judgment → Contract
                ↓
        AI / OMX / Codex Execution
                ↓
        Working Software + Evidence
                ↓
   Iteration Result + Engineering Memory
                ↓
               STOP
                ↓
       Human Observe / Replan
                ↓
          Next Iteration
```

人确定架构与产品方向，控制迭代边界；结合现实、记忆和判断形成约定后，由 AI / OMX / Codex 执行，产出可运行的软件与证据，沉淀迭代结果和工程记忆。随后停止，由人观察、重新规划，再进入下一轮迭代。

以下两个区分至关重要：

```text
Iteration Complete ≠ Fully Verified ≠ Release Ready
Remembered ≠ Scheduled Now
```

迭代完成不等于充分验证，也不等于可发布；已被记录不等于现在就要安排处理。

---

## 为什么需要这套工作流

AI Coding 很擅长快速实现范围明确的工作，但不太擅长决定：

- 项目应该优先优化什么；
- 哪些取舍会产生长期影响；
- 环境缺失是否应该阻塞开发；
- 过去未完成的工作是否仍然值得投入；
- 一轮开发应该何时停止，让人重新评估现实情况。

AI Dev Loop 为这些决策提供了明确的位置。

由此形成的开发模式是：

> **人的判断控制方向和迭代边界；AI 在这些边界内完成执行。**

---

## 五个层级

```text
Project → Iteration → Lane → Task → Inner Loop
```

| 层级 | 主要负责人 | 用途 |
|---|---|---|
| Project（项目） | Human（人） | 产品、架构、V1、发布 |
| Iteration（迭代） | Human（人） | 目标、保真度、优先级、停止边界 |
| Lane（工作线） | Human + planner（人 + 规划者） | 可并行推进的工程成果 |
| Task（任务） | AI | 范围明确的工程结果 |
| Inner Loop（内循环） | AI | 实现 → 测试 → 修复 → 验证 |

---

## 启动迭代的四个视角

```text
Reality
  ↓
Memory
  ↓
Human Judgment
  ↓
Iteration Contract
```

### Reality（现实）
当前实际情况是什么？

### Memory（记忆）
此前的迭代发现了什么、延后了什么、留下了哪些未解决事项？

### Human Judgment（人的判断）
结合现实与记忆，现在值得做什么？

### Contract（约定）
应该让 Coding Agents 执行哪一轮范围明确的开发？

---

## 快速开始

### 1. 将工作流添加到项目中

阅读：

```text
docs/05-Project-Setup.zh-CN.md
```

或使用辅助脚本：

```bash
./scripts/install-into-project.sh /path/to/your/project omx
```

支持的安装目标：

```text
omx   → .codex/skills/iteration/
codex → .agents/skills/iteration/
```

脚本还会复制策略文件和模板。

### 2. 启动一轮迭代

在目标项目中执行：

```text
$iteration
```

该技能会读取当前仓库的实际情况、此前的迭代结果、延后事项的工程记忆，以及人当前的观察。

它会推荐下一轮范围明确的开发，只就高价值的人类决策提出问题。

### 3. 使用满足需求的最轻量工具执行

常见选项：

```text
solo
$plan
$ultragoal
$team
```

### 4. 结束本轮迭代

```text
$iteration close
```

这会生成：

```text
iterations/iteration-XX-result.md
engineering/deferred.md
```

然后停止执行，运行软件，观察实际情况，再决定下一轮迭代。

---

## 仓库结构

```text
.
├── README.md
├── README.zh-CN.md
├── LICENSE
├── CONTRIBUTING.md
├── CHANGELOG.md
├── ROADMAP.md
├── HANDOFF.md
├── VERSION
│
├── docs/
│   ├── 01-Research-Report.md
│   ├── 01-Research-Report.zh-CN.md
│   ├── 02-Team-Playbook.md
│   ├── 02-Team-Playbook.zh-CN.md
│   ├── 03-Project-Development-Guide.md
│   ├── 03-Project-Development-Guide.zh-CN.md
│   ├── 04-15min-SOP.md
│   ├── 04-15min-SOP.zh-CN.md
│   ├── 05-Project-Setup.md
│   └── 05-Project-Setup.zh-CN.md
│
├── policy/
│   └── OMX-LITE-POLICY.md
│
├── templates/
│   ├── ITERATION-TEMPLATE.md
│   ├── ITERATION-RESULT-TEMPLATE.md
│   ├── DEFERRED-LEDGER-TEMPLATE.md
│   └── AGENTS-SNIPPET.md
│
├── skills/
│   └── iteration/
│       ├── SKILL.md
│       └── references/
│
├── integrations/
│   └── OMX.md
│
├── examples/
│   ├── README.md
│   └── cross-platform-v1/
│
└── scripts/
    ├── install-into-project.sh
    ├── validate-language.sh
    └── test-language-policy.sh
```

面向 Human 的项目说明使用英文 `.md` 作为 canonical 版本，并可提供简体中文 `.zh-CN.md` 配套文件。机器侧产物及生成到真实项目中的工作流产物保持全英文。

---

## 推荐阅读顺序

### Leader / Architect（负责人 / 架构师）

```text
docs/01-Research-Report.zh-CN.md
→ docs/02-Team-Playbook.zh-CN.md
→ docs/03-Project-Development-Guide.zh-CN.md
```

### 加入进行中项目的工程师

```text
docs/04-15min-SOP.zh-CN.md
→ project ARCHITECTURE.md
→ active iteration
```

即先阅读 SOP，再阅读项目的 `ARCHITECTURE.md`，最后了解当前迭代。

### 工具 / 工作流维护者

```text
HANDOFF.md
→ policy/
→ skills/iteration/
→ VALIDATION-REPORT.md
```

---

## 工程记忆

跨迭代的未解决事项记录在：

```text
engineering/deferred.md
```

常见分类：

```text
DV — Deferred Verification
TD — Technical Debt
EG — Environment Gap
KR — Known Risk
```

分别表示延后验证、技术债、环境缺口和已知风险。

这些事项会被记录，但不会自动排入计划。

每轮相关迭代都可以重新评估它们，并作出以下处理：

```text
PROMOTE
KEEP-DEFERRED
RESOLVE
OBSOLETE
ESCALATE
```

分别表示提升为当前工作、继续延后、解决、标记为过时、升级处理。

这样既能避免遗忘技术债，也能避免被积压事项牵着走。

---

## 示例

参见：

```text
examples/cross-platform-v1/
```

该示例展示了以下过程：

```text
Iteration 01 — Feature Complete
→ 无法进行 Windows 验证
→ 继续实现
→ 将验证记录为延后事项
→ Human 运行系统
→ 重连 / 升级问题变得更加重要
→ Iteration 02 将这些集成问题提升为当前工作
→ Windows 验证仍被记录，并有意继续延后
```

---

## 工具理念

AI Dev Loop 有意做到**了解工具，但不依赖特定工具**（tool-aware but tool-independent）。

目前，它包含面向 OMX 的策略，以及为 Codex/OMX 工作流设计的 `$iteration` 技能。

方法论本身围绕以下稳定概念构建：

```text
Human-controlled Iteration
Outcome Lane
Hard Dependency
Deferred Engineering Memory
Human Gate
Evidence
Stop Boundary
```

即由人控制的迭代、以成果为目标的工作线、硬依赖、延后事项的工程记忆、人工决策关口、证据和停止边界。

工具可能会变化，这些概念应当持续有用。

---

## 状态

当前版本：

```text
v1.0.0
```

v1.0 已准备好接受真实项目验证。

下一阶段是在多个真实 V1 项目中使用这套工作流，并根据证据改进，而不是继续堆叠流程理论。

---

## 许可证

Apache License 2.0。参见 `LICENSE`。
