---
name: project_kinken_data_flow
description: KINKEN data pipeline from PIM to UI, including ETL process and data transformation.
type: project
---

# KINKEN Data Flow

## High-Level Pipeline

```
PIM → CSV Export → Cloud Storage (GCS) → Databricks ETL → PostgreSQL → Elasticsearch → API → UI
```

## Data Sources

| Source | Data Type | Volume |
|--------|-----------|--------|
| PIM (Product Information Management) | Product master data | ~8.8M records |
| QA Database | Quality assurance records | ~1.7M records |
| Document Storage | PDF/HTML documents | ~13M documents |

## ETL Process (Databricks)

### Extract
- Pull data from PIM via CSV export
- Fetch QA records from legacy database
- Collect document metadata from storage

### Transform
- Standardize format from PULL to PUSH structure
- Clean and validate data quality
- Generate embeddings for semantic search (OpenAI text-embedding-3-large)
- Apply kuromoji tokenization for Japanese text

### Load
- Index into Elasticsearch with proper mapping
- Store normalized data in PostgreSQL
- Maintain document links in GCS

## Key Transformation Decisions

| Decision | Rationale |
|----------|-----------|
| Delta Update vs Full Reindex | Prefer delta for efficiency; full reindex only when schema changes |
| Embedding generation | Done during ETL, not real-time, to reduce API latency |
| Index alias strategy | Enables zero-downtime reindexing |

## Data Consistency Challenges

### Case Study: PoC Benchmark Discrepancy

**Problem**: Search results differed between old and new PoC despite same data.

**Root causes investigated**:
1. Embedding vector non-determinism
2. HNSW algorithm randomness in index creation
3. Elasticsearch version mismatch (not recorded in old PoC)

**Lesson learned**: Always lock and record infrastructure versions for reproducibility.
