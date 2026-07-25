---
type: Application Input Contract
title: Result-card application inputs
description: Product-owned inputs and omission rules for applying the result-card Manifest.
status: draft
source: authored
scope: One result-card collection.
---

# Required inputs

| Input | Owner supplies | If absent |
| --- | --- | --- |
| Host width | Host-assigned width and outer spacing responsibility | Stop for layout decision. |
| Collection | Ordered records and collection state | Render no cards. |
| Card identity and title | Allowed identity and title values; title destination if navigable | Omit dependent card or title link. |
| Summary and metadata slots | Permitted summary values, captions, and ordering | Omit unsupplied slots. |
| Selection model and state | Multi-select availability, selected IDs, source of truth, update trigger, accessible names | Omit selection controls. |
| Activation and navigation | Whether activation exists and valid destinations | Do not make the card body interactive. |
| Optional actions, media, and status | Values, destinations, state model, and display condition | Omit each optional region. |
| Card sizing and wrapping | Minimum/maximum sizing and wrapping policy | Use authored compact equal-width wrapping fallback. |
| Pagination relation | Whether pagination exists, its state, and update trigger | Omit pagination. |

# Neutral fixture

Use at least six cards with placeholder-only labels and no domain labels, invented statuses, or counts. Include selected and unselected states. Use a visible title, restrained metadata, no decorative media, an upper-right checkbox, and a left-aligned incomplete final row. The fixture demonstrates slots only; it supplies no business identity, status, aggregate, or destination.

# Unresolved behavior

The owner decides empty, loading, failure, overflow, responsive transformation, focus, keyboard, announcements, bulk actions, inline actions, selection updates, and title navigation updates. If an input is unresolved, omit the dependent UI or stop for a decision; do not invent a fallback.
