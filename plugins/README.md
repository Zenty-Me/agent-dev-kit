# Claude Code 开发插件

插件通过 marketplace 安装和更新，不在本仓库保存源码。

## 安装方式

先添加 marketplace，再安装插件：

```bash
/plugin marketplace add <marketplace 仓库>
/plugin install <插件名>@<marketplace 名>
```

## Marketplace

| 名称 | 仓库 |
|---|---|
| claude-plugins-official | anthropics/claude-plugins-official |
| supabase-agent-skills | supabase/agent-skills |
| claude-code-workflows | wshobson/agents |
| planning-with-files | OthmanAdi/planning-with-files |
| ponytail | DietrichGebert/ponytail |

## 插件列表

### 开发流程

| 插件 | 说明 |
|---|---|
| `superpowers@claude-plugins-official` | 核心技能库：TDD、调试、协作模式等 |
| `feature-dev@claude-plugins-official` | 完整功能开发流程：代码库探索、架构设计、质量审查 |
| `planning-with-files@planning-with-files` | 用项目文件持久化开发计划，通过 hooks 注入计划上下文 |
| `ralph-loop@claude-plugins-official` | 让 Claude 循环迭代开发（Ralph Wiggum 技法） |
| `ponytail@ponytail` | 强制最简实现：YAGNI、优先标准库、不做多余抽象 |

### 代码审查与质量

| 插件 | 说明 |
|---|---|
| `code-review@claude-plugins-official` | 多个专用 agent 对 PR 做自动审查，带置信度评分 |
| `pr-review-toolkit@claude-plugins-official` | PR 审查 agent 集合：注释、测试、错误处理、类型设计、简化 |
| `code-simplifier@claude-plugins-official` | 在不改变功能的前提下简化、规范代码 |
| `security-guidance@claude-plugins-official` | 编辑时的安全模式警告、结束时的 diff 安全审查、提交审查 |
| `debugging-toolkit@claude-code-workflows` | 交互式调试和调试工作流 |

### 工具与集成

| 插件 | 说明 |
|---|---|
| `commit-commands@claude-plugins-official` | git 提交、推送、创建 PR 的快捷命令 |
| `playwright@claude-plugins-official` | 浏览器自动化与端到端测试（MCP） |
| `context7@claude-plugins-official` | 查询最新的库文档（MCP） |

### 技能类

| 插件 | 说明 |
|---|---|
| `skill-creator@claude-plugins-official` | 创建、改进、评测 skill |
| `frontend-design@claude-plugins-official` | 前端 UI/UX 设计 |
| `supabase@supabase-agent-skills` | Supabase 开发 |
| `postgres-best-practices@supabase-agent-skills` | Postgres 最佳实践 |

后四个在 `skills/` 下也有同名 skill，二选一即可。
