---
name: kinken_elasticsearch_aggs_summary
description: Elasticsearch aggregations fundamentals and practical optimization points used in KINKEN context.
type: project
---
Elasticsearch aggregations (`aggs`) are server-side summary computations executed with search queries.
They produce grouped or metric results without returning every matching document.

Common aggregation types:
- `terms`: group and count by field value
- Metrics: `avg`, `min`, `max`, `sum`
- `filter`: compute summaries for a constrained subset

Performance guidance:
- Aggregations become expensive with high-cardinality buckets.
- Prefer `keyword` fields for grouping.
- Keep `terms` bucket `size` bounded.
- Profile with and without aggs to separate retrieval cost from summary-computation cost.

How to apply:
- In performance incidents, isolate whether latency comes from hit retrieval or aggregations.
- In interviews, present aggs as a key tool for faceted search and analytics-style summaries.
