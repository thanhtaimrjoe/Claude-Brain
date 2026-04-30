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
- **Chunking Strategy**: For long unstructured text, split text into chunks based on Embedding Model token limits.
- Generate embeddings for semantic search (OpenAI text-embedding-3-large) - allowing multiple vectors per single record.
- Apply kuromoji tokenization for Japanese text - storing chunked morphological text as an array in a single field.

### Load
- **File Tracking Logic**: Uses `etl_tracking` table to detect diff files in buckets. Note: Overwriting existing files with same name will NOT trigger update.
- **Unified Job (End-to-End)**: Integrated OCR, Chunking, and Embedding into the main Bronze -> ES/RDB pipeline for system testing consistency.
- Index into Elasticsearch with proper mapping
- Store normalized data in PostgreSQL
- Maintain document links in GCS

## Key Transformation Decisions

| Decision | Rationale |
|----------|-----------|
| Delta Update vs Full Reindex | Prefer delta for efficiency; full reindex only when schema changes |
| Embedding generation | Done during ETL, not real-time, to reduce API latency. Text is chunked so 1 DB record = Multiple vectors in Index |
| Index alias strategy | Enables zero-downtime reindexing |

## Processing Performance Challenges (Scale: 13M Docs / 8.8M Products)

### Case Study: Web Catalog OCR Bottleneck (SPRINT 19)

**Problem**: Processing ~700,000 files for Web Catalog created a huge bottleneck in the Data Pipeline during the v1.4 full import prep.

**Impact**: Delayed the availability of data for Performance Testing and restricted the ability to run "End-to-End" jobs for unstructured data.

**Mitigation Strategy**: 
1. Separate "Heavy" AI jobs (OCR/Embedding) from "Fast" structured data jobs (PIM import).
2. Provide a mapping table for Testers to run specific jobs manually on Databricks based on data type.

## Data Consistency Challenges

### Case Study: PoC Benchmark Discrepancy

**Problem**: Search results differed between old and new PoC despite same data.

**Root causes investigated**:
1. Embedding vector non-determinism
2. HNSW algorithm randomness in index creation
3. Elasticsearch version mismatch (not recorded in old PoC)

**Lesson learned**: Always lock and record infrastructure versions for reproducibility.
