# Native Codex 执行配置

[English](README.md)

这是 AI Dev Loop 的轻量执行配置，与 OMX-Lite 并列；OMX Default 仍是上游基线与参考。规范层级保持 **Project → Iteration → Lane → Task → Inner Loop**，每轮启动遵循 **Reality → Memory → Human Judgment → Contract**。

## 从这里开始

1. 与 Human 明确产品和架构问题，再编写 [Execution Plan](EXECUTION-PLAN-TEMPLATE.md)。
2. 只批准当前 Phase 及其 Iteration Contract。Phase ≈ Human 控制的 Iteration；未来阶段只是建议。
3. 定义[有界 Goal](GOAL-TEMPLATE.md)。Goal 根据粒度对应结果 Lane 或有界 Task，绝不替代 Iteration Contract。
4. 启动一个主 Codex 会话；原生子代理可用时由它协调，并负责集成和整体验证。子代理不可用或无实际收益时串行执行。
5. 输出 Phase 结果、更新记忆、提出 Human 决策，然后 **STOP**。只有刷新 Reality + Memory 并经过 Human 判断，才能启动下一 Phase。

主会话可用 `/goal` 让单个持久目标跨轮推进到可验证的停止条件。`/goal` 不是编排器，也不授权执行未来阶段。本配置不新增自建编排器、状态机、DAG、mailbox 或调度器。模板是普通规划文档，不是运行时状态。Goal 模式不可用时，按相同契约进行普通有界执行。

高级可选方式：由 Human 自行启动多个独立 Codex CLI `/goal` 会话，每个会话有有界目标、独立 worktree 和明确所有权。Human 或指定主会话负责依赖就绪、集成及最终审阅。独立会话不意味着共享记忆或自动协调。

## 范围与并行

每个 Goal 必须写明结果、上下文、输入、边界、成功标准、允许延期事项、硬依赖、集成接口、证据、worktree 和停止/汇报规则。只有缺少前置条件会使实现无法有效开展时，才构成硬依赖。不可用检查只有在当前 Contract 允许更窄结果声明时才能延期。

并行 Goal 必须同时满足独立就绪与写入范围互不重叠。先确定共享接口；依赖它的实现串行推进，或指定唯一接口所有者。Worktree 不会消除语义冲突。实现默认使用 Git worktree；只读工作、干净工作区中的微小串行修改、绑定单一工作区的环境可作为有理由的例外，并记录替代措施。不能让多个执行者同时写同一文件。

Phase 审阅包括完成/未完成工作、证据、TD、DV、EG、KR、工程学习和 Human 决策。沿用规范的 [Iteration Result](../../templates/ITERATION-RESULT-TEMPLATE.md) 与 [Deferred Engineering Memory](../../templates/DEFERRED-LEDGER-TEMPLATE.md) 结构。Remembered ≠ Scheduled Now；Iteration Complete ≠ Fully Verified ≠ Release Ready。生成的计划、Goal、结果及记忆使用英文；与 Human 的讨论可以使用其偏好语言。

参阅[完整示例](examples/README.md)和[配置选择指南](../../docs/06-Choosing-an-Execution-Profile.zh-CN.md)。官方能力说明：[Goal](https://learn.chatgpt.com/use-cases/follow-goals)、[子代理](https://learn.chatgpt.com/docs/agent-configuration/subagents)、[Git worktree](https://learn.chatgpt.com/docs/environments/git-worktrees)。Human 阶段边界是 AI Dev Loop 的政策，不代表产品会自动执行该边界。
