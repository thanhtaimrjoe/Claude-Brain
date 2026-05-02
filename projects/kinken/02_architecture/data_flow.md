---
name: project_kinken_data_flow
description: KINKEN data pipeline from PIM to UI, including ETL process and data transformation.
type: project
---

# KINKEN Data Flow

## High-Level Pipeline
### GCS Bucket Transfer Architecture
Files flow between buckets before being processed by Databricks:
- **Service**: Google Cloud Storage Transfer Service.
- **Flow**: Collection Bucket (Raw) -> ETL Bucket (Ready for Databricks).
- **Transformation**: Path mapping is ideally handled by the source (PIM). If source cannot change path structure, a **Cloud Function** will be used as a custom transfer agent to remap directory structures.

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
| AI Outage Fallback | If OpenAI is down, stop all processing from Embedding step onwards (do not ingest partial data). Rerun the process once the service recovers. |
| Cross-Environment Mapping | Use Natural Keys (String codes) in Bronze. Transform to Surrogate Keys (System IDs) in Silver. Re-run mapping jobs in each environment to handle ID mismatch between Dev/Stg/Prod. |

## Processing Performance Challenges (Scale: 13M Docs / 8.8M Products)

### Case Study: Web Catalog OCR Bottleneck (SPRINT 19)

**Problem**: Processing ~700,000 files for Web Catalog created a huge bottleneck in the Data Pipeline during the v1.4 full import prep.

**Impact**: Delayed the availability of data for Performance Testing and restricted the ability to run "End-to-End" jobs for unstructured data.

**Mitigation Strategy**: 
1. Separate "Heavy" AI jobs (OCR/Embedding) from "Fast" structured data jobs (PIM import).
2. Provide a mapping table for Testers to run specific jobs manually on Databricks based on data type.

### Case Study: Diff Migration ETL Workaround (SPRINT 23)

**Problem**: During the crunch time of Diff Data Migration before Production release, the AI processing (OCR/Embedding) for 4,000 Technical documents threatened the timeline.

**Mitigation Strategy (Database State Hack)**: 
1. Run pipeline for Technical data up to Silver layer.
2. Manually update tracking DB status from `ready_for_ocr` to `ready_for_gold`.
3. Resume pipeline. This bypassed the slow Unstructured Data processing while successfully importing all Structured Data (Metadata) to the UI.

## Data Consistency Challenges

### Case Study: Dirty Data from External Source (SPRINT 23)

**Problem**: QA team discovered incorrect Part-search data on Production. Root cause was identified as the upstream source providing corrupted data.

**Resolution**: Upstream source provided a full clean data dump. Instead of using Delta Update, the team executed a **Hard Delete** of all existing Parts data on Production before doing a Full Import to prevent logic corruption. (Required extreme caution to not delete cross-table data).

### Case Study: PoC Benchmark Discrepancy

**Problem**: Search results differed between old and new PoC despite same data.

**Root causes investigated**:
1. Embedding vector non-determinism
2. HNSW algorithm randomness in index creation
3. Elasticsearch version mismatch (not recorded in old PoC)

**Lesson learned**: Always lock and record infrastructure versions for reproducibility.
