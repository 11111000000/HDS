# HDS 精要 — 全息式开发之本质（规范且简明）

## 什么是 HDS
全息式开发让“以小见大”：任何时刻项目都拥有一个最小切片（全息图），可据此重建公共含义、法律及其验证方式。全息图不是官僚，而是现实地图：Manifest（HOLO）、契约表面（SURFACE）、证明（测试）与一条垂直场景。

## 关键概念
- HOLO（Manifest）：单一活文件（HOLO.md）——当前阶段、5–15 条不变式（法律）、关键决策（含 Exit）。若代码与 HOLO 矛盾——代码之过；若 HOLO 失活——项目失形。
- 契约表面（SURFACE.md）：对外契约（API/形式/模式/CLI/事件/运维）。每项标注：[FROZEN] —— 典范；仅可在 Pressure+Proof+迁移下变更；[FLUID] —— 探索区，不得破坏 Frozen。
- 不变式与证明：不变式是法律（“不可破之处”）；Proof —— 测试（合同/场景/性质/静态），使法律在 CI 中可验证。法律是意图；测试是可复现之事实。
- 核心/外围：核心语义与 IO 解耦；外围为适配/集成。由此获得反脆弱：世界变，核心存。
- 双速：快速环（Fluid/Periphery）与慢速环（Frozen/Core/Stable）。速度不致漂移。

## 阶段（成熟度，无重流程）
- Context：Surface 与不变式草稿；决策为 Draft。
- Skeleton：形式（类型/签名/模式）存在；构建通过。
- Reality Check：一条垂直场景（允许桩件）。
- Canon：身份/版本/序列化典范；性质/回环；部分决策 Frozen。
- Core：核心语义由 golden/scenario 覆盖；外围不可改变核心语义。
- Integrate/Ops：集成/迁移/可观测性/安全与 Surface 对齐。

## 四条 HDS 公理
- Surface First：外部语义变更 → 先改 SURFACE.md，再写代码。
- Frozen Requires Proof：每个 [FROZEN] 必有可验证测试（CI 中）。
- One Change, One Intent：一次变更——一个目标。
- Pressure for Frozen：Frozen 仅在 Bug/Feature/Debt/Ops 与明确 Proof（必要时含迁移）下变更。

## 变更协议（适配 PR）
Intent —— 一句话；Pressure —— Bug/Feature/Debt/Ops；Surface impact —— 触及哪些 SURFACE 项及其稳定性；Proof —— 哪些测试将证明。若触及 [FROZEN]，补充迁移/兼容说明。

## LLM 角色
LLM 在全息图内行动：读取 HOLO.md 与 SURFACE.md；若语义变更，先改 Surface，再加/改测试，再写代码。禁止在无 Pressure 与 Proof 下变更 Frozen。建议顺序：Intent → Pressure → Surface impact → Proof。

## 全息判据（Holo）
当满足：存在 HOLO.md（含 ≥5 不变式）；存在 SURFACE.md（含 ≥1 个带 Proof 的 [FROZEN]）；存在 ≥1 条垂直场景（tests/scenario/*）；校验工具通过（tools/holo-verify.sh）——则仓库处于全息状态。详见 docs/hds-spec.cn.md 与 docs/hdf-compact-spec.md；从 docs/quickstart-5min.md 起步。
