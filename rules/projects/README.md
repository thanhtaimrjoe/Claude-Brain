# Project-Specific Rules

Các quy tắc riêng cho từng dự án trong workspace của bạn.

---

## 📋 Mục lục

- [KINKEN](#kinken)
- [WORKLOG](#worklog)
- [Japanese Study](#japanese-study)

---

## KINKEN

### Overview
Document search system cho LIXIL metal products (13M docs, 8.8M product records).

### Tech Stack
- Backend: Python 3.13 + FastAPI
- Frontend: TypeScript + React + Next.js
- Search: Elasticsearch 9.x + OpenAI embeddings
- ETL: Databricks + Pandas/PySpark
- Auth: Azure/EntraID, EAA, MyLIXIL

### Key Rules

#### 1. Search Behavior
| Mode | Trigger | Behavior |
|------|---------|----------|
| **Pickup Mode** | All keywords match products | Highlight products above results |
| **Limited Mode** | One keyword matches products | Guide to product-filtered view |
| **Normal Mode** | No product match | Standard search results |

#### 2. API Endpoints
| Type | Method | Path | Purpose |
|------|--------|------|---------|
| UI API | GET | `/api/v1/documents` | Simplified search for UI |
| Search Platform API | POST | `/api/search-platform/v1/documents` | Advanced queries |

#### 3. Data Flow
```
PIM → CSV → DB → Elasticsearch → API → UI
```

#### 4. Testing Focus
- Filter logic (product/document search)
- Document links (broken links detection)
- ES behavior (search accuracy, performance)
- Data validation (PIM → DB → ES pipeline)

#### 5. BrSE Communication
- Translate technical docs: JP ↔ EN ↔ VI
- Clarify ambiguous requirements
- Bridge communication between GW and MOR
- Document decisions (ADR format)

### Common Tasks

| Task | Command/Action |
|------|----------------|
| Update sprint tracking | Use `/kinken-update` skill |
| Add vocabulary to Notion | Use `/notion-vocab` skill |
| Look up terms | Use `/glossary-lookup` skill |
| Mock interview practice | Use `/interview-mock` skill |

---

## WORKLOG

### Overview
Work logging system cho cá nhân.

### Key Rules

#### 1. Log Format
```
Date: YYYY-MM-DD
Project: [project-name]
Task: [task-description]
Time: [hours]
Notes: [additional-notes]
```

#### 2. Categories
- Development
- Testing
- Documentation
- Meetings
- Research
- Other

#### 3. Privacy
- Personal data không share
- Work-related info có thể chia sẻ với team

---

## Japanese Study

### Overview
Notion vocabulary DB + SRS practice cho tiếng Nhật.

### Database: 自習の言葉

#### Schema
| Field | Type | Required |
|-------|------|----------|
| word | Title | ✓ |
| reading | Text | ✓ |
| meaning_vi | Text | ✓ |
| example_jp | Text | ✓ |
| example_vi | Text | - |
| status | Select | ✓ |
| category | Select | - |

#### SRS Status Flow
```
Mới gặp → Đang Học → Từng Nghe → Cần Review → Master
```

#### Categories
- KINKEN (Technical terms from project)
- General (Common vocabulary)
- Business (Professional Japanese)
- Technical (Specific domains)

### Key Rules

#### 1. Vocabulary Entry Format
```
Word: 見込み
Reading: みこみ
Meaning (VI): Chiều sâu khung cửa
Example (JP): この窓の見込みは120mmです。
Example (VI): Chiều sâu của cửa sổ này là 120mm.
Status: Mới gặp
Category: KINKEN
```

#### 2. Learning Workflow
1. **Mới gặp**: Vừa học, cần review thường xuyên
2. **Đang Học**: Đã thấy 2-3 lần, hiểu cơ bản
3. **Từng Nghe**: Đã nghe/đọc trong ngữ cảnh
4. **Cần Review**: Bắt đầu quên, cần ôn lại
5. **Master**: Ghi nhớ lâu dài, tự động recall

#### 3. Japanese Study Agent Usage
- "Giải thích từ X" → Full explanation với furigana
- "Thêm từ X vào Notion" → Add với format chuẩn
- "Tạo example cho X" → Example sentences từ KINKEN

---

## Quick Reference

| Project | Main Agent | Main Skill |
|---------|------------|------------|
| KINKEN | japanese-study, interview-prep | kinken-update, notion-vocab |
| WORKLOG | - | - |
| Japanese Study | japanese-study | notion-vocab |

---

## Integration Matrix

| Action | KINKEN | WORKLOG | Japanese Study |
|--------|--------|---------|----------------|
| Add to Notion | ✅ | - | ✅ |
| Mock interview | ✅ | - | - |
| Update tracking | ✅ | - | - |
| Glossary lookup | ✅ | - | ✅ |

---

**Last updated**: 2026-04-30  
**Version**: 1.0
