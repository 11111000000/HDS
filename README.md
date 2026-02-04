HDS — Holographic Development Specification (recursive)

Что это
Голографическая разработка — подход, при котором проект в любой момент имеет минимальный срез целого (голограмму): манифест смысла (HOLO), контрактную поверхность (SURFACE), доказательства (тесты) и один вертикальный сценарий. Этот репозиторий — спецификация методики HDS и одновременно демонстрация её внедрения (рекурсивно): сам репозиторий оформлен по HDS, имеет Surface/Decisions/Proof/CI.

Зачем
- Удерживать публичный смысл стабильным без бюрократии.
- Делать изменения воспроизводимыми фактами (тесты/миграции), а не рассказами.
- Сохранить скорость за счёт двухскоростного контура: быстрый Fluid и медленный Frozen/Core.

Ключевые артефакты (ядро голограммы)
- HOLO.md — манифест: стадия, 5–15 инвариантов (законы), ключевые решения с Exit-criteria.
- SURFACE.md — контрактная поверхность: реестр внешних обещаний с пометкой стабильности [FROZEN]/[FLUID] и ссылками на Proof.
- tests/contract/* — контрактные тесты для Frozen (детерминизм, roundtrip, совместимость).
- tests/scenario/* — один вертикальный сценарий (e2e или на моках).

Спецификации и документы
- Норматив: docs/hds-spec.org
- Компактная выжимка: docs/hdf-compact-spec.md
- Суть подхода (Essentials): docs/hds-essentials.org
- Алгебра (HGA): docs/hga-algebra.org и экспорт docs/algebra/HDS-algebra.txt
- Политика Proof: docs/proof-policy.md
- Стадии и ворота: docs/stages-and-gates.org
- Протокол изменений и LLM: docs/change-gate.org, docs/llm-protocol.org
- Паттерны/антипаттерны: docs/patterns-anti-patterns.org
- Глоссарий/FAQ: docs/glossary.org, docs/faq.org
- Нарратив/философия: docs/overview.org, docs/narrative-philosophy.org
- Дорожная карта: docs/roadmap.org

Быстрый старт (5 шагов)
1) Обнови HOLO.md: Stage, Purpose, 5–15 инвариантов, ключевые решения (с Exit). 
2) Опиши SURFACE.md: элементы контракта с [FROZEN]/[FLUID] и Proof-ссылками. 
3) Добавь доказательства: контрактные тесты для Frozen и один вертикальный сценарий. 
4) Запусти проверки: ./tools/holo-verify.sh && ./tools/surface-lint.sh && ./tools/docs-link-check.sh 
5) Делай PR по 4 строкам: Intent, Pressure (Bug/Feature/Debt/Ops), Surface impact, Proof.

Инструменты и CI
- Проверки: tools/holo-verify.sh, tools/surface-lint.sh, tools/docs-link-check.sh
- CI: .github/workflows/ci.yml — запускает все проверки и падает при нарушениях.
- Конфигурация: порог reuse Proof настраивается через env HDS_PROOF_REUSE_MAX (см. policies/compatibility.md).

Примеры
- Минимальный CLI: examples/cli (SURFACE + контрактный и сценарный тесты)
- Минимальный backend-каркас: examples/backend

Как формулировать PR (Lite-протокол)
Intent: одна фраза (одна цель)
Pressure: Bug | Feature | Debt | Ops
Surface impact: touches SURFACE item(s) или none
Proof: какие тесты докажут

Если трогаешь [FROZEN], добавь Migration/Compatibility note (Old→New, стратегия, окно депрекации/версионирование).

С чего начать читать
- 5 минут: docs/quickstart-5min.md
- Суть и мотивация: docs/hds-essentials.org
- Полная спецификация: docs/hds-spec.org
- Алгебра: docs/hga-algebra.org

Лицензия и вклад
- Лицензия: LICENSE (MIT)
- Как вносить изменения: CONTRIBUTING.md (следуй Surface First и 4-строчному протоколу PR)
- Кодекс поведения: CODE_OF_CONDUCT.md
