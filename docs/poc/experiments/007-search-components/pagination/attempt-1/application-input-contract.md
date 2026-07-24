---
type: Application Input Contract
title: Pagination application inputs
description: Product-owned and neutral-fixture inputs for one static pagination relationship.
status: draft
source: authored
scope: One result-grid footer navigation relationship.
requires:
  - manifest
---

# Required ownership

The application owner supplies mode, display values, state model, and update behavior. Missing input omits its dependent control or value.

| Slot | Required input | Omission rule |
| --- | --- | --- |
| Mode | Known-total page-indexed or unknown-total cursor-oriented | Do not mix modes or choose one from presentation alone. |
| Local display | Optional local position and visible range with display condition | Omit the absent value. |
| Previous and Next | Availability, accessible names, source of truth, display condition, and update trigger | Omit the dependent control; do not infer behavior. |
| Totals | Optional total count and page count with display condition | Omit both values when absent. |
| Direct navigation | Optional page target, allowed range, and update behavior | Omit jump and first/last controls when absent. |
| Page size | Optional options, selected value, and update behavior | Omit the selector when absent. |
| Ordering and refresh | Stable unique ordering requirement plus invalidation and refresh policy | Stop for product direction; do not expose keys or cursors. |
| Cross-page selection | Selection scope and invalidation policy | Do not represent cross-page selection. |
| Placement | Host relationship and alignment | Use the authored grid-footer default only for unknown-total mode. |

# Neutral fixture contract

Use only these abstract slots for a static reconstruction:

| Field | Required supplied value |
| --- | --- |
| Mode | Unknown-total cursor-oriented. |
| Local display | One placeholder local position or range. |
| Navigation | Enabled Previous and enabled Next with placeholder accessible names. |
| Boundary state | A second static state with Previous disabled because no backward cursor or history is supplied, or Next disabled because no next records are available. |
| Placement | One right-aligned control attached in the grid footer. |

# Explicitly unresolved interaction

This Contract declares no data access, total, page count, direct navigation, first/last navigation, page-size change, loading, empty/error state, focus, keyboard, announcements, persistence, motion, responsive behavior, or sticky duplication. Omit dependent behavior rather than infer it.

# Relationships

Use with the [Manifest](manifest.md) and [apply instruction](apply-instruction.md).
