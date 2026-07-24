---
type: Observation Schema
title: Pagination observation schema
description: Required axes and ownership classifications for bounded pagination observation.
status: draft
source: authored
scope: Reusable method.
---

# Required axes

Complete every row as `observed`, `not observed`, `unresolved`, or `not applicable`. Ownership is one of `observed`, `inferred`, `authored default`, `context pattern`, or `target-product input`.

| Axis | Record | Static-evidence limit |
| --- | --- | --- |
| Mode and data certainty | Known-total page-indexed, unknown-total cursor-oriented, or unresolved | Do not convert one mode into the other. |
| Total count and pages | Presence, absence, or uncertainty | No invented total or page count. |
| Visible range | Supplied local range or its absence | Do not calculate a range. |
| Current page or local position | Visible locator and editing affordance | Do not infer direct navigation. |
| Previous/next and disabled states | Each control and its visible availability | Do not infer availability rules. |
| First/last controls | Presence and state | Presence is not a default. |
| Arbitrary navigation | Page input, jump, or none | Do not add a jump. |
| Page size | Selector and current presentation | Do not add a selector. |
| Placement and alignment | Relation to controlled content and alignment | No fixed dimensions. |
| Attachment | Toolbar, footer, or other host relationship | Do not infer host behavior. |
| Top/bottom/sticky duplication | Visible placement instances | Do not duplicate controls. |
| Compact and responsive behavior | Visible transformation | Unshown breakpoints remain unresolved. |
| Loading, error, and empty states | Visible state treatment | Do not invent state UI. |
| Focus, keyboard, and accessibility | Visible names or states | Do not infer interactions or announcements. |
| Stable geometry | Fixed-width or shift-prevention evidence | No measurement claim. |
| Ordering and cursor invalidation | Product-provided refresh condition | Do not expose or invent cursor mechanics. |
| Contract inputs | Product-owned values and state model | Missing input omits dependent UI. |

# Authored default

When the Contract does not establish a known total, use an unknown-total cursor-oriented presentation: previous and next controls only, a supplied local position or visible range when available, explicit availability, and right-aligned grid-footer placement. Omit total/page count, arbitrary jump, first/last controls, and page size unless the Contract supplies them.
