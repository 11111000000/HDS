Stage: Context

Purpose:
Минимальный backend-пример, демонстрирующий HDS-голограмму.

Invariants:
1) API контракты фиксируются в SURFACE.md.
2) UUIDv7 для публичных идентификаторов.
3) Вендорный IO код — в периферии, не в Core.
4) Один вертикальный сценарий должен проходить.
5) Контрактные тесты обязательны для [FROZEN].

Decisions:
- D-BE-API
  Status: Draft
  Choice: JSON API snake_case.

Reality Check:
tests/scenario/example_scenario.spec
