# HDS v1.0 — компактная голографическая спецификация (нормативная)

1) Назначение
HDS фиксирует минимальные законы и артефакты, чтобы проект в любой момент имел “срез целого” (голограмму), а изменения были проверяемыми фактами, не размывая публичный смысл.

2) Минимальные артефакты (ядро)
- Manifest: HOLO.md — текущая стадия, 5–15 инвариантов, ключевые решения (с exit-criteria).
- Surface: SURFACE.md — реестр контрактной поверхности (API/форматы/схемы/CLI/события/ops), с пометкой [FROZEN]/[FLUID] и ссылками на Proof.
- Contract tests: tests/contract/* — защищают Frozen поведение/форматы/канон (roundtrip, детерминизм, совместимость).
- Vertical scenario: tests/scenario/* — минимум один e2e путь, подтверждающий жизнеспособность формы.

3) Сущности (лёгкая алгебра)
- Stability = Frozen | Fluid (Stable допускается как пометка в тексте).
- DecisionStatus = Draft | Frozen (Probation допустима как пометка в HOLO.md).
- Pressure = Bug | Feature | Debt | Ops (легитимные причины изменений).
- Invariant — текстовый закон (“что нельзя ломать”), привязанный к Surface/Core.
- Proof — тест(ы), подтверждающие инвариант или контракт.

4) Определение голограммы (Holo-State)
Состояние голографично, если по HOLO.md + SURFACE.md + contract tests + vertical scenario можно восстановить границы (что видно снаружи), законы (инварианты/решения), и проверку их выполнения (CI-проходимые тесты).

5) Стадии (режимы зрелости)
- Context — черновой Surface и инварианты; решения Draft.
- Skeleton — формы (типы/сигнатуры/схемы) существуют, сборка проходит, заглушки допустимы.
- RealityCheck — один вертикальный сценарий, решения “садятся на реальность”.
- Canon — канон ID/версий/сериализации (property/roundtrip tests); часть решений Frozen.
- Core — ядро смысла покрыто golden/scenario; периферия не меняет смысл.
- Integrate — интеграции/адаптеры IO; смысл Core не нарушен.
- Ops — миграции/наблюдаемость/безопасность согласованы с Surface.

6) Законы (аксиомы) HDS
- A1 Surface First — изменения внешнего смысла сначала фиксируются в SURFACE.md, затем реализуются.
- A2 Frozen Requires Proof — любой [FROZEN] имеет проверяемый Proof (контрактные тесты).
- A3 One Change — One Intent — изменение несёт одну доминирующую цель.
- A4 Pressure Required for Frozen — Frozen меняется только при Bug/Feature/Debt/Ops с явным Proof и (при необходимости) миграцией.
- A5 Decisions Need Exit — Frozen-решение в HOLO.md содержит exit-criteria; совместимость/миграция описаны.
- A6 Core/Periphery Boundary — Core не зависит от IO; периферия не меняет смысл ядра (сильная рекомендация).

7) Протокол изменения (формат PR — 4 строки)
Intent: одна фраза (одна цель)
Pressure: Bug | Feature | Debt | Ops
Surface impact: (none) | touches: <SurfaceItem(s)> [FROZEN/FLUID]
Proof: tests: <files or new tests>

Если затронут [FROZEN], добавляется Migration/Compatibility note (Old→New, стратегия, окно депрекации/версионирование).

8) Роль LLM и CI
- LLM действует в рамках Surface/HOLO/Tests: сначала правка SURFACE.md (если нужно), затем тесты, затем код. Изменения [FROZEN] без Pressure/Proof — невалидны.
- CI — ворота голографичности: holo-verify (HOLO/SURFACE/tests согласованы), surface-lint (синтакс/формат), прогон контрактных и сценарных тестов.

9) Критерий внедрения
HDS считается внедрённым, если: HOLO/SURFACE живые; есть ≥1 [FROZEN] с Proof; есть ≥1 вертикальный сценарий; изменения описываются 4 строками PR; CI падает при нарушении законов голограммы.

