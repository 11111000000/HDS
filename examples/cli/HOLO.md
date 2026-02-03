Stage: Context

Purpose:
Минимальный CLI-пример для демонстрации HDS.

Invariants:
1) CLI surface фиксируется в SURFACE.md.
2) Выходы детерминированы для одинаковых входов.
3) Один вертикальный сценарий должен проходить.
4) Документация команд согласована с SURFACE.md.
5) Контрактные тесты для [FROZEN].

Decisions:
- D-CLI-Format: Draft — stdout текст, stderr для ошибок.

Reality Check:
tests/scenario/example_scenario.spec
