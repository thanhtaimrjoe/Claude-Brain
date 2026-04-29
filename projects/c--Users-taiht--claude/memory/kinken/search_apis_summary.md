---
name: kinken_search_apis_summary
description: Comparison of KINKEN Search Platform API and UI API usage patterns.
type: project
---
Two API surfaces to describe:

1) Search Platform API (backend search service)
- Method: POST
- Example path: `/api/search-platform/v1/documents`
- Auth: `api_key` header
- Purpose: richer and more flexible search queries for indexed documents

2) UI API (product-facing)
- Method: GET
- Example path: `/api/v1/documents`
- Typical query params:
  - `page=1`
  - `q=<keyword>`
  - `limit=2`
  - `document_type=description`
- Auth: `api_key` header
- Purpose: simplified list/search endpoint with pagination for UI use

How to apply:
- For interview narratives, explain why both APIs exist (UX simplicity vs search flexibility).
- For troubleshooting, compare query params, pagination, and filter behavior between endpoints.
