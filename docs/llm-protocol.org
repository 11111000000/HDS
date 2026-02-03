LLM-протокол (норматив): как работать в рамках голограммы

Назначение
Сделать взаимодействие с LLM предсказуемым и безопасным для публичного смысла: менять быстро там, где можно (Fluid), и строго там, где нужно (Frozen/Core).

Базовые правила
- Surface First: изменения внешнего смысла начинаются с правки SURFACE.md, затем — тесты, и только потом код.
- Frozen Requires Proof: нельзя менять [FROZEN] без явного Pressure и тестов/миграции.
- One Change — One Intent: один запрос — одна цель, никаких широких патчей.

Формат запроса к LLM (вставляйте в промпт)
Intent: что одно изменение должно сделать и зачем (1 фраза)
Pressure: Bug | Feature | Debt | Ops
Surface impact: (none) | touches SURFACE item(s): <name(s)> [FROZEN/FLUID]
Proof: tests: <какие контрактные/сценарные тесты подтвердят результат>

Если touches [FROZEN], добавьте:
Migration/Compatibility: Old→New семантика, стратегия совместимости, окно депрекации или версионирование.

Пример (безопасное расширение Frozen через v2)
Intent: Add display_name to public user payload without breaking v1 clients
Pressure: Feature
Surface impact: touches UserPublic (FROZEN): introduce UserPublic.v2 and GET /v2/users/{id}
Proof: tests/contract/test_userpublic_v2_roundtrip.spec, tests/contract/test_api_users_v2_contract.spec

Follow-up steps for you:
1) Update SURFACE.md (add UserPublic.v2 and /v2/users/{id})
2) Add/adjust contract tests above; do not modify existing v1 tests
3) Implement code until tests pass
4) Update HOLO.md Decisions if compatibility policy changed

Guardrails для модели
- Запрещено менять или удалять существующие тесты для Frozen, если нет явной миграции/версии.
- Любой новый тест должен ссылаться на соответствующий SurfaceItem/инвариант (комментарием или именованием).
- Если требуется широкий патч — предложить план дробления (несколько Intent).

Ссылки
- SURFACE.md
- HOLO.md
- Нормативная спецификация: [[hds-spec.org]]
- Быстрый маршрут: [[quickstart-5min.md]]
