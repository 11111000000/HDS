# HDS — План следующей версии (диалектически вытекающий)

Цель: на основе диалектического анализа текущей версии подготовить следующую итерацию HDS, устраняющую выявленные противоречия и усиливающую практическую применимость для агентов.

Change Gate (эта итерация)
- Intent: зафиксировать диалектику текущей версии и запланировать следующую версию HDS, усиливающую проверяемость и инструментальную поддержку для агентных систем.
- Pressure: Feature
- Surface impact: touches: Agent Governance Guidance [FLUID]
- Proof: tests: tests/contract/test_agent_change_gate.spec, tests/scenario/test_agent_governance.spec (планируемые)

Основные противоречия, требующие синтеза
1) Скорость агента vs. ответственность системы — нужна градуированная дисциплина (лёгкий ритуал для внутренних изменений, строгий для Surface impact).
2) Формальное наличие Proof vs. его качество — нужны критерии качества Proof и автоматические метрики валидности.
3) Документированность Surface vs. масштабность форматов — Surface должен быть достаточно богатым (API, события, схемы, ops), но компактным и машинно-валидируемым.
4) Единый канон vs. разные форматы загрузки агентов — нужен общий машинно-читаемый manifest и тонкий loader между каноном и адаптерами.

Предлагаемые изменения (практические)
1. Повысить диалектическую автоматизацию
   - Реализовать programmatic Change Gate validator (lint), проверяющий: конкретику Intent (шаблон/мин длина), корректность Pressure, соответствие Surface impact с diff, наличие Proof ссылок на файлы/тесты. (инструмент: tools/change-gate-lint.sh)
2. Усилить качество Proof
   - Добавить руководство по Proof-quality (docs/proof-quality.md) с критериями: инвариант ломается при нарушении обещания; тест покрывает формат/roundtrip/edge cases; тесты интегрированы в CI.
3. Градуированная строгая дисциплина
   - Установить правило: если Surface impact = (none) → быстрый workflow (мин. Change Gate + smoke tests); если touches [FROZEN] → строгий Proof-before-Code + Migration Block.
4. Обогатить Surface schema
   - Формализовать элементы Surface: Name, Stability, Forms (API/CLI/event), Payload schema (JSON Schema/YAML), Ops (commands), Proof refs. Предложить машинно-парсимый фрагмент (examples in SURFACE.md).
5. Создать Agent Governance Guidance (SURFACE entry — [FLUID])
   - Содержимое: правила взаимодействия агентов с Change Gate, обязательные автоматические проверки, шаблоны Intent/Pressure, примеры плохих/хороших Proof.
6. Ввести agent plugin v2
   - Добавить `.hds/agent-plugin.json` как manifest с core/loader/adapters.
   - Добавить `docs/hds-agent-loader.md` как единый loader, на который ссылаются все адаптеры.
   - Добавить `tools/agent-plugin-lint.sh` как машинную проверку связности plugin graph.
7. Добавить начальные проверяющие тесты (Proof planned)
   - tests/contract/test_agent_change_gate.spec — unit tests для validator-а (lint rules)
   - tests/scenario/test_agent_governance.spec — vertical scenario: multi-agent flow, совместная работа с SURFACE.md изменениям и проходом holo-verify

План действий (пошагово)
1) Зафиксировать Surface entry (сделано в этом патче).
2) Реализовать v2 loader + manifest + lint.
3) Добавить Proof-quality guideline (docs/).
4) Создать scenario test (tests/scenario/*) и интегрировать в CI/verify-поток.
5) Обновить scaffold/install под v2 graph.
6) Итерация: наблюдать за нагрузкой бюрократии, настроить градацию строгих правил.

Миграция и совместимость
- Эта версия вводит `agent plugin v2` как additive_v2 поверх существующего двухциклового канона. Канонический core сохраняется, а адаптеры переводятся на loader/manifest слой без ломки текущего протокола.

Следующие шаги для меня
1) Расширить change-gate-lint проверкой соответствия Surface impact реальному diff.
2) Интегрировать gate-проверку в CI/PR template.
