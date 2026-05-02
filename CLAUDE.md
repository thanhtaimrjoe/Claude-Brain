# CLAUDE.md — Global Workspace Config

## Who I am
- Role: QA Engineer (Manual Testing, Bug Logging, Regression, Data Validation)
- Background: UI / API / Database layer testing
- Career goal: Transitioning to Fresher BrSE (Bridge SE)
- Languages: Vietnamese (primary), Japanese (professional + study), English (technical)

## Active Projects
| Project | Context | Workspace |
|---------|---------|-----------|
| KINKEN  | Document/product search system (LIXIL) — interview prep | Browser workspace A |
| WORKLOG | Work logging system — interview prep | Browser workspace B |
| Japanese Study | Notion vocabulary DB, SRS practice | Personal |

## Language Rules
- Talk to me in: **Vietnamese**
- Code comments: **English**
- Bug reports: **100% English**
- Japanese client messages: always include **Vietnamese translation**
- Japanese study output: include reading (furigana) + Vietnamese meaning

## Output Preferences
- Structured explanations with clear logical flow
- Data tables: copyable format (Markdown table or TSV)
- Bug reports: Title / Steps / Expected / Actual / Severity
- When debugging system behavior: trace the data pipeline step by step

## Notion Integration
- Japanese vocabulary DB: 自習の言葉
- SRS statuses: Mới gặp → Đang Học → Từng Nghe → Cần Review → Master
- New vocab entry fields: word, reading, meaning_vi, example_jp, status

---

## 🧠 Workflow Rules (MANDATORY — Read before acting)

### 1. Project Storage — NEVER use global memory for project content
| Project | Knowledge base path |
|---------|-------------------|
| KINKEN | `/Users/taiht/.claude/projects/kinken/` |
| WORKLOG | `/Users/taiht/.claude/projects/worklog/` |
| Global memory | `MEMORY.md` — only for career, preferences, Japanese study |

> ⚠️ RULE: Spec/feature/architecture notes MUST go into the correct project folder, NOT into `MEMORY.md`.

---

### 2. Task: "Read a file and note important info"

**Trigger keywords:** "đọc file", "note lại", "lưu thông tin", "update spec", "ghi chú"

**Before writing ANYTHING, always run this checklist:**

**Step 1 — Identify the project**
- Does the content mention KINKEN keywords? (LIXIL, Elasticsearch, document search, PIM) → project = KINKEN
- Does the content mention WORKLOG keywords? (TeamSpirit, work log, 入退館, 工数, worktime, PC operation log) → project = WORKLOG
- If unclear → ask the user before proceeding

**Step 2 — Find the right folder**
```
KINKEN structure:
  01_project/      → project background, goals
  02_architecture/ → system design, tech stack, data flow
  03_features/     → feature specs, UI behavior
  04_progress/     → sprint, progress tracking
  05_interview/    → interview prep

WORKLOG structure:
  overview/        → system overview
  features/        → feature specs (function list, worktime, etc.)
  architecture/    → technical design decisions
```

**Step 3 — Search for existing file FIRST**
```bash
find /Users/taiht/.claude/projects/<PROJECT>/ -name "*.md" | sort
```
- If a file clearly covers the same topic → **UPDATE that file**, do not create new
- If no matching file exists → create a new file in the most appropriate subfolder

**Step 4 — Write**
- Update or create the file with clear structure (heading, table, bullet points)
- Use English for file content (per Code Style Rules)
- Add `**Updated:** YYYY-MM-DD` at top if updating existing file

---

### 3. Task: "Translate or explain a Japanese document"

**Trigger:** user pastes JP text, or says "dịch", "giải thích tài liệu này"

- Always provide: JP original → Vietnamese translation → key terms extracted
- If domain = KINKEN or WORKLOG → offer to save key terms to the correct project folder
- If vocabulary is useful for Japanese study → offer to add to Notion DB 自習の言葉

---

### 4. Memory index — MEMORY.md is an index, not a storage
- `/Users/taiht/.claude/MEMORY.md` stores: career facts, preferences, Japanese study progress only
- Do NOT dump spec content, meeting notes, or feature details into `MEMORY.md`
- If adding a new global memory point, add a reference line to `MEMORY.md`. Do not create a new `memory/` folder.