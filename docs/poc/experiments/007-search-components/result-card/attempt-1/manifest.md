---
type: Result-card Manifest
title: Bounded selectable result cards
description: Source-blind guidance for compact search-result cards in a wrapping gallery.
status: draft
source: mixed
scope: A small-to-moderate collection of independently identifiable records.
---

# Guidance

Use cards when object identity, heterogeneous summaries, visual comparison, or chunked browsing help users. Do not use cards for dense repetitive text that is better scanned in a table/list, particularly when users need column comparison, sorting, or rapid repeated-attribute scanning.

Present compact equal-width cards in a wrapping gallery within the width assigned by the host. Keep gaps consistent and leave an incomplete final row left aligned without stretching cards. The authored desktop default is a stable row-major Z order, left-to-right then top-to-bottom, matching DOM and visual order. Do not infer masonry or a narrow transformation.

Give every card a visible title and use a vertical I-shaped content hierarchy. Use one font family by default; express title/body/caption importance with restrained size and weight differences rather than exact tokens. Group metadata and retain visible captions whenever values are not self-explanatory. Omit decorative images; show media only when the Contract supplies meaningful media.

When multi-selection is supplied, put a checkbox in the upper right. Make selected and unselected cards distinguishable by more than color alone. If a card is selectable and navigable, its checkbox controls selection and a distinct title link controls navigation; do not assign both responsibilities to the whole card body. Omit inline action menus, badges, statuses, counts, images, destinations, and bulk actions unless the Contract supplies them.

# Unresolved

- Selection source of truth, update trigger, bulk actions, navigation destinations, activation, optional actions, pagination behavior, overflow, narrow transformation, focus, keyboard, announcements, empty, loading, and failure states.
- Product card dimensions, exact typography, surface tokens, labels, identities, summaries, metadata meanings, statuses, counts, and media.

# Relationships

Apply only with the [Application Input Contract](application-input-contract.md) and [apply instruction](apply-instruction.md).
