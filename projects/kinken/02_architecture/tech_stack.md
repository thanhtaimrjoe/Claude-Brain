---
name: project_kinken_tech_stack
description: Final technical stack, non-functional requirements, and baseline metrics for KINKEN.
type: project
originSessionId: b37d84e1-f8b9-48d3-b090-b3afc2a6deca
---

# KINKEN Technical Stack

## Final Technical Stack

| Layer | Technology |
|-------|------------|
| Backend | Python 3.13 + FastAPI |
| Frontend | TypeScript + React + Next.js |
| Batch/ETL | Python + Pandas/PySpark on Databricks |
| Search Engine | Elasticsearch 9.x on Elastic Cloud |
| Search Approach | Morphological + Semantic hybrid, reranked with RRF |
| Embeddings | OpenAI text-embedding-3-large |
| Tokenizer | kuromoji_tokenizer |
| PDF Preview | React-PDF |

## Authentication Model

| User Type | Authentication Method |
|-----------|----------------------|
| Internal users | Azure/EntraID |
| Partner users | EAA |
| Business users | MyLIXIL |
| API consumers | REST APIs with API key auth via Apigee |

## Non-Functional Requirements

| Requirement | Target |
|-------------|--------|
| Availability | 99.9% |
| Planned maintenance | Several hours downtime allowed |
| Recovery (with data restore) | Within 1 business day |
| DB backup | Nightly, retention 7 days |
| Environment separation | Prod fully separated from dev/test |
| Responsive design | PC and smartphone supported |
| Security | Vulnerability assessment required before public release |

## Scale Baseline

| Metric | Value |
|--------|-------|
| Documents at initial release | ~13 million |
| Product-code master records | ~8.8 million |
| Past QA records | ~1.7 million |
| Target response time (average) | ~3 seconds |
| Target response time (WEB catalog) | ~4 seconds |

## Key Architecture Decisions

### Why Hybrid Search (Morphological + Semantic)?

- **Morphological (kuromoji)**: Handles Japanese text segmentation accurately
- **Semantic (Vector)**: Captures meaning beyond keyword matching
- **RRF (Reciprocal Rank Fusion)**: Combines both approaches for optimal results

### Why Databricks for ETL?

- Strong data analysis capabilities
- Good integration with GCP
- Team familiarity with Python/PySpark
- Cost-effective for batch processing vs real-time
