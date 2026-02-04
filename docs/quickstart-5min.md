# HDS за 5 минут (Quickstart)

Цель: получить минимальную голограмму и пройти проверки без бюрократии.

1) Обновите Manifest (HOLO.md)
- Установите Stage (например, RealityCheck или Canon).
- Запишите 5–15 инвариантов (законы) и ключевые решения с Exit-criteria.
- Сохраните короткую Purpose.

2) Опишите контрактную поверхность (SURFACE.md)
- Перечислите внешние контракты (API/форматы/схемы/CLI/события/ops).
- Пометьте стабильность каждого: [FROZEN] или [FLUID].
- Для [FROZEN] укажите Proof: путь к контрактному тесту в tests/contract/*, который существует.

3) Добавьте доказательства (tests)
- Contract tests: для Frozen поверхностей (детерминизм, формат, compat).
- Один вертикальный сценарий: tests/scenario/* (минимальный end-to-end путь, можно на моках).

4) Запустите проверки локально
- ./tools/holo-verify.sh
- ./tools/surface-lint.sh
- ./tools/docs-link-check.sh

Все три должны завершиться OK. В CI это происходит автоматически (см. .github/workflows/ci.yml).

5) Оформите PR по 4 строкам
- Используйте шаблон templates/PR_TEMPLATE.md.
- Заполните Intent, Pressure (Bug/Feature/Debt/Ops), Surface impact, Proof.
- Если трогаете [FROZEN], добавьте Migration/Compatibility note.

Полезные ссылки
- Нормативная спецификация: docs/hds-spec.md
- Компактная выжимка: docs/hdf-compact-spec.md
- Манифест и поверхность: HOLO.md, SURFACE.md
- Инструменты: tools/holo-verify.sh
#+begin_note
Совет: придерживайтесь правила Surface First — если меняется внешний смысл, сперва правьте SURFACE.md и тесты, затем код. Это экономит время и снижает переписывания.
#+end_note
