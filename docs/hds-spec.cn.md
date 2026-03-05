# HDS v1.0 — 紧凑的全息规范（规范性）

1) 目的
HDS 以最小的法律与制品确保项目始终拥有“整体切片”（全息图），并让变更以可验证事实进行，而不稀释公共含义。

2) 最小制品（核心）
- Manifest: HOLO.md — 当前阶段、5–15 条不变式、关键决策（含退出标准）。
- Surface: SURFACE.md — 外部契约清单（API/格式/模式/CLI/事件/运维），逐项标注 [FROZEN]/[FLUID] 并链接 Proof。
- 契约测试：tests/contract/* — 保护 Frozen 行为/典范（回环、确定性、兼容性）。
- 垂直场景：tests/scenario/* — 至少一个端到端路径，证明可行性。

3) 实体（轻量代数）
- Stability = Frozen | Fluid（Stable 可作为文本注记）
- DecisionStatus = Draft | Frozen（Probation 可在 HOLO.md 注记）
- Pressure = Bug | Feature | Debt | Ops（正当变更理由）
- Invariant — 文本化法律（“不能被破坏的”），绑定到 Surface/Core
- Proof — 证明不变式或契约的测试

4) 全息状态定义（Holo-State）
若可由 HOLO.md + SURFACE.md + 合同测试 + 垂直场景重建边界（对外承诺）、法律（不变式/决策）及其验证（CI 可通过的测试），则该状态为全息。

5) 阶段（成熟度模式）
- Context — Surface 与不变式草稿；决策为 Draft。
- Skeleton — 形式（类型/签名/模式）存在；构建通过；允许桩件。
- RealityCheck — 一个垂直场景；决策“落地现实”。
- Canon — 身份/版本/序列化典范（性质/回环测试）；部分决策 Frozen。
- Core — 核心语义由 golden/scenario 覆盖；外围不改变核心。
- Integrate — 集成/适配器；保持核心语义。
- Ops — 迁移/可观测性/安全与 Surface 对齐。

6) 法则（公理）
- A1 Surface First — 外部语义变更先记录于 SURFACE.md，再实现。
- A2 Frozen Requires Proof — 任一 [FROZEN] 必有可验证 Proof（合同测试）。
- A3 One Change — One Intent — 一次变更仅一项主目标。
- A4 Pressure Required for Frozen — Frozen 变更需 Bug/Feature/Debt/Ops 且具 Proof，必要时含迁移。
- A5 Decisions Need Exit — HOLO.md 中 Frozen 决策含退出标准；描述兼容/迁移。
- A6 Core/Periphery Boundary — 核心与 IO 解耦；外围不得改变核心语义（强烈建议）。

7) 变更协议（PR 四行格式）
Intent：一句话（单一目标）
Pressure：Bug | Feature | Debt | Ops
Surface impact：(none) | touches: <SurfaceItem(s)> [FROZEN/FLUID]
Proof：tests: <文件或新测试>
若涉及 [FROZEN]，需附迁移/兼容说明（Old→New、策略、窗口/版本）。

8) LLM 与 CI 的角色
- LLM 在 Surface/HOLO/Tests 内运作：先改 SURFACE.md（若需要）、再写测试、再写代码。无 Pressure/Proof 的 Frozen 变更无效。
- CI 执行全息守护：holo-verify（HOLO/SURFACE/tests 一致性）、surface-lint（语法/格式）、合同+场景测试。

9) 落地判定
若 HOLO/SURFACE 活跃；≥1 个带 Proof 的 [FROZEN]；≥1 个垂直场景；变更遵循四行 PR；CI 在违背全息法律时失败，则视为采用 HDS。

链接
- 规范（俄语源）：docs/hds-spec.md
- 紧凑规范：docs/hdf-compact-spec.md
- LLM 协议：docs/llm-protocol.md
- 证明策略：docs/proof-policy.md
- 阶段与门槛：docs/stages-and-gates.md
