# Claude Code 使用笔记

## 优先安装路径（本仓库 / 官方 marketplace）

精选、按用途分类的第三方插件见 [../plugins/README.md](../plugins/README.md)。

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
