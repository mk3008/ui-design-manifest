---
type: Extraction Rubric
title: Pagination first-pass rubric
description: Review gates for source-blind pagination handoffs.
status: draft
source: authored
scope: Reusable method.
---

# Review checks

| Check | Pass condition |
| --- | --- |
| Complete observation | Every schema axis has a classification and knowledge owner. |
| Mode restraint | Known-total page-indexed and unknown-total cursor-oriented modes remain distinct. |
| Unknown-total default | No total, page count, jump, first/last, or page size appears without a Contract input. |
| Availability restraint | Previous and next availability is declared without data-access mechanics. |
| Placement restraint | Right-aligned grid-footer placement is an authored default, not a source claim. |
| Contract completeness | Ordering stability, refresh/invalidation, and cross-page selection scope have product owners. |
| Source boundary | The repository bundle contains no identity, link, capture, copied value, or evidence reference. |
