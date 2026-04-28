---
name: project_kinken_function_design_summary
description: Summary of KINKEN basic function design including auth, product/document search, product-doc flows, and pickup/limited mode UX.
type: project
originSessionId: b37d84e1-f8b9-48d3-b090-b3afc2a6deca
---
Main functional pillars:
- Authentication and authorization by user type.
- Product search.
- Document search.
- Product-specific document browsing.
- Product identification flows for 7 exterior categories.
- Data collection, indexing, analytics, and external integrations.

User types and access:
- Internal, partner, business, and general users have different authentication methods and data visibility.
- General users can browse much of the site, but technical document detail/preview/download requires MyLIXIL authentication.

Search behavior:
- Product search supports keyword, category, sales-term filters, and visibility control from PIM flags.
- Document search supports cross-tool and per-tool tabs, score-based ordering, filters, preview, download, and detail transitions.
- Product-document lists let users view documents related to one specific product.

Pickup mode:
- When a document keyword search also matches product names using all valid keywords together, matching products are highlighted above results.
- Clicking a product moves the user into a product-filtered document list.

Limited mode:
- If full AND matching does not find a product, the system checks each keyword separately.
- If exactly one keyword finds product candidates, the system enters limited mode and lets the user narrow the document search around that product.
- One-character keywords are ignored for mode detection.

Interpretation:
- These modes improve UX when users search for documents using terms that are actually product names or partially product-oriented queries.
