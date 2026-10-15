# Claude Code 使用笔记

项目指令文件（`CLAUDE.md` / `AGENTS.md`）写法见 [project-instructions.md](project-instructions.md)。

## 优先安装路径（本仓库 / 官方 marketplace）

精选、按用途分类的第三方插件见 [../plugins/README.md](../plugins/README.md)。

长跑自主迭代（Ralph 插件、`max-iterations`、外层 bash 换新上下文）见 [自主持续迭代](autonomous-iteration.md)。

本仓库 skills（marketplace 名 `agent-dev-kit`）：

```bash
/plugin marketplace add Zenty-Me/agent-dev-kit
/plugin install frontend@agent-dev-kit
# 其他：coding-standards / code-quality / planning / backend / skill-dev
/plugin marketplace update agent-dev-kit
```

官方目录与常用插件：

```bash
/plugin marketplace add anthropics/claude-plugins-official
/plugin install feature-dev@claude-plugins-official
/plugin install superpowers@claude-plugins-official
```

也可用 skills CLI（兼容 Claude Code / Codex / Cursor 等）：

```bash
npx skills add Zenty-Me/agent-dev-kit
npx skills add Zenty-Me/agent-dev-kit -s vercel-react-best-practices -g
```

## 体验向起步（hooks / 状态栏 / 记忆）

完整清单与安装命令见 [../plugins/README.md](../plugins/README.md) 的「Agent 使用体验」。最小组合（状态栏：纯 CC；双修见下方 Statusline 选型）：

```bash
npx -y ccstatusline@latest          # 状态栏（写入 ~/.claude/settings.json）
/plugin install hookify@claude-plugins-official
/plugin install claude-md-management@claude-plugins-official
/plugin install remember@claude-plugins-official   # 可选：更强跨会话记忆
npx tweakcc                         # 可选：主题 / spinner / 输入框样式
```

