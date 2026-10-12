# Claude Code 开发插件

插件通过 marketplace 安装和更新，不在本仓库保存源码。本清单只收录**日常软件开发实用**的插件，不全量镜像官方目录（官方 marketplace 已有 300+ 条目）。

## 安装方式

先添加 marketplace，再安装插件：

```bash
/plugin marketplace add <marketplace 仓库>
/plugin install <插件名>@<marketplace 名>
```

更新：`/plugin marketplace update <marketplace 名>`。

## Marketplace

| 名称 | 仓库 | 说明 |
|---|---|---|
| claude-plugins-official | anthropics/claude-plugins-official | Anthropic 官方目录（含首方插件与精选第三方） |
| supabase-agent-skills | supabase/agent-skills | Supabase / Postgres skill 插件 |
| claude-code-workflows | wshobson/agents | 多 harness 工作流与开发插件合集 |
| planning-with-files | OthmanAdi/planning-with-files | 文件化持久计划 |
| ponytail | DietrichGebert/ponytail | 强制最简实现 |

> 多数第三方插件也可直接从 `claude-plugins-official` 安装（例如 `github@claude-plugins-official`）。若某插件同时出现在专用 marketplace，任选其一即可。

## 插件列表

### 开发流程

| 插件 | 说明 |
|---|---|
| `superpowers@claude-plugins-official` | 核心技能库：头脑风暴、TDD、子 agent 开发、内置审查等 |
| `feature-dev@claude-plugins-official` | 完整功能开发：代码库探索、架构设计、质量审查 |
| `planning-with-files@planning-with-files` | 用项目文件持久化开发计划，hooks 注入计划上下文 |
| `ralph-loop@claude-plugins-official` | 循环迭代同一提示直到完成（Ralph Wiggum 技法） |
| `ponytail@ponytail` | 强制最简实现：YAGNI、优先标准库、不做多余抽象 |
| `code-modernization@claude-plugins-official` | 遗留代码现代化：评估、业务规则挖掘、改造/重写与验证 |
| `claude-code-setup@claude-plugins-official` | 分析仓库并推荐 hooks、skills、MCP、subagent 等自动化 |
| `claude-md-management@claude-plugins-official` | 维护 CLAUDE.md：质量审计、沉淀会话学习、保持项目记忆 |
| `hookify@claude-plugins-official` | 用 markdown 规则快速写 hooks，约束不想要的行为 |
| `project-artifact@claude-plugins-official` | 生成可分享的项目状态页（目标、工作流、下一步） |
| `conductor@claude-code-workflows` | Context-Driven Development：Context → Spec & Plan → Implement |
| `ship-mate@claude-code-workflows` | 故事文件驱动：架构 → 开发 → PR 审查 → QA → Playwright |
| `tdd-workflows@claude-code-workflows` | 红绿重构 TDD 工作流与配套审查 |
| `developer-essentials@claude-code-workflows` | Git/SQL/错误处理/代码审查/E2E/鉴权/monorepo 等基础技能包 |

### 代码审查与质量

| 插件 | 说明 |
|---|---|
| `code-review@claude-plugins-official` | 多专用 agent 对 PR 自动审查，带置信度评分 |
| `pr-review-toolkit@claude-plugins-official` | PR 审查合集：注释、测试、错误处理、类型、简化 |
| `code-simplifier@claude-plugins-official` | 不改变功能的前提下简化、规范代码 |
| `security-guidance@claude-plugins-official` | 编辑时安全模式警告 + Stop 时 diff 审查 + 提交审查 |
| `claude-security@claude-plugins-official` | 会话内深度漏洞扫描，发现经多 agent 挑战后再给补丁 |
| `semgrep@claude-plugins-official` | 实时安全扫描，引导写出更安全的代码 |
| `coderabbit@claude-plugins-official` | 外部 AI 审查伙伴，配合 40+ 静态分析器交叉验证 |
| `greptile@claude-plugins-official` | GitHub/GitLab AI 审查：查看/处理评论、对工作分支跑审查 |
| `debugging-toolkit@claude-code-workflows` | 交互式调试与调试工作流 |
| `comprehensive-review@claude-code-workflows` | 多视角审查：架构、安全、最佳实践 |
| `security-scanning@claude-code-workflows` | SAST、依赖漏洞、OWASP、容器安全扫描 |
| `code-refactoring@claude-code-workflows` | 清理、重构自动化与技术债管理 |
| `unit-testing@claude-code-workflows` | Python/JS 单元与集成测试自动化 |
| `performance-testing-review@claude-code-workflows` | 性能分析、测试覆盖与代码质量评估 |

### 工具与集成

先装「日常必装」，再按技术栈补「按需」。星标为大多数开发仓库的默认起点（约 12 个）。

#### 日常必装（★ 推荐）

