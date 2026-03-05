# HDS LLM Seed — usage guide (RU/EN)

Что это
- Два файла‑зерна (RU/EN), которые дисциплинируют LLM в рамки HDS, чтобы быстро собрать минимальную голограмму и дальше вести изменения безопасно.

Файлы
- RU: docs/hds-llm-seed-ru.md
- EN: docs/hds-llm-seed-en.md

Как использовать (новый проект)
1) Подготовьте контекст для LLM:
   - Вставьте целиком RU или EN Seed (по выбору).
   - Добавьте свою исходную спецификацию/требования (если есть).
2) Первый запрос к LLM:
   - Попросите “Bootstrap minimal Hologram using the Seed; output only Org typed blocks”.
   - LLM должен начать с блока вопросов (# +begin_question); ответьте.
3) План → Патч → Проверка:
   - Получите #+begin_plan (должен содержать Change Gate, список файлов и, если Frozen, Migration).
   - После подтверждения — #+begin_answer с содержимым файлов (SURFACE.md, HOLO.md, tests/*).
   - Запустите проверки локально:
     - ./tools/holo-verify.sh
     - ./tools/surface-lint.sh
     - ./tools/docs-link-check.sh
     - тесты
   - Попросите #+begin_verify с краткой сводкой и следующими шагами.
4) Итерации:
   - На любом FAIL действуйте по Failure micro‑loop из Seed: Surface → Tests → Code; без расширения Intent.

Как использовать (существующий проект)
1) Положите Seed в контекст и кратко опишите текущее состояние (какие файлы есть/нет, где боль).
2) Попросите провести “Surface drift check” и синхронизацию: LLM предложит #+begin_plan с точечными правками.
3) Если Frozen затрагивается — Seed потребует Migration‑блок; не удаляйте существующие v1‑тесты.

Контракт вывода (строго)
- Только Org typed blocks:
  - #+begin_question … #+end_question
  - #+begin_plan … #+end_plan
  - #+begin_answer … #+end_answer
  - #+begin_commands … #+end_commands
  - #+begin_verify … #+end_verify
- Внутри #+begin_answer каждый файл — отдельный #+begin_src text … #+end_src с указанием “File: <path>” строкой выше.

Пример начального промпта (RU)
- “Возьми docs/hds-llm-seed-ru.md как норматив. Вот краткая постановка/спецификация: <вставьте>. Сгенерируй минимальную голограмму (SURFACE, HOLO, тесты), соблюдая порядок Surface→Proof→Code, выводи только Org‑блоки. Начни с #+begin_question.”

Example initial prompt (EN)
- “Use docs/hds-llm-seed-en.md as normative. Here is my brief spec: <paste>. Bootstrap a minimal hologram (SURFACE, HOLO, tests) following Surface→Proof→Code. Output Org typed blocks only. Start with #+begin_question.”

Проверка (локально/CI)
- Выполните:
  - ./tools/holo-verify.sh
  - ./tools/surface-lint.sh
  - ./tools/docs-link-check.sh
  - запустите тесты
- Все должны завершиться OK; иначе — вернитесь к LLM с журналом и попросите #+begin_plan корректировок (One‑Intent).

Полезные ссылки
- Seed (RU): docs/hds-llm-seed-ru.md
- Seed (EN): docs/hds-llm-seed-en.md
- LLM‑протокол: docs/llm-protocol.md
- Быстрый старт: docs/quickstart-5min.md
