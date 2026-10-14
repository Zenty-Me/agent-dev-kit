# Pi 自助安装配置（丢给 Pi 的提示词）

核实：2026-10-14。配套说明见 [pi.md](pi.md) 与 [../plugins/README.md](../plugins/README.md) 的 Pi 区。

Pi 可以自己跑 `pi install`、改 `~/.pi/agent/`、写 `APPEND_SYSTEM.md` / 项目 `AGENTS.md`。你通常只需：`/login` 绑模型、个别 MCP/Chrome 授权、项目信任弹窗点 yes。

把下面整段复制给 Pi：

```
请把本机 Pi 配成全栈主力，尽量自己装完；需要我点授权时停下来说明。

【原则】做减法：全局常驻少装；重插件用项目级 -l；不要双开同类包（内置 MCP 与 pi-mcp-adapter 二选一；pi-browser-use 与 pi-chrome 二选一）。

【全局安装】
pi install npm:pi-web-access
pi install npm:pi-context-view
pi install npm:pi-subagents
# 若内置 MCP 不够用再装：pi install npm:pi-mcp-adapter 然后引导我跑 /mcp-adapter setup
# 可选体验：pi install npm:pi-cc-extensions

【全栈按需（可先全局，或我指定仓库时 -l）】
pi install npm:pi-chrome
# 或：pi install npm:pi-browser-use（需 Node≥24 + Chrome）
pi install npm:pi-vision-handoff
pi install -l npm:pi-lens
# 长会话优先用 /compact；不够再考虑 billion-context

【配置】
1. 写好 ~/.pi/agent/APPEND_SYSTEM.md：先读本地再搜网；大改先确认；破坏性命令先说明；无视觉走 vision-handoff。
2. 在当前仓库根写 AGENTS.md（栈、目录、起前后端/测试命令、env 约定）。
3. 用 pi config 确认扩展开关合理。
4. 装完列出：已装包、配置改动路径、还需我手动做的授权步骤。

装完自检：web 搜索一条文档、读一个本地文件、说明子代理怎么拆任务。
```
