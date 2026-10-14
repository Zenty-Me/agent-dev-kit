# Pi 使用笔记

以 Pi 作主生产力时的安装、核心包与配置落点。包清单见 [../plugins/README.md](../plugins/README.md) 的 Pi 章节（核实：2026-10-14）。目录：[pi.dev/packages](https://pi.dev/packages)。

## 前置

- Node **≥ 22.19**（装本体）
- 要用 `pi-browser-use`：Node **≥ 24** + 本机 Chrome stable

## 安装本体

```bash
curl -fsSL https://pi.dev/install.sh | sh
pi
# /login 绑模型；/model 选默认（常见：日常 DeepSeek，重活再切强模型）
```

### 内置工作流（常用快捷键 / 命令）

| 操作 | 作用 |
|---|---|
| `Ctrl+L` | 换模型 |
| `Shift+Tab` | 思考档 |
| `Enter` | 转向当前任务 |
| `Alt+Enter` | 排队下一条 |
| `/tree` | 会话树 |
| `/compact` | 压缩上下文 |
| `/resume` | 恢复会话 |
| `/new` | 新会话 |

## 核心增强（必装）

```bash
pi install npm:pi-web-access   # 搜索、抓页、clone、PDF/YouTube（Exa 可无 key）
pi install npm:pi-subagents    # 复杂任务拆子代理
pi install npm:pi-context-view # 看清上下文占用（社区常驻推荐）

# MCP：新版先试内置 `pi mcp add`；复杂场景再：
# pi install npm:pi-mcp-adapter &&  # 然后 /mcp-adapter setup
```

社区（含 X 近几天热帖）经验：日常常驻做减法 — **web-access + context-view**（可选 `pi-cc-extensions`）+ subagents；多装只会抢上下文。用 `pi config` 开关扩展。

**勿双开：** 内置 MCP ↔ `pi-mcp-adapter` ↔ `pi-mcp-extension`；`pi-subagents` ↔ `@tintinweb/pi-subagents`；`pi-browser-use` ↔ `pi-chrome`。

## 全栈加装

```bash
pi install npm:pi-browser-use              # 隔离自动化浏览器（Node ≥24 + Chrome）
# 或用已登录日常 Chrome：
# pi install npm:pi-chrome

pi install npm:pi-vision-handoff           # 无视觉模型时处理截图/设计稿
pi install -l npm:pi-lens                  # LSP：建议项目级 -l，勿全局常开
# 或二选一：
# pi install -l npm:@mrclrchtr/supi-code-intelligence
```

MCP 建议经 adapter 接：Context7（框架文档）、GitHub；Notion / Gmail 按需。

长任务拆法：scout 摸结构 → worker 改 → reviewer 查。

### 长会话推荐（仍按需）

优先用内置 `/compact`。`billion-context` / `billion-context-pi` 月下载高，但社区有反馈长会话仍会忘，别当银弹：

```bash
pi install npm:billion-context
# 或：pi install npm:billion-context-pi
```

## 第二档：按需体验（别进核心）

| 包 | 说明 | 安装 |
|---|---|---|
| `pi-context-view` | 上下文占用可视化（常驻推荐，也可算核心增强） | `pi install npm:pi-context-view` |
| `pi-chrome` | 已登录 Chrome（与 browser-use 按场景选） | `pi install npm:pi-chrome` |
| `pi-agents` | 持久命名子代理 / 图编排 | `pi install npm:pi-agents` |
| `pi-gpt-search` | Codex 独立搜索，省 GPT token | `pi install npm:pi-gpt-search` |
| `pi-file-preview` / `pi-minimal-footer` | TUI 预览与极简 footer | `pi install npm:pi-file-preview` 等 |
| `layermap` | 调用链 / 改动影响面 | `pi install npm:layermap` |
| `pi-cc-extensions` | CC 风格 TUI（常驻可选） | `pi install npm:pi-cc-extensions` |
| `pi-memory` | 跨会话记忆 | `pi install npm:pi-memory` |
| `@narumitw/pi-plan-mode` 或 `@hank-warren/pi-plan-mode` | 只读规划（二选一） | `pi install npm:@narumitw/pi-plan-mode` |
| `@juicesharp/rpiv-todo` + `rpiv-ask-user-question` | todo 浮层 + 结构化追问 | 见 plugins 清单 |
| `pi-background-tasks` | 长跑 shell / 后台任务 | `pi install npm:pi-background-tasks` |
| `@gotgenes/pi-permission-system` | 工具调用权限闸 | `pi install npm:@gotgenes/pi-permission-system` |

观测（Langfuse / LangSmith / Braintrust）与状态栏等见 plugins「其他常用包」。X 热帖参考：[小墨常驻组合](https://x.com/xiaomovps/status/2109857660904394878)、[观测选型](https://x.com/xiaomovps/status/2109901724634997127)、[oliviscusAI 起步包](https://x.com/oliviscusAI/status/2109836779042054267)。

## 配置落点

| 位置 | 用途 |
|---|---|
| `~/.pi/agent/settings.json` | 全局包与默认工具（项目用 `.pi/settings.json`，信任项目可覆盖） |
| `~/.pi/agent/mcp.json` 或 `/mcp-adapter setup` | MCP 服务器 |
| `~/.pi/agent/APPEND_SYSTEM.md` | 全局行为 |
| 仓库根 `AGENTS.md` | 仓内约定 |
| `~/.pi/web-search.json` | 可选：指定搜索源 |

### `APPEND_SYSTEM.md` 模板要点

- 先读本地代码与文档，再 web 搜索
- 大改动先说明方案并确认，再动手
- 破坏性命令（删文件、force push、重置等）先说明再执行
- 当前模型无视觉时，截图 / 设计稿走 `pi-vision-handoff`

### 全栈仓 `AGENTS.md` 建议字段

- 技术栈与主要目录（前端 / 后端 / 共享包）
- 如何起前后端（命令、端口、依赖）
- 测试与 lint 命令
- 数据库迁移与 env / secret 约定（哪些文件勿提交、本地怎么配）