原生能力：`/statusline`、`/hooks`、settings 里的 `statusLine` 与 `Notification` hook。文档：[statusline](https://code.claude.com/docs/en/statusline)、[hooks](https://code.claude.com/docs/en/hooks-guide)。

### Statusline 选型

按 **Claude Code + Pi 双修** 场景排序（核实：2026-10-15）。官方接口：[statusline](https://code.claude.com/docs/en/statusline)。Pi 终端渲染见 [pi.md](pi.md)。

1. **双修首选**：[callmemorgan/claude-statusline](https://github.com/callmemorgan/claude-statusline) — 同时盖 Claude Code / Pi / Antigravity。Pi：`pi install npm:@morgan.rebrand/claude-statusline`；两边可统一风格（Pi 上额度/cost 段会藏，只留 model/context/git 等）
2. **纯 Claude Code 主流**：[sirmalloc/ccstatusline](https://github.com/sirmalloc/ccstatusline)（约 1.3 万★，TUI 配主题）：`npx -y ccstatusline@latest`（即上方最小组合）
3. **信息密度**：[erwint/claude-code-statusline](https://github.com/erwint/claude-code-statusline) — Agent/Todo/Tool、5h·周额度等；`/plugin marketplace add erwint/claude-code-statusline` 再 `/plugin install cc-statusline@cc-statusline`（仓小，不是社区默认）
4. **备选**：[gfreschi/claude-code-statusline](https://github.com/gfreschi/claude-code-statusline)（颜值/Powerline）、[OpenAnalystInc/Statusline](https://github.com/OpenAnalystInc/Statusline)（`npx skill-statusline install`）、[rz1989s/claude-code-statusline](https://github.com/rz1989s/claude-code-statusline)（约 480★ 壳脚本）

结论：双修 → callmemorgan；纯 CC → ccstatusline。下文 Context Monitor 是 aitmpl 模板示例，别当选型默认。

## 规划/执行分模型

两边都能规划用强模型、干活用便宜/快模型；Claude Code 有一键口（核实：2026-10-14）：

- **`opusplan`**：`/model opusplan` 或 `claude --model opusplan` — Plan Mode 用 Opus，批准后自动切 Sonnet 执行（也可用 `opusplan[1m]`）
- **子代理**：agent frontmatter 或 Task/`Agent` 参数写 `model: haiku|sonnet|opus`（或完整模型名）；社区常见 Opus 规划、Sonnet 改码、Haiku 跑腿
- **`/advisor`**：主模型干活时顾问模型旁听（`advisorModel` / `claude --advisor …`）；与 `opusplan` 不同——顾问是中途咨询，不是计划边界自动切换

官方：[model-config](https://code.claude.com/docs/en/model-config)、[advisor](https://code.claude.com/docs/en/advisor)。Pi 侧无 `opusplan`、靠 subagents / skill-model-handoff，见 [pi.md](pi.md)。跨 harness 把对方包成工具：见 [cross-agent.md](cross-agent.md)。

## 子 agent 配置

写 Markdown + YAML frontmatter 到 `.claude/agents/`（项目）或 `~/.claude/agents/`（个人）。必填 `name`、`description`；正文=系统提示。常用：`tools` / `disallowedTools`、`model`（sonnet/haiku/inherit…）、`isolation: worktree`、`background`、`memory`（核实：2026-10-15）。

最小例子：

```markdown
---
name: code-reviewer
description: 改完代码后主动做安全与质量审查。Use proactively.
tools: Read, Grep, Glob, Bash
model: sonnet
---
你是代码审查员。看 diff，按严重程度输出问题与改法。
```

调用：自然语言点名、`@` agent，或 `claude --agent code-reviewer`。内置：Explore / Plan / general-purpose。

注意：

- 新版 `/agents` **不再**开创建向导，直接写文件或让 Claude 写
- 子 agent **看不到**主会话历史，路由全靠 `description`
- 社区：编排用强模型，干活用便宜子 agent；**显式写 `model:`**，别依赖静默默认

教程：[官方 sub-agents](https://code.claude.com/docs/en/sub-agents) · [Builder.io](https://www.builder.io/blog/claude-code-subagents) · [Agent Notebook](https://www.agentnotebook.dev/tutorials/claude-code-subagents)

分模型口（`opusplan` / 子代理 model / `/advisor`）见上一节；跨 harness 见 [cross-agent.md](cross-agent.md)。

## 其他资源站点

- https://www.aitmpl.com/：Claude Code 相关 skills、plugins、Commands、Settings、Hooks 等资源聚合

## 其他 Agent（Codex / Cursor）可复用来源

多数 Agent Skills 标准 skill 可在 Claude Code、Codex、Cursor 间复用。本仓库 `skills/` 已精选一批；更多列表不必全量搬入：

- [openai/skills](https://github.com/openai/skills) — Codex 官方 skills 目录
- [composio-community/awesome-codex-skills](https://github.com/composio-community/awesome-codex-skills) — Codex 实用 skills 精选
- [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills) — 多 harness 社区合集（质量参差，需挑）
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)、[addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) — 已有条目收录进本仓库 `skills/`

## 备选：claude-code-templates（非本仓库主推）

若需从 aitmpl / claude-code-templates 拉单个模板，可用（路径可能随上游变更）：

```bash
npx claude-code-templates@latest --skill creative-design/frontend-design
npx claude-code-templates@latest --skill development/code-reviewer
npx claude-code-templates@latest --skill development/clean-code
```

**Context Monitor**（statusline）示例：

```bash
npx claude-code-templates@latest --setting statusline/context-monitor
```

再在 `~/.claude/settings.json` 最外层加入：

```json
{
  "statusLine": {
    "type": "command",
    "command": "python3 ~/.claude/plugins/.claude/scripts/context-monitor.py"
  }
}
```

本仓库已收录的同名 skill（如 `frontend-design`、`clean-code`）优先用上文 marketplace / `npx skills` 安装即可。
