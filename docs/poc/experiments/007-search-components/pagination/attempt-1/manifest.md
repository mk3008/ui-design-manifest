---
type: Pagination Manifest
title: Bounded unknown-total pagination
description: Source-blind guidance for static previous and next navigation.
status: draft
source: mixed
scope: One result-grid footer navigation relationship.
---

# Guidance

For a Contract-declared unknown-total cursor-oriented mode, attach one pagination control after the result grid and right-align it in the grid footer. Present Previous and Next as the only universal navigation controls. Show a local position or visible range only when the Contract supplies it. Render availability explicitly: Previous is disabled when no backward cursor or history is supplied; Next is disabled when the Contract declares no next records.

Do not show a total count, total pages, direct page navigation, first/last controls, or page size unless the Contract explicitly supplies the corresponding mode and inputs. A known-total page-indexed presentation is a separate Contract-declared mode, not a fallback.

# Unresolved

- Product ordering, cursor lifecycle, refresh/invalidation, and cross-page selection scope.
- Loading, empty, error, focus, keyboard, announcements, persistence, motion, compact transformation, responsive behavior, and sticky duplication.
- Product labels, values, record count, page count, navigation destinations, and data-access mechanics.

# Relationships

Apply only with the [Application Input Contract](application-input-contract.md) and [apply instruction](apply-instruction.md).
