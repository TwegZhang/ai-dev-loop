# OMX-Lite 执行配置

[English](README.md)

OMX-Lite 将 AI Dev Loop 由 Human 控制的迭代边界应用于 OMX 执行。它与 [Native Codex 配置](../native-codex/README.zh-CN.md)并列，不是另一套方法论或 OMX 分叉。OMX Default 是上游基线与参考。

保持 **Project → Iteration → Lane → Task → Inner Loop** 和 **Reality → Memory → Human Judgment → Contract**。Human 负责方向、架构、迭代边界和发布决策；OMX 在已批准的 Iteration Contract 内协调有界执行。

## 复用现有资产

- [运行政策](../../policy/OMX-LITE-POLICY.md)：硬依赖、结果 Lane、安全延期、升级决策与 STOP。
- [Iteration 技能](../../skills/iteration/SKILL.md)：启动、审阅、记忆、状态和关闭流程。
- [Iteration Contract](../../templates/ITERATION-TEMPLATE.md)、[Iteration Result](../../templates/ITERATION-RESULT-TEMPLATE.md) 和 [Deferred Engineering Memory](../../templates/DEFERRED-LEDGER-TEMPLATE.md)：规范产物。
- [项目配置](../../docs/05-Project-Setup.zh-CN.md)与 [OMX 集成](../../integrations/OMX.md)：安装和执行说明。
- [配置选择指南](../../docs/06-Choosing-an-Execution-Profile.zh-CN.md)：采用协调机制前，对照六个维度及例外判断。

使用能够满足当前迭代的最轻量且受支持的 OMX 执行方式。运行时可用性和所有权仍遵循已安装的 OMX 流程；本目录不新增运行时状态，也不复制政策、技能或模板。

关闭时汇总完成/未完成结果、证据、TD、DV、EG、KR、工程学习和 Human 决策，然后 **STOP**。交还控制权前先更新工程记忆。下一迭代需要刷新 Reality + Memory 并经过 Human 判断。Remembered ≠ Scheduled Now；Iteration Complete ≠ Fully Verified ≠ Release Ready。生成的项目产物使用英文；面向 Human 的讨论可使用其偏好语言。
