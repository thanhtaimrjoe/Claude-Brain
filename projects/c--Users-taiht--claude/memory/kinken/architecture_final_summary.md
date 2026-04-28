---
name: project_kinken_architecture_final_summary
description: Final-phase summary of KINKEN technical architecture, non-functional requirements, and baseline metrics.
type: project
originSessionId: b37d84e1-f8b9-48d3-b090-b3afc2a6deca
---
Final technical stack:
- Backend: Python 3.13 + FastAPI.
- Frontend: TypeScript + React + Next.js.
- Batch/ETL: Python + Pandas/PySpark on Databricks.
- Search engine: Elasticsearch 9.x on Elastic Cloud.
- Search approach: morphological + semantic hybrid, reranked with RRF.
- Embeddings: OpenAI text-embedding-3-large.
- Tokenizer: kuromoji_tokenizer.
- PDF preview: React-PDF.

Authentication model:
- Internal users: Azure/EntraID.
- Partner users: EAA.
- Business users: MyLIXIL.
- Common Search Platform uses REST APIs with API key auth via Apigee.

Non-functional decisions:
- Availability target: 99.9%.
- Planned maintenance can allow several hours of downtime.
- Recovery target with data restore: within 1 business day.
- DB backup nightly, retention 7 days.
- Prod fully separated from dev/test.
- Responsive design supported for PC and smartphone.
- Vulnerability assessment required before public release.

Scale baseline:
- ~13 million documents at initial release.
- ~8.8 million product-code master records.
- ~1.7 million past QA records.
- Target response time: roughly 3 seconds on average, 4 seconds for WEB catalog document list.
