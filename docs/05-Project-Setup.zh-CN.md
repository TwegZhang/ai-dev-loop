# 新项目接入说明

[English](05-Project-Setup.md) | 简体中文

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

### OMX project-scope（本方案默认）

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

### Plain Codex repo-local

OpenAI 当前 Codex 文档列出的 repo-local check-in 发现路径是：

```text
.agents/skills/
```

因此普通 Codex repo 可以：

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
