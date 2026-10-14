# 跨 agent 调用

跨 harness（Claude Code / Codex / Pi / Cursor 等）**一般没有原生互相当子 agent**——官方默认同伙是同品牌会话。要把对方当工人，做法是**把对方包成工具**。

核实：2026-10-14（群聊「资料助手」整理）。

## 原则

1. **对方不是子会话，是工具**：指挥方通过 Bash / CLI / MCP 调用对方的 headless 入口，读 stdout 或落盘结果。
2. **定编排、定工人**：谁拿订阅做规划（编排），谁写码/跑测（工人）；别两边同时当老板。
3. **文件系统当共享状态**：任务切片、进度、diff 写进仓库或临时目录；别抢同一文件。
4. **验收用测试**：过测 / 过脚本才算完，不以「模型说做完了」为准。

## 三种做法

### 1. Bash / headless CLI（最土最稳）

指挥方在 shell 里跑对方 CLI，读 stdout；文件系统当共享状态。

```bash
# 例：指挥方调 Codex
codex exec "实现某某，改完跑测试并汇报 diff"

# 例：指挥方调 Claude Code（非交互）
claude -p "实现某某，改完跑测试并汇报 diff"
```

- Claude 指挥 Codex 样板：[AlessioZazzarini/claude-codex-collab](https://github.com/AlessioZazzarini/claude-codex-collab)
- Codex 指挥 Claude：给 Codex 写 Skill/指令，教它何时跑 `claude -p`，规划留在 Codex、实现交给 Claude，回报 diff/测试

### 2. MCP 封装

把本机 Pi / Claude / Codex 暴露成 MCP 工具，给主 agent 按需调用。Claude 官方也倾向「要用别的工具就暴露成 MCP」。

- 例：Claude / Cursor 调 Pi — [minmax/pi-cli-mcp](https://github.com/minmax/pi-cli-mcp)

### 3. 桥 / 编排层

现成桥或编排器，把异品牌会话串成 teammate / 并行工人：

| 项目 | 作用 |
|---|---|
| [aproto9787/codex-bridge](https://github.com/aproto9787/codex-bridge) | Codex 当 Claude teammate |
| [yelban/codex-orchestrator](https://github.com/yelban/codex-orchestrator) | Claude 并行起 Codex |
| [pi-shell-acp](https://pi.dev/packages/@junghanacs/pi-shell-acp) | Pi 经 ACP 接 Claude / Codex |
| X 上 Subagent MCP 一类实验 | 主/从可换，按需试用 |

插件清单里的多会话 / worktree 工具见 [../plugins/README.md](../plugins/README.md)「跨 agent 通用工具」。

## 实务建议

1. **先定编排**：订阅强、擅长规划的一侧当编排；另一侧当工人写码。
2. **任务切片**：按文件/模块拆，别让两个 harness 同时改同一路径。
3. **Skill 写清交接**：例如「Codex 指挥 Claude」——规划在 Codex → 实现用 `claude -p` → 回报 diff 与测试结果。
4. **验收优先**：约定测试命令；工人只交可验证产物。
5. **同品牌优先原生**：同 harness 内用官方 subagent / Task；跨品牌再上 CLI / MCP / 桥。

相关：[规划/执行分模型](pi.md#规划执行分模型)、[Claude Code 分模型](claude-code.md#规划执行分模型)、[自主持续迭代](autonomous-iteration.md)。
