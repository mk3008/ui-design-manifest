---
type: Extraction Template
title: Pagination extraction template
description: Source-blind handoff shape for bounded business-list pagination.
status: draft
source: authored
scope: Reusable method.
---

# Handoff shape

- **Manifest:** selected mode, previous/next relationship, availability presentation, optional local position/range, and attachment/alignment.
- **Application Input Contract:** mode, local position/range, previous/next availability, optional totals and page-index inputs, ordering stability, refresh/invalidation policy, cross-page selection scope, and omission rule.
- **Apply instruction:** use only the Manifest and Contract; make no product-data or interaction decisions.

# Information-loss rule

Retain bounded navigation relationships and presentation roles. Exclude original labels, values, counts, names, destinations, exact dimensions, capture details, source identity, and implementation mechanics. Do not encode data-access queries or keys.
