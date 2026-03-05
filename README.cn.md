# HDS — 全息式开发规范（递归）

## 这是什么

全息式开发（HDS）在任何时刻都保持一个“最小整体切片”：意义宣言（HOLO）、契约表面（SURFACE）、证明（测试）和一条纵向场景。本仓库既是 HDS 的规范，又是其落地示范：用 HDS 自举，具备 Surface/Decisions/Proof/CI。

## 为什么

- 在无繁琐流程的前提下稳定公开语义。
- 以可复现的事实（测试/迁移）驱动变更，而非口述。
- 通过双速机制保持效率：快速的 Fluid 与稳健的 Frozen/Core。

## 核心制品（全息体）

- HOLO.md — 宣言：阶段、5–15 条不变式（法律）、关键决策与退出条件（Exit）。
- SURFACE.md — 契约表面：对外承诺，标注稳定性 [FROZEN]/[FLUID]，并链接 Proof。
- tests/contract/* — Frozen 的契约测试（确定性、回环、兼容性）。
- tests/scenario/* — 一条纵向场景（端到端或含模拟）。

## 规范与文档

- 规范：docs/hds-spec.md
- 精要：docs/hdf-compact-spec.md
- 要点：docs/hds-essentials.md
- 代数（HGA）：docs/hga-algebra.md 与导出 docs/algebra/HDS-algebra.txt
- 证明策略：docs/proof-policy.md
- 阶段/关口：docs/stages-and-gates.md
- 变更协议与 LLM：docs/change-gate.md, docs/llm-protocol.md
- HDS LLM 种子（提示词）：docs/hds-llm-seed-ru.md, docs/hds-llm-seed-en.md
- 种子使用指南：docs/llm-seed-guide.md
- 模式/反模式：docs/patterns-anti-patterns.md
- 术语/FAQ：docs/glossary.md, docs/faq.md
- 总览/哲思：docs/overview.md, docs/narrative-philosophy.md
- 路线图：docs/roadmap.md

## 五步快速开始

1) 更新 HOLO.md：阶段、5–15 条不变式、关键决策与 Exit。  
2) 编写 SURFACE.md：对外契约，标注 [FROZEN]/[FLUID]，并链接 Proof。  
3) 添加 Proof：为 Frozen 编写契约测试，并加入一条纵向场景。  
4) 运行校验：./tools/hds.sh all  
   （或分别运行：./tools/holo-verify.sh && ./tools/surface-lint.sh && ./tools/docs-link-check.sh）  
5) 提交 PR，正文仅 4 行：Intent、Pressure（Bug/Feature/Debt/Ops）、Surface impact、Proof。

若修改 [FROZEN]，需补充迁移/兼容说明（Old→New、策略、弃用窗口/版本）。

## 使用 HDS LLM 种子

### 位置：
  - RU: docs/hds-llm-seed-ru.md
  - EN: docs/hds-llm-seed-en.md
  - 详细指南：docs/llm-seed-guide.md

### 用法（简要）：
  1) 将种子文件（RU/EN）完整放入 LLM 上下文。
  2) 提供领域输入（需求/规格/用户路径）。
  3) 期望模型输出 5 个部分：Questions → Plan（含 Change Gate）→ Answer（补丁/物化）→ Verify（报告）→ Commands（本地命令）。
  4) 始终遵循：Surface → Tests（Proof）→ Code → Verify → 更新 HOLO/Decisions。

### 输出结构（与格式无关；默认 Markdown）：
  - 五个部分：Questions、Plan、Answer、Verify、Commands。
  - 每个 Plan 必含 Change Gate（Intent/Pressure/Surface impact/Proof）。若触及 [FROZEN]，需追加 Migration Block（Impact/Strategy/Window-Version/Data/Backfill/Rollback/Tests Keep&Add）。

## 工具与 CI

- 校验脚本：tools/holo-verify.sh, tools/surface-lint.sh, tools/docs-link-check.sh
- 封装脚本：tools/hds.sh — 单入口（verify/lint/links/spec/all）
- CI：.github/workflows/ci.yml — 统一运行并在违规时失败。
- 配置：Proof 复用阈值通过环境变量 HDS_PROOF_REUSE_MAX 控制（见 policies/compatibility.md）。

## 示例

- 最小 CLI：examples/cli（SURFACE + 契约/场景测试）
- 最小后端骨架：examples/backend

## PR 编写（精简协议）

- Intent：一句话（单一目标）  
- Pressure：Bug | Feature | Debt | Ops  
- Surface impact：触及的 SURFACE 条目或 none  
- Proof：将如何用测试证明

若触及 [FROZEN]，请附迁移/兼容说明（Old→New、策略、窗口/版本）。

## 许可与贡献

- 许可：LICENSE（MIT）
- 贡献：CONTRIBUTING.md（遵循 Surface First 与四行 PR 协议）
- 行为准则：CODE_OF_CONDUCT.md
