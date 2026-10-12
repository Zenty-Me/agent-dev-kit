# 资源

- https://www.aitmpl.com/：claude-code相关的skills，plugins，Commands，Settings，Hooks等相关的资源





# 本仓库插件清单（推荐优先看这里）

精选、按用途分类的 Claude Code 插件见 [../plugins/README.md](../plugins/README.md)（官方 marketplace、wshobson/agents、planning-with-files、ponytail 等）。

安装示例：

```bash
/plugin marketplace add anthropics/claude-plugins-official
/plugin install feature-dev@claude-plugins-official
```

# 其他 Agent（Codex / Cursor）可复用来源

多数 Agent Skills 标准 skill 可在 Claude Code、Codex、Cursor 间复用（例如 `npx skills add <repo>`）。本仓库 `skills/` 已精选一批；更多列表不必全量搬入仓库：

- [openai/skills](https://github.com/openai/skills) — Codex 官方 skills 目录
- [composio-community/awesome-codex-skills](https://github.com/composio-community/awesome-codex-skills) — Codex 实用 skills 精选
- [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills) — 多 harness 社区合集（质量参差，需挑）
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)、[addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) — 已有条目收录进本仓库 `skills/`

# skills推荐

## Frontend Design

> Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, artifacts, posters, or applications (examples include websites, landing pages, dashboards, React components, HTML/CSS layouts, or when styling/beautifying any web UI). Generates creative, polished code and UI design that avoids generic AI aesthetics.

**安装**

```
npx claude-code-templates@latest --skill creative-design/frontend-design
```

---

## Code Reviewer

> Comprehensive code review skill for TypeScript, JavaScript, Python, Swift, Kotlin, Go. Includes automated code analysis, best practice checking, security scanning, and review checklist generation. Use when reviewing pull requests, providing code feedback, identifying issues, or ensuring code quality standards.

```
npx claude-code-templates@latest --skill development/code-reviewer
```

---

## clean-code

> Pragmatic coding standards - concise, direct, no over-engineering, no unnecessary comments

**安装**

```
npx claude-code-templates@latest --skill development/clean-code
```

---



# 插件推荐

## Context Monitor

> Real-time Claude Code context usage monitor with visual progress bars, color-coded alerts, session analytics (cost, duration, lines changed), and auto-compact warnings. Tracks conversation context consumption and provides visual feedback to prevent session interruptions.

1. **安装**

```
npx claude-code-templates@latest --setting statusline/context-monitor
```

2. **编辑 settings.json 添加配置**

```Bash
nano ~/.claude/settings.json
```

3. **在文件最外层的 { ... } 中添加以下内容（如果文件是空的，就直接写下面这个）：**

```Bash
{
  "statusLine": {
    "type": "command",
    "command": "python3 ~/.claude/plugins/.claude/scripts/context-monitor.py"
  }
}
```



