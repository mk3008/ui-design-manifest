---
type: Observation Record
title: Pagination calibration observation record
description: Source-blind classification of one bounded pagination state.
status: draft
source: mixed
scope: One navigation relationship for a result grid.
---

# Classification

`Observed` describes the bounded state only. `Authored default` is a reusable fallback, not a source claim. `Unresolved` needs product input or a smaller observation.

| Axis | Classification | Knowledge ownership | Retained result or limit |
| --- | --- | --- | --- |
| Mode and data certainty | observed | context pattern | An indeterminate-total presentation is visible; the source-aware mode is page-indexed, while the reusable default remains cursor-oriented. |
| Total count and pages | not observed | authored default | The neutral fixture omits total and page count. |
| Visible range | observed | observed | A local range is visible; fixture range is supplied, never calculated. |
| Current page or local position | observed | context pattern | A local locator is visible; arbitrary navigation is not retained. |
| Previous/next and disabled states | observed | observed | Boundary availability is visibly distinguished; fixture uses explicit supplied availability. |
| First/last controls | observed | context pattern | Visible controls are context only and omitted from the default. |
| Arbitrary navigation | observed | context pattern | A page locator is context only; no jump is retained. |
| Page size | observed | context pattern | A sizing presentation is context only and omitted by default. |
| Placement and alignment | observed | observed | Navigation is aligned to the right of its controlled surface. |
| Attachment | observed | observed | The control is attached after the controlled list surface. |
| Top/bottom/sticky duplication | not observed | authored default | Fixture uses one footer placement; no duplication or stickiness. |
| Compact and responsive behavior | unresolved | target-product input | No transformation is retained. |
| Loading, error, and empty states | not observed | target-product input | No state UI is retained. |
| Focus, keyboard, and accessibility | observed | observed | Controls expose visible disabled semantics; focus, keyboard, and announcements remain unresolved. |
| Stable geometry | unresolved | target-product input | No fixed-size or shift rule is retained. |
| Ordering and cursor invalidation | unresolved | target-product input | Stable ordering and refresh conditions require product ownership. |
| Contract inputs | observed | target-product input | Availability, local position/range, totals, direct navigation, sizing, ordering, refresh, and selection scope require declared owners. |

# Authored default

For unknown totals, use cursor-oriented Previous and Next only. Disable Previous when the Contract supplies no backward cursor or history; disable Next when the Contract says no next records are available, including a page-size-plus-one or equivalent determination. This describes a state relationship only and does not prescribe data access. Place the control right-aligned in the grid footer. Omit totals, page count, direct navigation, first/last, and page size unless supplied.
