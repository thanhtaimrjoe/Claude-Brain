---
name: project_kinken_doc_delivery_cloudrun_summary
description: Summary of CloudRun-based document delivery design for serving PDF/HTML from GCS through CDN/LB origin path.
type: project
originSessionId: f60dbbd3-28db-43a4-ad97-6209b9c42de7
---
Purpose of the document:
- Validate whether PDF and HTML documents stored on GCS can be downloaded/referenced via Cloud Run APIs.
- Clarify request routing and avoid incorrect server-to-server assumptions through the existing frontend path.

Key points:
- Cloud Run fetches targeted document content from GCS and returns it as API response.
- URL rewrite conventions map external paths to GCS object paths.
- Example mappings:
  - `/api/docs/technical/files/...` -> `gs://lixil-kinken-docs-{env}/docs/technical/files/...`
  - `/api/docs/technical/html/...` -> `gs://lixil-kinken-docs-{env}/docs/technical/html/...`
- Intended request path is Akamai CDN -> Load Balancer (origin) -> Backend Service (Cloud Run), without forcing application frontend mediation.
- The document references prior QnA and design diagrams/meeting memos as supporting context.

Processing flow:
1. Client requests document URL (PDF/HTML).
2. CDN forwards to LB origin rule.
3. LB routes to Cloud Run backend service.
4. Cloud Run resolves rewritten path to GCS object path.
5. Cloud Run reads object from GCS and returns content to client.

Interview questions:
- Why is Akamai/LB-to-CloudRun direct routing preferred over going through the frontend server in this use case?
- What are the security and authorization checkpoints when exposing GCS-backed document delivery APIs?
- How would you handle caching strategy differences between PDF binary and HTML + static asset bundles?
- What failure modes can occur in URL rewrite mapping and how do you detect them early?
- How would you ensure environment separation (`{env}`) does not accidentally leak production documents?
