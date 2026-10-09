# 资源

- https://www.aitmpl.com/：claude-code相关的skills，plugins，Commands，Settings，Hooks等相关的资源



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



