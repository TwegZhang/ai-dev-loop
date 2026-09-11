# 新项目接入说明

[English](05-Project-Setup.md) | 简体中文

## 0. 先选择执行 Profile

**Methodology > Tooling。** Canonical Methodology 包含同级的 [Native Codex](../profiles/native-codex/README.zh-CN.md) 和 [OMX-Lite](../profiles/omx-lite/README.zh-CN.md) Profile。OMX Default 是上游基线/参考。选择和切换方式见[选择执行 Profile](06-Choosing-an-Execution-Profile.zh-CN.md)。

Native Codex 从 [Execution Plan](../profiles/native-codex/EXECUTION-PLAN-TEMPLATE.md) 和 [Goal](../profiles/native-codex/GOAL-TEMPLATE.md) 模板开始。将项目架构、决策、批准的 Phase contract、结果和 `engineering/deferred.md` 保存在普通仓库文件中。按 Execution Plan → Phase ≈ Iteration → bounded Goals → 按需使用 worktrees/subagents → integration/evidence → result 和 memory → STOP 推进。无需安装 `$iteration` 或 OMX runtime；隔离和原生能力指引见该 Profile。

下列安装步骤配置的是 **OMX-Lite**。辅助脚本仍然只安装 OMX-Lite 资产：

```bash
./scripts/install-into-project.sh /path/to/your/project omx
# Or, for the plain Codex host:
./scripts/install-into-project.sh /path/to/your/project codex
```

`codex` 参数选择 host 的技能发现路径，**不代表**选择 Native Codex Profile。两种目标都会复制 policy、templates 和 `$iteration` 技能。

## 1. 推荐项目结构

```text
repo/
├── AGENTS.md
├── ARCHITECTURE.md
├── DECISIONS.md
├── specs/
├── policy/
│   └── OMX-LITE-POLICY.md
├── templates/
│   ├── ITERATION-TEMPLATE.md
│   ├── ITERATION-RESULT-TEMPLATE.md
│   └── DEFERRED-LEDGER-TEMPLATE.md
├── iterations/
└── engineering/
    └── deferred.md
```

## 2. 拷贝 Policy 与 Templates

从本交付包复制：

```bash
mkdir -p policy templates iterations engineering
cp <workflow>/policy/OMX-LITE-POLICY.md policy/
cp <workflow>/templates/*.md templates/
cp templates/DEFERRED-LEDGER-TEMPLATE.md engineering/deferred.md
```

删除/替换 `deferred.md` 中的示例 record 即可。

## 3. 安装 `$iteration` Skill

本交付包唯一源码：

```text
skills/iteration/
```

### OMX project-scope（在 OMX host 上使用 OMX-Lite）

OMX 当前 project setup 使用项目 `./.codex/` 作为 scoped Codex home，并将 project skills 安装到：

```text
.codex/skills/
```

因此：

```bash
mkdir -p .codex/skills
cp -R <workflow>/skills/iteration .codex/skills/
```

然后用 OMX 启动 Codex，并通过 skill 列表/`$iteration` 验证。

### Plain Codex repo-local（OMX-Lite 资产）

OpenAI 当前 Codex 文档列出的 repo-local check-in 发现路径是：

```text
.agents/skills/
```

因此普通 Codex repo 可以安装同一份 OMX-Lite 技能：

```bash
mkdir -p .agents/skills
cp -R <workflow>/skills/iteration .agents/skills/
```

### 不要同时复制两份

不同 Codex/OMX 版本的 skill 发现和 `CODEX_HOME` 约定曾发生过迁移。

原则：

> **本 repo 的 `skills/iteration/` 是唯一源码；运行项目中只选择一个实际生效的发现位置。**

避免 `.codex/skills/iteration` 和 `.agents/skills/iteration` 同时放同名 skill，防止重复/版本漂移。

## 4. 在 `AGENTS.md` 引用 Policy

可复制 `templates/AGENTS-SNIPPET.md` 的核心内容。

确保 Agent 知道：

```text
Human owns iteration boundaries
OMX executes inside the current iteration
deferred memory is not an automatic backlog
```

## 5. 第一次使用

如果已有架构：

```text
$iteration start
```

如果架构仍高度模糊，可先使用 OMX 的 requirements/planning 能力（例如 deep interview / planning），形成 Architecture/Spec 后再进入 Iteration。

## 6. 第一轮结束

```text
$iteration close
```

检查生成：

```text
iterations/iteration-01-result.md
engineering/deferred.md
```

然后 Human 实际运行系统，再开始下一轮。

## 7. 验证 Skill 安装

如果 `$iteration` 不出现：

- 检查实际 host 使用的 skill root；
- 检查 `SKILL.md` frontmatter；
- 重启 Codex（若 host 未自动刷新）；
- OMX 环境可运行 `omx doctor` 检查其 scoped setup。

## 8. 版本说明

Skill/OMX/Codex 的发现路径和命令会变化。

两种 Profile 都保留 Project → Iteration → Lane → Task → Inner Loop、四个 View、Human Gate 和迭代 STOP。保留 DV / TD / EG / KR 记录，以及 PROMOTE / KEEP-DEFERRED / RESOLVE / OBSOLETE / ESCALATE 分流。**Iteration Complete ≠ Fully Verified ≠ Release Ready** 和 **Remembered ≠ Scheduled Now** 对两者都适用。

方法论资产应绑定：

```text
Iteration
Reality / Memory / Judgment / Contract
Outcome Lane
Hard Dependency
Deferred Memory
Human Gate
Stop Boundary
```

而不要绑定某个工具版本的内部实现。
