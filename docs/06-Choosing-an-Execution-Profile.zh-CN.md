# 选择执行配置

[English](06-Choosing-an-Execution-Profile.md)

先确定本轮开发的目标与边界，再选择执行方式。规范方法论始终是 **Project → Iteration → Lane → Task → Inner Loop**；每轮启动遵循 **Reality → Memory → Human Judgment → Contract**。

```text
AI Dev Loop Canonical Methodology
├── Native Codex Profile
└── OMX-Lite Profile

OMX Default = 上游基线 / 参考
```

两种配置实现同一套方法论，不增加相互竞争的生命周期层级。OMX Default 是用于比较的上游运行基线，不是另一套 AI Dev Loop 方法论，也不意味着所有上游模式都遵循本仓库的迭代停止边界。

## 从六个维度选择

| 维度 | Native Codex Profile | OMX-Lite Profile | OMX Default 参考 |
|---|---|---|---|
| Human 掌控能力 | Human 能判断范围、接口、证据，并在阶段边界判断集成结果 | Human 保留这些决策；明确的政策和迭代产物辅助协调 | 检查所选上游流程的 Human 检查点 |
| 协调复杂度 | 少量有界 Goal，由主 Codex 协调集成 | 多个结果 Lane 能从明确的 OMX 协调中受益 | 查阅对应上游模式的协调约定 |
| 环境不确定性 | 适合能接受有界本地证据，并及时重新评估缺口的场景 | 适合需要跨 Lane 保留 DV/EG 记录的场景 | 检查上游验证要求是否适应缺失环境 |
| 验证刚性 | Contract 定义必需证据，不强制引入编排机制 | Contract 与 OMX-Lite 政策区分必需检查和安全延期 | 检查实际模式门槛，不假定所有模式一致 |
| 期望自主程度 | Goal 内持续执行，之后由 Human 审阅 Phase | 已批准 Iteration 内协调执行，然后 STOP | 自主程度及停止规则取决于模式 |
| 持久编排状态 | 不新增；使用普通文件、Git 和原生 Goal 连续性 | 所选 OMX 运行时可保留协调状态，仅采用必要部分 | 上游运行时管理自身状态与生命周期 |

这些维度用于辅助判断，不是评分器或自动选择器。Human 无暇参与不代表模糊架构可以安全下放；验证要求严格也不必然需要 OMX，单个原生 Goal 同样可以执行严格测试。高度不确定时，两种配置都可以先做更小的探索迭代。复杂项目中的独立小范围工作仍可采用 Native Codex。

## 快速选择

```text
低编排需求
→ Native Codex Profile

中等 / 自适应编排
→ OMX-Lite Profile

高强度 / 严格编排
→ 评估 OMX Default
```

这只是起点，不是按项目大小划分。大型项目中的少量独立 Goal 可以使用 Native Codex；小型但合规要求很强的改动也可能适合严格的上游验证流程。环境高度不确定时，可以选择较短的 Native 探索 Phase，或用 OMX-Lite Iteration 明确记录 DV/EG，而不必直接进入严格闭环。

小功能、聚焦修复或具有明确本地停止条件且 Human 能及时审阅的探索实现，可选 [Native Codex](../profiles/native-codex/README.zh-CN.md)。多个结果需要协调、且已安装 OMX 运行时能带来实际收益时，可选 [OMX-Lite](../profiles/omx-lite/README.zh-CN.md)。选择运行时能力前，参阅 [OMX 集成说明](../integrations/OMX.md) 理解上游基线。只在经过审阅的边界切换配置，不静默迁移进行中的工作，也不假定状态能够互换。

## OMX Default 参考

典型的严格上游编排形态是：

```text
planning
→ task / dependency graph
→ team / orchestration
→ verification
→ workflow closure
```

它适合需要强 framework 控制、较重 worker 协调、稳定执行与验证环境、执行过程中较少 Human 干预，以及重视严格闭环的工作。实际使用前仍应检查所安装 workflow 的约定，不能假定每种 OMX 模式完全相同。

需要评估的代价包括：过度编排、任务膨胀、将软顺序硬化为阻塞依赖，以及在当前结果声明尚不需要时就让验证或环境缺口成为 blocker。AI Dev Loop 不重新实现或覆盖 OMX Default；只有当这些 framework 控制值得相应成本时，才直接选用它。

## Native 的规划与执行

头脑风暴和架构决策形成 Execution Plan。计划明确经过 Human 批准的 Phase 及有界 Goal；未来阶段仅是建议。**Phase ≈ Human 控制的 Iteration；Goal ≈ 结果 Lane 或有界 Task**，具体取决于粒度。Goal 绝不替代 Iteration Contract。可以链接规范 Contract，也可以在 Phase 段落中完整记录其必需内容，避免维护相互冲突的副本。

默认启动方式是一个主 Codex 会话，在原生子代理可用时协调它们；主会话负责集成和统一结果。没有子代理时串行执行。高级用户可以自行启动多个独立 Codex CLI `/goal` 会话，但必须分配独立 worktree、明确写入所有权和集成负责人。这是可选方式，不是自动管理会话集群。

`/goal` 让单个持久目标跨轮持续推进，直到达到可验证的停止条件；它不是多目标编排器。Native Goal 不需要自建状态机、DAG、mailbox 或调度器。能力是否可用取决于 Codex 界面；不可用时使用普通有界执行。参阅官方 [Goal 指南](https://learn.chatgpt.com/use-cases/follow-goals)、[子代理指南](https://learn.chatgpt.com/docs/agent-configuration/subagents) 和 [Git worktree 指南](https://learn.chatgpt.com/docs/environments/git-worktrees)。

只有 Goal 不受硬依赖阻塞、能够独立产出有效结果且写入范围互不重叠时，才并行执行。先固定共享接口；接口所有者完成后，再进行依赖它的集成。不同 worktree 能隔离文件，却不能消除契约不兼容。实现默认使用 Git worktree；只读审阅、干净工作区中的微小串行修改、或绑定单一工作区的环境可以例外，但要记录理由与替代隔离措施。例外不能成为并发修改同一文件的依据。

## 审阅、记忆与 STOP

Phase 集成审阅必须包含：完成与未完成结果、证据及验证局限、技术债 TD、延期验证 DV、环境缺口 EG、已知风险 KR、工程学习和 Human 决策。将未解决事项归入工程记忆，将长期架构事实及决策写入相应文档，然后 **STOP**。

下一 Phase 只能在刷新 Reality + Memory 并经过 Human 判断后启动。被记住不等于已排期。Iteration Complete ≠ Fully Verified ≠ Release Ready。可使用英文 [Execution Plan 模板](../profiles/native-codex/EXECUTION-PLAN-TEMPLATE.md)、[Goal 模板](../profiles/native-codex/GOAL-TEMPLATE.md) 和 [完整示例](../profiles/native-codex/examples/README.md)。
