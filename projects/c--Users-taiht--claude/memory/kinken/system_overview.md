---
name: kinken_system_overview
description: KINKEN system purpose, architecture positioning, and interview-ready explanation.
type: project
---
KINKEN is a document search and browsing system with two API surfaces:
- UI-facing API for product screens and pagination
- Search Platform API for flexible document querying

Key purpose for interview explanation:
- Centralize and standardize LIXIL metal-product information.
- Help users find correct information quickly regardless of experience.
- Improve internal efficiency by reducing search time.
- Provide shared search capabilities so other internal systems can reuse a common platform.

Integration points:
- Search Platform endpoint: `POST /api/search-platform/v1/documents`
- UI endpoint: `GET /api/v1/documents?page=...&q=...&limit=...&document_type=...`

How to apply:
- Explain KINKEN as a reusable internal information-discovery platform.
- Distinguish clearly between UI convenience API and advanced search backend API.
