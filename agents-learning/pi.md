# Pi 使用笔记

以 Pi 作主生产力时的安装、核心包与配置落点。包清单见 [../plugins/README.md](../plugins/README.md) 的 Pi 章节（核实：2026-10-14）。目录：[pi.dev/packages](https://pi.dev/packages)。

想让 Pi **自己装完**：把 [pi-bootstrap.md](pi-bootstrap.md) 整段提示词丢给它即可。

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
pi install -l npm:pi-lens                  # 边写边验；建议项目级 -l，勿全局常开
# 或二选一：
# pi install -l npm:@mrclrchtr/supi-code-intelligence
```

**pi-lens**（[包页](https://pi.dev/packages/pi-lens)）：改/写文件后自动 LSP、lint、类型检查、格式化，问题回灌上下文；另有符号搜索、`/lens-map`、read-guard。包体约 20MB+，可能拖慢启动（[例](https://x.com/xiaomovps/status/2099392866946818490)）；不常写代码可关。务必 `pi install -l npm:pi-lens`，勿全局常开。

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
| `pi-agent-extensions` | 界面扩展 + 主题（`/settings` → Theme；主题也可放 `~/.pi/agent/themes/`） | `pi install npm:pi-agent-extensions` |
| `pi-long-task` | 长任务拆 TODO、子会话跑、TUI 进度；说 *Run a long task…*；自主迭代做法见 [autonomous-iteration.md](autonomous-iteration.md) | `pi install npm:pi-long-task` |
| `pi-async-compaction` / `pi-longrun` | 异步压缩 / 后台任务与定时唤醒（可选） | 见 npm 包名 |

主题文档：[Themes](https://pi.dev/docs/latest/themes)；长任务：[pi-long-task](https://pi.dev/packages/pi-long-task)；跨夜续跑与 goal 循环见 [自主持续迭代](autonomous-iteration.md)。

观测（Langfuse / LangSmith / Braintrust）与状态栏等见 plugins「其他常用包」。X 热帖参考：[小墨常驻组合](https://x.com/xiaomovps/status/2109857660904394878)、[观测选型](https://x.com/xiaomovps/status/2109901724634997127)、[oliviscusAI 起步包](https://x.com/oliviscusAI/status/2109836779042054267)。

## 社区实操习惯（X，核实：2026-10-14）

主要来自 [小墨同学 @xiaomovps](https://x.com/xiaomovps) 与 Pi 作者 [Mario @badlogicgames](https://x.com/badlogicgames) 的公开帖；装扩展前仍以 [pi.dev/packages](https://pi.dev/packages) 与本地试跑为准。

### 省 Token / 保持轻量

1. **自己看的命令用 `!!`**，别把大段输出塞进模型上下文（[例](https://x.com/xiaomovps/status/2099732591557619746)）
2. **`AGENTS.md` 只放长期规则**；流程做成 Skill，用到再加载
3. **插件少装，按任务开**；低频能力优先 Skill，不要全局堆包
4. **长任务分阶段 Compact**，旧日志该丢就丢（[例](https://x.com/xiaomovps/status/2102433994516115727)）
5. **扩展演进顺序**：先手动跑通 → Skill → Extension → Package（[例](https://x.com/xiaomovps/status/2108172672488378588)）
6. **多环境**：用 `PI_CODING_AGENT_DIR` 切配置目录，别一套插件打天下（[例](https://x.com/xiaomovps/status/2099387424745169301)）

### 作者与常用命令

- Mario：subagent 更适合对抗式 review / 确定性工作流，不拿来硬交「实施」；个人扩展退出常见：`Ctrl+B` 再 `d`（[例](https://x.com/badlogicgames/status/2107908930253054442)）
- 更新包：`pi update --all`（[例](https://x.com/xiaomovps/status/2107377403286925407)）
- 看谁在吃上下文：`pi-context-view`（已在核心增强；[例](https://x.com/xiaomovps/status/2105613404933394455)）
- 中文系统向汇总：[Pi 蓝皮书帖](https://x.com/xiaomovps/status/2106379492662919337)

### 体验向扩展（按需，别进核心）

| 包 | 说明 | 安装 |
|---|---|---|
| `pi-code-render` | transcript 里代码块卡片渲染 + 一键复制 | `pi install npm:pi-code-render` |
| `pi-better-render` | 流式 Markdown / 代码 / 公式美化（仅显示，不进上下文） | `pi install npm:pi-better-render` |
| `pi-automode-classifier` | Auto mode：规则 → 本地决策模型 → 再确认危险操作 | `pi install npm:pi-automode-classifier` |
| `sol-pi` / `@herbertgao/sol-pi` | 社区提到的省上下文 / SoL 类扩展（npm 名如上；X 上常说「NVIDIA SoL-Pi」，以实际包名为准） | `pi install npm:sol-pi` 或 `npm:@herbertgao/sol-pi` |

完整第二档表见 [../plugins/README.md](../plugins/README.md)。


## 终端渲染

默认渲染够用；想更好看再装扩展（核实：2026-10-14）。

| 档 | 包 | 作用 |
|---|---|---|
| 代码卡片 | `pi-code-render` | 代码块卡片 + 一键复制 |
| Markdown 增强 | `pi-better-render` | Markdown / 表格 / 公式图；公式图建议 Ghostty / Kitty / WezTerm；Windows Terminal 可先用代码卡片 |
| 可选 | `pi-agent-extensions` | 界面更完整（主题 / 底栏等） |

`typebox` 双份依赖警告来自旧版 `pi-browser-use`（钉 `^0.11.8`），与渲染无关。处理：`pi update npm:pi-browser-use` 或 `pi update --extensions`。

验证：`/reload`、`/better-render status`、`pi list`。

### 可粘贴提示词

```
请帮我增强 Pi 终端渲染体验，并处理依赖卫生问题。按下面做，做完用 /reload 或重启验证：

1. 安装终端渲染扩展（两个都装）：
   pi install npm:pi-code-render
   pi install npm:pi-better-render

2. （可选，界面更完整）安装主题与底栏扩展包：
   pi install npm:pi-agent-extensions

3. 顺手更新已装扩展（含我当前的 pi-browser-use，它钉在 ^0.11.8，会触发 typebox 双份依赖警告）：
   pi update npm:pi-browser-use
   或：pi update --extensions

4. 装完后：
   - 运行 /reload（或退出再进 pi）
   - 用 /better-render status 确认渲染器状态
   - 用 pi list 确认包已注册
   - 简短汇报：装了什么、版本、是否还需换终端才能显示公式图

不要改我的项目业务代码；只动 Pi 全局/扩展包。
```

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

通用写法（短、硬、分层）见 [project-instructions.md](project-instructions.md)。


- 技术栈与主要目录（前端 / 后端 / 共享包）
- 如何起前后端（命令、端口、依赖）
- 测试与 lint 命令
- 数据库迁移与 env / secret 约定（哪些文件勿提交、本地怎么配）

