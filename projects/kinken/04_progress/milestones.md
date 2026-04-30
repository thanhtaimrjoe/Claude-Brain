---
name: project_kinken_milestones
description: Key milestones, decisions, and timeline for KINKEN project.
type: project
---

# KINKEN Project Milestones

## Timeline Overview

```
2025 Q2: Foundation & Planning
2025 Q3: Design & PoC Development
2025 Q4: Development & Testing
2026 Q1: System Test & PROD Preparation
2026 Q2: PROD Release (SPRINT 25)
```

## Key Decisions Timeline

| Date | Decision | Impact |
|------|----------|---------|
| 2025/05-06 | **Documentation Strategy** | Avoid double maintenance, use Markdown over Excel |
| 2025/05-06 | **ETL Evaluation** | Compare Databricks vs Data Fusion vs Dataflow |
| 2025/05-06 | **Clean Architecture** | Standardize backend development pattern |
| 2025/08 | **API Architecture** | Choose REST over GraphQL/gRPC |
| 2025/08 | **Search Approach** | Hybrid (morphological + semantic) with RRF |
| 2025/08 | **Authentication Model** | Multi-tier: Azure/EntraID, EAA, MyLIXIL |
| 2025/08 | **ETL Strategy** | Databricks for analysis, Data Fusion for ingest |
| 2025/09 | **PoC Benchmark Issue** | Non-deterministic vector search identified |
| 2025/09 | **Document Preview** | React-PDF for PDF, Office files problematic |
| 2025/10-12 | **Development Phase** | Core feature implementation |
| 2026/01-03 | **System Testing** | UI/API/DB/ES layer testing |
| 2026/04 | **PROD Preparation** | Final testing, performance tuning |

## Critical Case Studies

### 1. PoC Benchmark Discrepancy (SPRINT 6)

**Problem**: Search results differed between old and new PoC despite same data.

**Root causes**:
1. Embedding vector non-determinism
2. HNSW algorithm randomness
3. ES version mismatch (not recorded)

**Lesson learned**: Always lock and record infrastructure versions.

**Impact**: Established version control protocol for all infrastructure components.

### 2. ETL Tool Selection (SPRINT 4)

**Options evaluated**:
- **Databricks**: Strong analysis, weak ingest
- **Cloud Data Fusion**: Strong ingest, high cost, low-code
- **Cloud Dataflow**: Real-time/batch, high learning curve

**Decision**: Databricks for ETL/analysis, Data Fusion for ingest.

**Rationale**: Leverage existing team skills, cost-effective for batch processing.

### 3. API Architecture (SPRINT 7)

**Options**:
- **GraphQL**: Flexible queries, but N+1 problem, poor caching
- **gRPC**: Fast, but browser debugging difficult
- **REST**: Good enough, excellent caching, easy debugging

**Decision**: REST API.

**Rationale**: Fits client-server model, leverages HTTP caching, easier maintenance.

### 4. Authentication Strategy

**User types**:
- Internal: Azure/EntraID
- Partner: EAA
- Business: MyLIXIL
- General: Public browsing only

**Decision**: Multi-tier authentication with API Gateway (Apigee) enforcement.

**Impact**: Secure, scalable access control for different user groups.

## Technical Debt Decisions

| Decision | Trade-off |
|----------|-----------|
| **No Office file preview** | Avoid complex conversion, focus on PDF |
| **Delta update over full reindex** | Faster updates, but more complex logic |
| **Hybrid search (RRF)** | Better results, but higher computational cost |
| **Two API layers** | Simplicity vs flexibility trade-off |

## QA Perspective Milestones

| Date | QA Focus | Outcome |
|------|----------|---------|
| 2025/08 | **Filter logic validation** | Edge cases identified, test cases created |
| 2025/09 | **Document link testing** | Broken links fixed, redirect logic validated |
| 2025/10 | **ES behavior testing** | Search accuracy benchmarks established |
| 2025/11 | **Data validation** | Data quality issues identified and fixed |
| 2026/01 | **Performance testing** | Response time targets validated |
| 2026/03 | **Regression testing** | Pre-PROD full regression suite executed |

## BrSE-Specific Milestones

| Date | BrSE Activity | Outcome |
|------|---------------|---------|
| 2025/06 | **Document translation** | Technical docs translated JP ↔ EN ↔ VN |
| 2025/08 | **Requirement clarification** | Ambiguous specs clarified with GW |
| 2025/09 | **Stakeholder communication** | Regular updates between MOR and LIXIL |
| 2025/10 | **Technical explanation** | Complex concepts explained to non-technical stakeholders |
| 2026/01 | **Progress reporting** | Sprint progress translated and reported |

## Future Milestones (To be updated)

| Sprint | Planned Activities |
|--------|-------------------|
| SPRINT 20-25 | PROD preparation, performance tuning, security audit |
| Post-release | Monitoring, bug fixes, feature enhancements |