| 插件 | 说明 |
|---|---|
| ★ `github@claude-plugins-official` | GitHub MCP：Issue/PR/代码搜索与仓库操作 |
| ★ `commit-commands@claude-plugins-official` | git 提交、推送、创建 PR 的快捷命令 |
| ★ `context7@claude-plugins-official` | 查询最新库文档（MCP，远程托管） |
| ★ `playwright@claude-plugins-official` | 浏览器自动化与端到端测试（MCP） |
| ★ `serena@claude-plugins-official` | 语义代码分析 MCP（LSP）：理解、导航与重构建议 |
| ★ `typescript-lsp@claude-plugins-official` | TS/JS 语言智能（前端/Node 项目几乎都要） |
| ★ `pyright-lsp@claude-plugins-official` | Python 语言智能（有 Python 再装） |
| ★ `vercel@claude-plugins-official` | Vercel 部署/构建/日志（用 Vercel 再装） |
| ★ `sentry@claude-plugins-official` | 生产报错与栈追踪（已接 Sentry 再装） |
| ★ `figma@claude-plugins-official` | 读设计文件与 token，辅助落地 UI |
| ★ `notion@claude-plugins-official` | 搜页面、写文档、管知识库 |
| ★ `linear@claude-plugins-official` | 事务跟踪（团队用 Linear 时） |

> `typescript-lsp` / `pyright-lsp` 与下文「语言智能」表重复列出，是为了把「第一天该装什么」收在一处；其余语言 LSP 仍见专表。

#### 按需（栈相关 / 少用场景）

| 插件 | 说明 |
|---|---|
| `gitlab@claude-plugins-official` | GitLab：仓库、MR、CI/CD、Issue、Wiki |
| `atlassian@claude-plugins-official` | Jira / Confluence |
| `cloudflare@claude-plugins-official` | Cloudflare：Workers、DO、Agents SDK、Wrangler 等 |
| `firebase@claude-plugins-official` | Firebase：Firestore、Auth、Functions、Hosting、Storage |
| `prisma@claude-plugins-official` | Prisma Postgres：schema 迁移、SQL、连接串 |
| `terraform@claude-plugins-official` | Terraform MCP：IaC |
| `datadog@claude-plugins-official` | Datadog：日志、指标、链路、看板 |
| `stripe@claude-plugins-official` | Stripe 支付集成 |
| `expo@claude-plugins-official` | Expo / React Native |
| `laravel-boost@claude-plugins-official` | Laravel 智能辅助 |
| `firecrawl@claude-plugins-official` | 网页抓取为 Markdown / 结构化数据 |
| `exa@claude-plugins-official` | Exa 网页搜索与深度研究 |

### 语言智能（LSP）

官方提供多语言 LSP 插件，给 Claude 更强的跳转、类型与重构能力。按项目语言选装即可：

| 插件 | 说明 |
|---|---|
| `typescript-lsp@claude-plugins-official` | TypeScript / JavaScript |
| `pyright-lsp@claude-plugins-official` | Python（Pyright） |
| `gopls-lsp@claude-plugins-official` | Go |
| `rust-analyzer-lsp@claude-plugins-official` | Rust |
| `clangd-lsp@claude-plugins-official` | C / C++ |
| `jdtls-lsp@claude-plugins-official` | Java |
| `csharp-lsp@claude-plugins-official` | C# |
| `kotlin-lsp@claude-plugins-official` | Kotlin |
| `ruby-lsp@claude-plugins-official` | Ruby |
| `php-lsp@claude-plugins-official` | PHP |
| `swift-lsp@claude-plugins-official` | Swift |
| `lua-lsp@claude-plugins-official` | Lua |

### 技能与扩展开发

| 插件 | 说明 |
|---|---|
| `skill-creator@claude-plugins-official` | 创建、改进、评测 skill |
| `frontend-design@claude-plugins-official` | 前端 UI/UX 设计 |
| `supabase@supabase-agent-skills` | Supabase 开发 |
| `postgres-best-practices@supabase-agent-skills` | Postgres 最佳实践 |
| `plugin-dev@claude-plugins-official` | 插件开发：agent、command、hooks、MCP、结构指南 |
| `mcp-server-dev@claude-plugins-official` | 设计与构建适配 Claude 的 MCP server |
| `agent-sdk-dev@claude-plugins-official` | Claude Agent SDK 开发套件 |
| `mcp-tunnels@claude-plugins-official` | 经 Anthropic MCP tunnel 连接私有 MCP（Docker 快速起步） |
| `playground@claude-plugins-official` | 生成可交互的单文件 HTML playground（控件 + 实时预览） |

### 输出风格与会话辅助

| 插件 | 说明 |
|---|---|
| `explanatory-output-style@claude-plugins-official` | 解释实现选择与代码库模式（替代已弃用的 Explanatory 输出风格） |
| `learning-output-style@claude-plugins-official` | 交互式学习：在决策点要求你动手写关键代码 |
| `session-report@claude-plugins-official` | 从本地会话日志生成用量 HTML 报告（token、缓存、贵提示等） |

