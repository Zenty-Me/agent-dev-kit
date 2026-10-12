# Skills & Prompts

AI 协同开发工具箱：精选的 Claude Code skill、可复用的提示词，以及 AI 编码工具的使用笔记。

- **skills/**：从各官方仓库挑选的开发类 skill，可以作为 Claude Code 插件市场一键安装
- **prompts/**：可直接当系统提示词使用的角色提示词
- **plugins/**：推荐的 Claude Code 插件清单和安装方式
- **agents-learning/**：Claude Code、Hermes 等 AI 编码工具的使用笔记

## 项目结构

```
skills-prompts/
├── .claude-plugin/
│   └── marketplace.json   # Claude Code 插件市场配置，按用途把 skill 分成 7 个插件
├── skills/                # skill 定义（每个目录一个 skill）
├── prompts/               # 提示词模板
├── plugins/               # 插件清单与安装方式
├── agents-learning/       # AI 编码工具使用笔记
└── scripts/
    └── sync-skills.sh     # 从本机同步 skill 到仓库
```

## 安装 Skills

### 方式一：Claude Code 插件市场（推荐）

```bash
/plugin marketplace add Zenty-Me/skills-prompts
```

然后按需安装插件：

| 插件 | 包含的 skill |
|---|---|
| `coding-standards@skills-prompts` | karpathy-guidelines、clean-code |
| `code-quality@skills-prompts` | code-reviewer、refactor-advisor、security-best-practices、security-threat-model、code-simplification、test-driven-development、systematic-debugging |
| `planning@skills-prompts` | brainstorming、grill-me、drawio-skill |
| `frontend@skills-prompts` | frontend-design、nextjs、react-best-practices、vercel-react-best-practices、vercel-composition-patterns、web-design-guidelines、vercel-react-view-transitions |
| `backend@skills-prompts` | supabase、supabase-postgres-best-practices、python-performance-optimization |
| `writing@skills-prompts` | humanizer |
| `skill-dev@skills-prompts` | skill-creator、mcp-builder |

```bash
/plugin install frontend@skills-prompts
```

更新：`/plugin marketplace update skills-prompts`。

### 方式二：skills CLI

支持 Claude Code、Codex、Cursor 等多种 AI 工具：

```bash
npx skills add Zenty-Me/skills-prompts                      # 交互式选择
npx skills add Zenty-Me/skills-prompts -s karpathy-guidelines -g   # 全局安装单个 skill
```

### 方式三：手动复制

把 `skills/` 下需要的目录复制到 `~/.claude/skills/`（全局）或项目的 `.claude/skills/`（仅当前项目）。

## Skills 列表

| 分类 | Skill | 说明 | 来源 |
|---|---|---|---|
| 编码准则 | `karpathy-guidelines` | 基于 Andrej Karpathy 观察总结的 LLM 编码行为准则 | forrestchang/andrej-karpathy-skills |
| | `clean-code` | 简洁直接的编码规范，不过度设计 | vudovn/ag-kit |
| 代码质量 | `code-reviewer` | 关注安全、性能和最佳实践的代码审查 | awesome-llm-apps |
| | `refactor-advisor` | 识别代码坏味道并给出重构方案 | — |
| | `security-best-practices` | 按语言和框架做安全最佳实践审查 | openai/skills |
| | `security-threat-model` | 基于仓库证据的威胁建模（信任边界、滥用路径、缓解） | openai/skills |
| | `code-simplification` | 在不改变行为的前提下简化代码、提升可读性 | addyosmani/agent-skills |
| | `test-driven-development` | 红绿重构驱动开发与缺陷修复 | addyosmani/agent-skills |
| | `systematic-debugging` | 先根因再修复的系统化调试流程 | obra/superpowers |
| 设计与规划 | `brainstorming` | 动手前的头脑风暴与需求澄清 | obra/superpowers |
| | `grill-me` | 通过连续追问打磨方案或设计（仅能用 `/grill-me` 手动触发） | mattpocock/skills |
| | `drawio-skill` | 生成可编辑的 draw.io 架构图、UML、ERD、时序图 | Agents365-ai/drawio-skill |
| 前端 | `frontend-design` | 有辨识度的前端视觉设计 | anthropics/skills |
| | `nextjs` | Next.js App Router 开发指导 | — |
| | `react-best-practices` | TSX 组件质量检查清单 | — |
| | `vercel-react-best-practices` | Vercel 的 React/Next.js 性能优化指南 | vercel-labs/agent-skills |
| | `vercel-composition-patterns` | React 组件组合模式 | vercel-labs/agent-skills |
| | `web-design-guidelines` | 按 Web Interface Guidelines 审查 UI/可访问性/UX | vercel-labs/agent-skills |
| | `vercel-react-view-transitions` | React View Transition API 与路由/共享元素动画 | vercel-labs/agent-skills |
| 后端与数据库 | `supabase` | Supabase 开发 | supabase/agent-skills |
| | `supabase-postgres-best-practices` | Postgres 最佳实践 | supabase/agent-skills |
| | `python-performance-optimization` | Python 性能分析与优化 | wshobson/agents |
| 写作 | `humanizer` | 去掉文字里的 AI 腔，读起来像本人写的，不改变原意 | blader/humanizer |
| Skill 开发 | `skill-creator` | 创建、改进、评测 skill | anthropics/skills |
| | `mcp-builder` | 设计并实现高质量 MCP server（Python/TS） | anthropics/skills |

各 skill 的版权归原作者所有，许可证见各目录下的 LICENSE 文件或 SKILL.md 中的 `license` 字段。

## Prompts

| 提示词 | 说明 |
|---|---|
| [AI协同开发架构师与提示词工程专家](prompts/AI协同开发架构师与提示词工程专家.md) | 软件项目全生命周期的 AI 协同开发，生成开发级提示词指导 AI 编码助手准确实现功能 |
| [OCR 与排版专家](prompts/OCR%20与排版专家.md) | 将图片转化为结构化 Markdown 文档，支持数学公式 LaTeX 转换 |

把文件内容作为系统提示词或对话开头使用，适用于 Claude、ChatGPT 等 AI 助手。

## Plugins

推荐的 Claude Code 插件（开发流程、代码审查与质量、工具集成、LSP、技能开发等，以及 Codex/Cursor 可复用来源）见 [plugins/README.md](plugins/README.md)。

## 使用笔记

- [Claude Code](agents-learning/claude-code.md)：资源站点、skill 推荐与安装
- [Hermes](agents-learning/hermes.md)：常用命令（模型配置、会话管理）

## 维护

更新本机 skill 后同步到仓库：

```bash
npx skills update -g -y            # 从官方源更新本机 skill
scripts/sync-skills.sh             # 同步 skills/ 下已有的全部 skill
scripts/sync-skills.sh nextjs      # 只同步指定 skill
```

新增 skill 时，除了复制目录，还要把它加进 `.claude-plugin/marketplace.json` 对应的插件和上面的列表。
