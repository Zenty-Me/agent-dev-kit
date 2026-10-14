# AGENTS.md / CLAUDE.md 撰写技巧

核实：2026-10-14。跨 Claude Code、Pi、Codex 等 harness 的项目指令文件写法。社区共识主要来自 X（[琦玉](https://x.com/KakaluoteW45042/status/2101773488751280513)、[澜知](https://x.com/LanzhiAI/status/2109837711628751286)、[小墨](https://x.com/xiaomovps/status/2099732591557619746) 等）与 [Claude Code best practices](https://code.claude.com/docs/en/best-practices)。

**一句话：短、硬、可验证，别写成说明书。**

## 写法共识

1. **只放长期硬约束**：构建/测试命令、禁止项、踩过的坑；标准惯例和 API 文档别塞进文件
2. **事后蒸馏**：先手工干几遍，把返工纠偏记成规则，别开工前拍脑袋写空话
3. **当熔断器**：写死不能碰的路径、不能装的包，比反复口头解释便宜
4. **`CLAUDE.md` 建议 &lt;200 行**：太长关键规则会被淹没（官方也强调 concise）
5. **分层**：个人全局 → 仓库根 → 子目录 override；越近越优先（Codex / 多 harness 常见）
6. **跨工具**：共享规则放 `AGENTS.md`；Claude 专用可在 `CLAUDE.md` 顶部 `@AGENTS.md` 引用
7. **Pi**：`AGENTS.md` 只放长期规则；流程做成 Skill，用到再加载（见 [pi.md](pi.md)）

## 维护技巧

- 改完**新开一轮**再验：直接问「你加载了哪些项目指令？」
- Claude：换模型后可用 `/claude-api prompt-audit` 或 `/doctor prompt-audit`，清掉旧模型留下的保姆式约束（MUST/NEVER 堆砌、`think carefully` 等）
- 有半衰期：开工读一眼、收工改一版，别让过期文件自信撒谎

## 和本仓库其它笔记的关系

- Claude：`CLAUDE.md` 维护也可配合官方插件 `claude-md-management` / `remember`（见 [plugins/README.md](../plugins/README.md)）
- Pi：全栈仓字段建议见 [pi.md](pi.md)「全栈仓 AGENTS.md 建议字段」；自助安装提示词见 [pi-bootstrap.md](pi-bootstrap.md)
