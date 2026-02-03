# HOLO — Holographic Manifest (for HDS repository)

Stage: Canon

Purpose:
Репозиторий-спецификация, описывающий HDS (голографическая разработка): алгебра, законы, методика и инструменты. Сам демонстрирует голографичность.

Invariants (Constitution):
1) Surface First: любые внешние обещания фиксируются и версионируются в SURFACE.md прежде кода.
2) Frozen Requires Proof: каждый [FROZEN] пункт поверхности имеет контрактные тесты.
3) One Change — One Intent: каждое изменение имеет одну доминирующую цель и проверку.
4) Core/Periphery: смысл (алгебра/законы) отделён от инструментов/IO.
5) Freeze by Maturity: заморозка решений/поверхности происходит после Reality Check.
6) Refutation/Pressure: Frozen меняется только под давлением (Bug/Feature/Debt/Ops) с тестом.
7) Bureaucracy Must Compile: все проверки автоматизируются скриптами/CI; нет ручных ритуалов.

Decisions (key choices):
- D-001 HDS File Surface Format
  Status: Frozen
  Choice: SURFACE.md — плоский markdown-реестр ([FROZEN]/[FLUID] + Proof ссылки).
  Exit: смена формата допустима только при наличии мигратора и совместимости.
  Proof: tests/contract/test_surface_links.spec

- D-002 Evidence Form
  Status: Frozen
  Choice: Нормативное доказательство — тесты (contract/scenario/property); инварианты — текстовый закон.
  Exit: возможно расширение Evidence при появлении репродуцируемых метрик.
  Proof: tests/scenario/test_vertical_minimum.spec

Reality Check (vertical scenario):
tests/scenario/test_vertical_minimum.spec — проверяет: (a) наличие [FROZEN] SurfaceItem, (b) соответствующий контрактный тест существует, (c) holo-verify проходит.

Operational notes:
Совместимость методики: minor версии — добавления без ломки законов; major — возможны изменения аксиом с миграцией артефактов (docs/templates/tools).
