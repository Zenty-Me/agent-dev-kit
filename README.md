# Skills & Prompts

AI 提示词与技能集合，用于辅助 AI 协同开发、文档处理等场景。

## 项目结构

```
skills-prompts/
├── prompts/          # 提示词模板
├── skills/           # 技能定义（每个目录一个 skill）
└── plugins/          # Claude Code 插件清单与安装方式
```

## 内容说明

### Prompts（提示词）

- **AI协同开发架构师与提示词工程专家** — 专注于软件项目全生命周期的 AI 协同开发，生成开发级提示词指导 AI 编码助手准确实现功能。
- **OCR 与排版专家** — 将图片中的非结构化视觉信息精准转化为结构化 Markdown 文档，支持数学公式 LaTeX 转换。

### Skills（技能）

| 分类 | Skill | 说明 |
|---|---|---|
| 编码准则 | `karpathy-guidelines` | 基于 Andrej Karpathy 观察总结的 LLM 编码行为准则 |
| | `clean-code` | 简洁直接的编码规范，不过度设计 |
| 代码审查 | `code-review` | 对 PR 做最终代码审查 |
| | `code-reviewer` | 关注安全、性能和最佳实践的代码审查 |
| | `code-review-testing` | 测试编写指导 |
| | `refactor-advisor` | 识别代码坏味道并给出重构方案 |
| | `security-best-practices` | 按语言和框架做安全最佳实践审查 |
| 设计与规划 | `grill-me` | 通过连续追问打磨方案或设计 |
| | `drawio-skill` | 生成可编辑的 draw.io 架构图、UML、ERD、时序图 |
| 前端 | `frontend-design` | 有辨识度的前端视觉设计 |
| | `nextjs` | Next.js App Router 开发指导 |
| | `react-best-practices` | TSX 组件质量检查清单 |
| | `vercel-react-best-practices` | Vercel 的 React/Next.js 性能优化指南 |
| | `vercel-composition-patterns` | React 组件组合模式 |
| 后端与数据库 | `supabase` | Supabase 开发 |
| | `supabase-postgres-best-practices` | Postgres 最佳实践 |
| | `python-performance-optimization` | Python 性能分析与优化 |
| 工具 | `skill-creator` | 创建、改进、评测 skill |
| | `brainstorming` | 动手前的头脑风暴与需求澄清 |

### Plugins（插件）

见 [plugins/README.md](plugins/README.md)。

## 使用方式

将 `prompts/` 目录下的 Markdown 文件内容直接作为系统提示词或对话开头使用，适用于 Claude、ChatGPT 等 AI 助手。

`skills/` 目录下的技能文件可配合支持 Skill 加载的 AI 工具（如 Claude Code）使用：把需要的目录复制到 `~/.claude/skills/`（全局）或项目的 `.claude/skills/`（仅当前项目）。
