---
name: kinken_elasticsearch
description: Elasticsearch concepts, aggregations, and optimization used in KINKEN.
type: project
---

# KINKEN Elasticsearch

## Core Concepts

### Index

**Two meanings**:

1. **Noun**: Like a "Table" in traditional databases
   - Example: `products` index contains product information
   - Example: `documents` index contains document metadata

2. **Verb (Indexing)**: The action of loading data into Elasticsearch and analyzing it for fast search
   - Similar to creating a "Table of Contents" in a book

### Mapping (Schema)

Declares data types for each field:
- `title` → text (analyzed for search)
- `price` → number
- `vector` → dense_vector (for semantic search)

### Query DSL (Domain Specific Language)

Elasticsearch's query language written in JSON format:

```json
{
  "query": {
    "bool": {
      "must": [
        { "match": { "title": "アルミサッシ" } }
      ],
      "filter": [
        { "term": { "category": "exterior" } }
      ]
    }
  }
}
```

## Aggregations (`aggs`)

Server-side summary computations executed with search queries. They produce grouped or metric results without returning every matching document.

### Common Aggregation Types

| Type | Purpose | Example |
|------|---------|---------|
| `terms` | Group and count by field value | Count documents per category |
| `avg`, `min`, `max`, `sum` | Metric calculations | Average price, max date |
| `filter` | Compute summaries for subset | Count only "technical" docs |

### Performance Guidance

| Issue | Solution |
|-------|----------|
| High-cardinality buckets | Expensive; keep `size` bounded |
| Slow aggregations | Use `keyword` fields, not `text` |
| Latency diagnosis | Profile with/without aggs to isolate cost |

## KINKEN-Specific Optimizations

### Hybrid Search (Morphological + Semantic)

```json
{
  "query": {
    "bool": {
      "should": [
        { "match": { "title": { "query": "アルミサッシ", "analyzer": "kuromoji" } } },
        { "knn": { "field": "title_vector", "query_vector": [...], "k": 10 } }
      ]
    }
  }
}
```

**RRF (Reciprocal Rank Fusion)**: Combines scores from both approaches.

### Index Alias Strategy

Enables zero-downtime reindexing:

```
1. Create new index: documents_v2
2. Reindex data into documents_v2
3. Switch alias: documents → documents_v2
4. Delete old index: documents_v1
```

### Segment Bloat

**Problem**: Elasticsearch marks documents as deleted but doesn't remove them immediately, causing disk bloat.

**Solution**: Run `_forcemerge` to compact segments.

## Case Study: PoC Benchmark Discrepancy

**Problem**: Search results differed between old and new PoC despite same data.

**Root causes investigated**:
1. **Embedding vector non-determinism**: Same text may produce slightly different vectors
2. **HNSW algorithm randomness**: Index structure varies between builds
3. **ES version mismatch**: Old PoC version not recorded
4. **Sharding differences**: Global vs shard-level search

**Lesson learned**: Always lock and record infrastructure versions.

## Interview Talking Points

| Topic | Explanation |
|-------|-------------|
| Why Elasticsearch? | "Fast full-text search for 13M documents with Japanese morphological analysis" |
| Aggregations | "Server-side summaries for faceted search without returning all documents" |
| Hybrid search | "Combines keyword matching with semantic understanding for better results" |
| Zero-downtime reindex | "Use alias switching to update index without service interruption" |
