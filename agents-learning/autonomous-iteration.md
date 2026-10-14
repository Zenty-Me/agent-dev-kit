# 自主持续迭代

给 AI **可验证终点**（产品愿景 + 测试/验收）和 **状态落盘**（TODO / progress），再套循环让它自己拆需求、实现、复验。「自己提需求」靠目标够糊 + 循环里有 discovery；别指望空提示词无限飞。

核实：2026-10-14（群聊「资料助手」整理）。

## 原则

1. **终点可验证**：写清产品愿景与验收标准（测试、脚本、人工 checklist 皆可），循环以「过验收」为停条件，不以「模型说做完了」为准。
2. **状态落盘**：TODO、progress、规格写进仓库文件（或 git），每轮读盘 → 改 → 写回；上下文可丢，文件不能丢。
3. **循环 = 拆 → 做 → 验 → 不够再开一轮**：discovery 放在循环内，目标可略糊，靠每轮探索补细节。
4. **护栏先于火力**：`max-iterations`、沙箱、用测试当裁判；否则烧钱且易跑偏。

## Pi

起步与省上下文总稿见 [pi.md](pi.md)；本节只写长跑 / goal。

### pi-long-task / `pi_goal_task`

```bash
pi install npm:pi-long-task
```

goal 循环典型路径：先写产品规格 → 拆 TODO → 实现 → 审稿 → 不够再开一轮（默认最多约 50 轮 / 48h）。

例：

```text
Use pi_goal_task with goal "把某某做成能跑通的 MVP，含测试" and commit true and maxIterations 20
```

详情：[pi-long-task](https://pi.dev/packages/pi-long-task)。包清单见 [../plugins/README.md](../plugins/README.md)；起步笔记见 [pi.md](pi.md)。

### circadian-loop（挂几天）

跨昼夜续跑：[circadian-loop](https://pi.dev/packages/circadian-loop)。

```text
/skill:circadian-loop
```

记忆落在 `loop.md`；睡醒后空上下文接着干，依赖文件状态而非会话记忆。

## Claude Code

### 官方 Ralph 插件

仓库 plugins 已收录 `ralph-loop@claude-plugins-official`（见 [../plugins/README.md](../plugins/README.md)）。

```bash
/ralph-loop "……验收写清…… Output <promise>DONE</promise>" --completion-promise "DONE" --max-iterations 20
```

同一提示反复塞回，靠文件 / git 体现进步；完成承诺字符串与验收必须写死。

### 外层循环注意

社区反馈：插件有时**不换新上下文**，长跑易糊。更稳做法是外层 bash **每轮新开** `claude`，把固定提示 + 落盘状态再喂进去。务必设 `max-iterations`、开沙箱、用测试当裁判。

起步与 marketplace 见 [claude-code.md](claude-code.md)。

## 安全与成本护栏

| 护栏 | 做法 |
|---|---|
| 轮次上限 | `maxIterations` / `--max-iterations`，先小后大 |
| 时间盒 | 如 Pi 默认约 48h；挂机用 circadian 也要能中断 |
| 沙箱 | 限制网络 / 写盘范围；勿给无约束生产凭据 |
| 测试当裁判 | CI、本地测试、脚本验收；模型自报不算过 |
| 提交可回滚 | `commit true` 或每轮小提交，坏了能 reset |
| 成本意识 | 长跑按小时计费；先短目标验证闭环再挂夜 |

核心一句话：**可验证终点 + 落盘状态 + 有上限的循环**；工具只是把这三件事自动化。
