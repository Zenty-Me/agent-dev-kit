# Pi 使用笔记

以 Pi 作主生产力时的安装、核心包与配置落点。包清单见 [../plugins/README.md](../plugins/README.md) 的 Pi 章节（核实：2026-10-14）。目录：[pi.dev/packages](https://pi.dev/packages)。

## 安装本体

```bash
curl -fsSL https://pi.dev/install.sh | sh
pi
# /login 绑模型；/model 选默认（常见：日常 DeepSeek，重活再切强模型）
```

## 核心增强（必装）

```bash
pi install npm:pi-mcp-adapter
# 装完：/mcp-adapter setup  → 接 GitHub / Notion / Context7 等

pi install npm:pi-web-access   # 搜索、抓页、clone、PDF/YouTube（Exa 可无 key）
pi install npm:pi-subagents    # 复杂任务拆子代理
```

社区经验：日常 = **web + MCP + subagents** 就够；多装只会抢上下文。用 `pi config` 开关扩展。

## 全栈加装

```bash
pi install npm:pi-browser-use              # 真浏览器（Node ≥24 + Chrome）
pi install npm:pi-vision-handoff           # 无视觉模型时处理截图/设计稿
pi install npm:pi-lens                     # LSP / lint / 类型（前后端同仓）
# 或二选一：
# pi install npm:@mrclrchtr/supi-code-intelligence

# 长会话按需：
# pi install npm:billion-context
# 或用内置 /compact
```

MCP 建议经 adapter 接：Context7（框架文档）、GitHub；Notion / Gmail 按需。

长任务拆法：scout 摸结构 → worker 改 → reviewer 查。

## 配置落点

| 位置 | 用途 |
|---|---|
| `~/.pi/agent/settings.json` | 全局包与默认工具（项目用 `.pi/settings.json`，信任项目可覆盖） |
| `~/.pi/agent/mcp.json` 或 `/mcp-adapter setup` | MCP 服务器 |
| `~/.pi/agent/APPEND_SYSTEM.md` | 全局行为（先读本地再搜网、大改先确认、破坏性命令先说明） |
| 仓库根 `AGENTS.md` | 技术栈、目录约定、起前后端/测试命令 |
| `~/.pi/web-search.json` | 可选：指定搜索源 |

## 不要急着堆的包

状态栏 / 用量（`pi-powerline-footer`、usage 类）、计划批注（plannotator）、旁支对话（`pi-btw`）等见 plugins 清单「其他常用包」。观测成本需要时再加。
