# KINKEN Update Skill

When user provides KINKEN Output Summary Report or mentions updating KINKEN project files, automatically execute the update workflow.

## Trigger Phrases

- "Update KINKEN với SPRINT X report"
- "Cập nhật KINKEN"
- "Output Summary Report SPRINT X"
- "KINKEN report mới"
- "Add SPRINT X to tracking"

## Auto-Execute Workflow

### Step 1: Extract Information

Parse the report for:
- **Sprint/Date**: Sprint number, date range
- **Progress**: FE/BE/ETL/QA/API/Infra status
- **Issues/Risks**: Blockers, dependencies, performance issues
- **Decisions**: Architecture, tool, process decisions
- **Next Steps**: Action items for next sprint
- **Domain Terms**: New JP/EN/VI terms to add to glossary

### Step 2: Identify Target Files

| Topic Keywords | Target File |
|----------------|-------------|
| ETL, Databricks, Data Fusion, Dataflow, pipeline, batch | `02_architecture/data_flow.md` |
| Elasticsearch, search, index, aggregation, vector, RRF, hybrid | `03_features/elasticsearch.md` |
| API, REST, GraphQL, gRPC, endpoint, versioning | `03_features/search_apis.md` |
| Authentication, auth, JWT, API key, Azure, EAA, MyLIXIL | `02_architecture/auth_model.md` |
| Document, PDF, preview, CloudRun, GCS, delivery | `02_architecture/doc_delivery.md` |
| Product, feature, search, pickup mode, limited mode | `03_features/function_design.md` |
| Sprint, progress, milestone, decision, case study | `04_progress/sprint_tracking.md` |
| Timeline, decision, architecture, lesson learned | `04_progress/milestones.md` |
| Technical term, JP/EN/VI, glossary | `05_interview/glossary.md` |
| Interview, BrSE, case study, talking point | `05_interview/case_studies.md` |

### Step 3: Update Files

#### For `02_architecture/data_flow.md`:
- Add new ETL decisions/challenges
- Update data volume if changed
- Add new transformation logic
- Document lessons learned

#### For `03_features/elasticsearch.md`:
- Add new search optimization techniques
- Document performance issues and solutions
- Update hybrid search strategy if changed
- Add new case studies

#### For `03_features/search_apis.md`:
- Add new API endpoints if any
- Update versioning strategy if changed
- Document API design decisions
- Add troubleshooting tips

#### For `02_architecture/auth_model.md`:
- Add new user types if any
- Update authentication flow if changed
- Document security decisions
- Add new access control rules

#### For `02_architecture/doc_delivery.md`:
- Update delivery architecture if changed
- Add new file types supported
- Document performance improvements
- Add security considerations

#### For `03_features/function_design.md`:
- Add new features or modes
- Update search behavior if changed
- Document UX improvements
- Add interview talking points

#### For `04_progress/sprint_tracking.md`:
- Add new section: `### Giai đoạn YYYY/MM/DD (Tương ứng SPRINT X)`
- Include: Progress, Issues, Decisions, Next steps
- Use bullet points with bilingual (business-technical) style
- Maintain chronological order

#### For `04_progress/milestones.md`:
- Add new decision to timeline table
- Add new case study if applicable
- Update QA/BrSE milestones
- Document trade-offs

#### For `05_interview/glossary.md`:
- Add only NEW terms not already in glossary
- Place in appropriate category
- Include JP + romaji + EN + VI
- Add context from KINKEN project

#### For `05_interview/case_studies.md`:
- Add new case study if significant decision/issue
- Follow format: Background → Problem → Investigation → Solution → My Role → Interview Talking Points
- Link to related files

### Step 4: Self-Check

Before reporting completion:
- [ ] Mốc ngày/sprint không mâu thuẫn
- [ ] Không duplicate terms trong glossary
- [ ] Section mới nằm đúng vị trí (chronological order)
- [ ] Format heading/bullet đúng chuẩn
- [ ] Links giữa các file chính xác
- [ ] Bilingual content (VN + EN) rõ ràng
- [ ] Không có typo hoặc lỗi ngữ pháp

### Step 5: Report to User

**Format**:
```
Đã cập nhật KINKEN:
- [file]: [what was added/updated]
- [file]: [what was added/updated]

Chi tiết:
[brief summary of changes]
```

## Example Usage

### Example 1: Sprint Report
**User**: "Update KINKEN với SPRINT 21 report. FE: Đã hoàn thành pickup mode. BE: Optimized ETL pipeline. QA: Test search accuracy. Issue: Performance issue với large dataset."

**Skill executes**:
1. Extracts: Sprint 21, FE progress, BE progress, QA progress, issue
2. Identifies targets: `04_progress/sprint_tracking.md`, `02_architecture/data_flow.md`, `03_features/elasticsearch.md`
3. Updates all files
4. Reports: "Đã cập nhật SPRINT 21 vào sprint_tracking.md, ETL optimization vào data_flow.md, performance issue vào elasticsearch.md"

### Example 2: Technical Term
**User**: "Add term 'Segment Bloat' vào KINKEN glossary. Definition: Hiện tượng ES bị phình to ổ cứng do cơ chế 'chỉ đánh dấu xóa chứ không xóa thật'."

**Skill executes**:
1. Extracts: Term, definition, category (Elasticsearch)
2. Identifies target: `05_interview/glossary.md`
3. Adds term to glossary
4. Reports: "Đã thêm 'Segment Bloat' vào glossary.md"

### Example 3: Case Study
**User**: "Add case study về ETL tool selection. Decision: Databricks cho analysis, Data Fusion cho ingest."

**Skill executes**:
1. Extracts: Case study content
2. Identifies targets: `04_progress/milestones.md`, `02_architecture/data_flow.md`
3. Updates both files
4. Reports: "Đã thêm case study ETL selection vào milestones.md và data_flow.md"

## Guardrails

| Rule | Reason |
|------|--------|
| Không đổi format tổng thể của file | Maintain consistency |
| Không xóa nội dung cũ trừ khi user yêu cầu | Maintain historical record |
| Luôn giữ bilingual (VN + EN) | Support both audiences |
| Không tự bịa thông tin | Only use provided data |
| Self-check trước khi báo xong | Ensure quality |

## Integration

- **Reference**: `/Users/taiht/.claude/projects/kinken/workflow_kinken_update_protocol.md`
- **Reference**: `/Users/taiht/.claude/projects/kinken/README.md`

---

**Last updated**: 2026-04-29
**Version**: 1.0
