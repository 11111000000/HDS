# HDS LLM Seed — руководство по применению

Цель
- Дать чёткие шаги, как использовать HDS LLM Seed (RU/EN) для старта проекта или внесения изменений в существующий репозиторий по методике HDS.

Что такое зерно
- Единый компактный файл-промпт (docs/hds-llm-seed-ru.md или docs/hds-llm-seed-en.md), содержащий:
  - Аксиомы A1–A6, лёгкую алгебру, критерий голограммы
  - Change Gate и Migration Block
  - Guardrails (запрет «широких патчей», изменения Frozen без Proof)
  - Мини-алгоритм «Spec→Surface»
  - Мини-шаблоны HOLO/SURFACE/tests
  - Формат ответов LLM: пять разделов — Questions, Plan, Answer, Verify, Commands (Markdown по умолчанию)

Когда применять
- Новый проект — для генерации минимальной голограммы
- Существующий проект — для дисциплины изменений в рамках HDS

Подготовка (1 мин)
1) Выберите язык зерна: RU (docs/hds-llm-seed-ru.md) или EN (docs/hds-llm-seed-en.md).
2) Добавьте файл зерна целиком в контекст запроса к LLM (копипаст).
3) При необходимости приложите доменную спецификацию/ТЗ/архив артефактов.

Режим ответа модели (строго)
- Только Org typed blocks:
  - #+begin_question … #+end_question
  - #+begin_plan … #+end_plan
  - #+begin_answer … #+end_answer
  - #+begin_verify … #+end_verify
  - #+begin_commands … #+end_commands

Старт нового репозитория (15–30 мин)
1) Discovery
   - Попросите LLM задать до 5 уточняющих вопросов (#question), чтобы заполнить Change Gate.
2) Surface First
   - Получите план (#plan) с 3–7 SurfaceItem и минимум одним [FROZEN] (health/version).
3) Proof
   - Получите файлы (#answer): SURFACE.md, tests/contract/* для [FROZEN] (с маркерами Surface:/Stability:), tests/scenario/*.
4) HOLO
   - Получите HOLO.md (#answer) со стадией RealityCheck, 5–15 инвариантов (можно взять базовые 7), ключевые решения (Draft/Frozen с Exit).
5) Verify
   - Запустите команды (#commands) локально или в CI:
     - ./tools/holo-verify.sh
     - ./tools/surface-lint.sh
     - ./tools/docs-link-check.sh
   - Получите отчёт (#verify). Исправляйте минимально (Failure micro-loop).
6) Реализация кода
   - Пишите минимальный код, пока тесты не станут зелёными. Не расширяйте Intent.

Изменение в существующем репозитории (10–30 мин)
1) Оформите Change Gate в #plan (Intent/Pressure/Surface impact/Proof).
2) Если touches [FROZEN] — добавьте Migration Block (Strategy, Window/Version, Tests: Keep/Add).
3) Получите патч (#answer) с изменениями файлов.
4) Выполните проверки (#commands) → отчёт (#verify).
5) Если FAIL — примените Failure micro-loop:
   - Классифицируйте: Surface drift | Test gap | Code defect
   - Чините в порядке: Surface → Tests → Code; без расширения Intent.

Политика привязки тестов к Surface
- В каждом tests/contract/*.spec:
  - Первая строки:  
    Surface: <ExactSurfaceItemName>  
    Stability: FROZEN
  - Опционально: Invariant: <INV-ID>
- В SURFACE.md для [FROZEN] указывайте Proof → путь к этим файлам.

Частые ошибки и как их избежать
- Изменили Frozen без Pressure/Proof → отклоняйте, добавьте Migration Block и тесты.
- «Широкий патч» (несколько целей) → разделите на независимые Intent.
- Нет сценарного теста → добавьте один вертикальный путь (моки разрешены).
- Нет Exit у решения → держите Draft, не Freeze.

Ссылки
- Спецификация: docs/hds-spec.md
- Компакт: docs/hdf-compact-spec.md
- LLM-протокол: docs/llm-protocol.md
- Политика Proof: docs/proof-policy.md
- Стадии и ворота: docs/stages-and-gates.md