`skill-creator`、`frontend-design`、`supabase`、`postgres-best-practices`、以及本仓库 `coding-standards` 中的 `humanizer` 等，与官方/上游 marketplace 可能同名，二选一即可。

## Agent 使用体验

用来改善 Claude Code / Codex 等日常体验的工具：状态栏、用量、通知、记忆、多会话。大多数是独立 CLI 或 hooks，不是 `claude-plugins-official` 的条目。★ 为最推荐。已在上文列出的官方体验类插件（`session-report`、输出风格、`hookify`、`claude-md-management`）这里不再重复。

| 工具 | 来源 | 说明 | 安装 / 启用 |
|---|---|---|---|
| ★ ccstatusline | [sirmalloc/ccstatusline](https://github.com/sirmalloc/ccstatusline) | 可高度自定义的状态栏（模型、上下文用量、git 分支、费用、powerline 主题） | `npx -y ccstatusline@latest` 进入交互式配置，自动写入 `~/.claude/settings.json` 的 `statusLine` |
| claude-powerline | [Owloops/claude-powerline](https://github.com/Owloops/claude-powerline) | vim 风格 powerline 状态栏，偏向开箱即用的主题 | `/plugin marketplace add Owloops/claude-powerline` → `/plugin install claude-powerline@claude-powerline` |
| ★ ccusage | [ccusage/ccusage](https://github.com/ccusage/ccusage) | 读取本地日志，按日/月/会话/5 小时窗口统计 token 和费用 | `npx ccusage@latest`（如 `npx ccusage@latest daily`、`blocks --live`） |
| Claude Code Usage Monitor | [Maciek-roboblog/Claude-Code-Usage-Monitor](https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor) | 终端实时额度看板，预测何时用完并提前告警 | `uv tool install claude-monitor`（或 `pip install claude-monitor`），运行 `claude-monitor` |
| ★ claude-mem | [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem) | 跨会话记忆：记录会话、压缩，并在之后的会话里注入相关上下文 | `npx claude-mem install`（其他 IDE 加 `--ide <name>`） |
| agent-notifications | [777genius/agent-notifications](https://github.com/777genius/agent-notifications) | 任务完成或需要确认时发桌面通知/声音/webhook，支持 Claude、Codex、OpenCode、Gemini | `curl -fsSL https://agent-notifications.com/install.sh \| bash`（安装时选择 agent） |
| ★ claude-squad | [smtg-ai/claude-squad](https://github.com/smtg-ai/claude-squad) | 在 TUI 里管理多个 agent 会话，每个任务一个独立 git worktree | `brew install claude-squad`，在仓库内运行 `cs` |
| ccmanager | [kbwo/ccmanager](https://github.com/kbwo/ccmanager) | 多 agent 会话与 worktree 管理器（Claude/Codex/Gemini/Cursor Agent 等） | `npm install -g ccmanager` 或 `npx ccmanager` |
| CloudCLI（Claude Code UI） | [siteboon/claudecodeui](https://github.com/siteboon/claudecodeui) | 在网页/手机上远程查看和操控 Claude Code、Codex、Cursor CLI 会话 | `npx @cloudcli-ai/cloudcli` |
| opcode | [winfunc/opcode](https://github.com/winfunc/opcode) | Claude Code 桌面 GUI：管理会话、自定义 agent、查看用量、浏览会话历史 | 从 GitHub Releases 下载，或按 README 从源码构建 |
| claude-code-viewer | [d-kimuson/claude-code-viewer](https://github.com/d-kimuson/claude-code-viewer) | Web 客户端：浏览和恢复历史会话，并在网页中继续对话 | `npx @kimuson/claude-code-viewer@latest --port 3400` |

> 状态栏同时只能生效一个（`ccstatusline` 和 `claude-powerline` 二选一）。hooks 类工具（通知、记忆）安装时会改 `~/.claude/settings.json`，装之前先备份。

## 其他 harness 上值得关注的来源

本仓库的 `skills/` 主要服务 Claude Code 插件市场，但不少 skill 也兼容 Codex / Cursor（`npx skills add` 等）。不必硬塞进本仓库结构的来源可记在这里：

| 来源 | 适用 | 备注 |
|---|---|---|
| [openai/skills](https://github.com/openai/skills) | Codex 等 | 官方 Codex skills 目录；本仓库已收录其 security 相关 skill |
| [composio-community/awesome-codex-skills](https://github.com/composio-community/awesome-codex-skills) | Codex | 实用 Codex skills 精选列表 |
| [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | 多 harness | React/Web 性能与设计；本仓库已收录多条 |
| [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) | 多 harness | 生产级工程技能；本仓库已收录 TDD / 简化等 |
| [obra/superpowers](https://github.com/obra/superpowers) | Claude Code / 多 | 也可作为 `superpowers@claude-plugins-official` 安装 |
| [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills) | 多 | 社区 agent skills 大合集，挑选时注意质量 |

更细的安装笔记见 [agents-learning/claude-code.md](../agents-learning/claude-code.md)。
