---
name: project_kinken_function_design
description: KINKEN core functional design including search flows, pickup/limited mode UX.
type: project
originSessionId: b37d84e1-f8b9-48d3-b090-b3afc2a6deca
---

# KINKEN Function Design

## Main Functional Pillars

1. Authentication and authorization by user type
2. Product search
3. Document search
4. Product-specific document browsing
5. Product identification flows for 7 exterior categories
6. Data collection, indexing, analytics, and external integrations

## User Types and Access

| User Type | Authentication | Data Visibility |
|-----------|---------------|-----------------|
| Internal | Azure/EntraID | Full access based on role |
| Partner | EAA | Partner-relevant data only |
| Business | MyLIXIL | Business-specific documents |
| General | None | Browse only; detail/preview/download requires MyLIXIL |

## Search Behavior

### Product Search

- Keyword search with autocomplete
- Category filtering (7 exterior categories)
- Sales-term filters
- Visibility control from PIM flags

### Document Search

- Cross-tool and per-tool tabs
- Score-based ordering (hybrid: morphological + semantic)
- Filters: document type, category, date range
- Preview, download, and detail transitions
- Product-document lists (documents related to specific product)

## Pickup Mode

**Trigger**: When document keyword search matches product names using all valid keywords together.

**Behavior**:
- Matching products are highlighted above search results
- Clicking a product moves user into product-filtered document list

**Example**:
```
User searches: "アルミサッシ 窓"
→ System finds products matching both keywords
→ Shows products in pickup section
→ User clicks product → filtered document list
```

## Limited Mode

**Trigger**: When full AND matching does not find a product, but exactly one keyword finds product candidates.

**Behavior**:
- System enters limited mode
- User can narrow document search around that product
- One-character keywords are ignored for mode detection

**Example**:
```
User searches: "アルミ 窓 修理"
→ Full match: no products
→ "アルミ" alone: finds products
→ Enter limited mode with "アルミ" products
→ User can refine search
```

## Interpretation

These modes improve UX when users search for documents using terms that are actually product names or partially product-oriented queries. The system intelligently detects product context and guides users to relevant documents.

## Interview Talking Points

| Feature | BrSE Explanation |
|---------|------------------|
| Pickup mode | "When users search for documents but use product names, we show matching products first to help them narrow down quickly." |
| Limited mode | "If partial keywords match products, we guide users into a product-filtered view instead of showing irrelevant results." |
| Hybrid search | "We combine morphological analysis (kuromoji) with semantic search (OpenAI embeddings) and rerank with RRF for best results." |
