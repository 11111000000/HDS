# HDS 概览 — 小中见大（实践性导论）

## 问题
现代开发（尤其结合 LLM）速度加快，却失了“形”：公共含义漂移、测试不固化意图、补丁趋于宽泛。HDS（全息式开发规范）给出简明框架，使“由小见大”：任何时刻都有最小项目全息图——宣言、表面、证明与一条垂直场景。

## 关键概念
全息图——可重建整体的最小切片：HOLO.md（伦理与法律）、SURFACE.md（边界与承诺）、Proof（测试）、一条垂直场景（可行性）。  
契约表面（Contract Surface）——对外承诺清单（API/格式/模式/事件/CLI/运维），逐项标注稳定性：[FROZEN] 兼容典范；[FLUID] 探索区。Frozen 仅在 Pressure（事实）与 Proof（测试）下变更。  
核心/外围（Core/Periphery）——语义核心与 IO 解耦；外围为适配/集成。由此获得反脆弱：外界可变，核心常存。  
决策（Decisions）——带退出标准（Exit）的关键选择。非教条，而是可被事实修订的契约。

## 双速回路
Fluid —— 快速变更而不破坏 Frozen。Frozen/Core —— 在 Pressure 与迁移/测试支撑下缓慢演进。既保速度，亦护身份。

## 落地实践
- Manifest（HOLO.md）：单一活文档——当前阶段、5–15 不变式、关键决策（含 Exit）、RealityCheck 场景。
- Surface（SURFACE.md）：简短契约清单，含稳定性标记与 Proof 链接。
- 测试：Frozen 的契约测试（确定性、回环、兼容）与至少一条垂直场景（e2e 或含桩）。
- PR 协议：四行——Intent、Pressure、Surface impact、Proof。若触及 Frozen——补充迁移/兼容说明。

## 阶段（成熟度，无繁琐流程）
Context → Skeleton → RealityCheck → Canon → Core → Integrate → Ops。阶段写入 HOLO.md，界定当前“足够的全息图”。

## 链接
- 规范（EN）：docs/hds-spec.en.md
- 紧凑规范（RU）：docs/hdf-compact-spec.md
- 代数（RU）：docs/hga-algebra.md
- 精要（CN）：docs/hds-essentials.cn.md
- 快速开始（RU）：docs/quickstart-5min.md
