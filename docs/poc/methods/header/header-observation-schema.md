---
type: Observation Schema
title: Global Header stable observation schema
description: Stable axes and vocabularies for bounded Header extraction.
status: active
source: authored
---

# Vocabulary

Observation status is exactly `observed`, `not observed`, `unresolved`, or `not applicable`. Source-blind provenance is exactly `observed`, `method-default`, or `product input required`. Status says what the visual scope establishes; provenance says why a reusable statement is allowed. They are never interchangeable.

# Stable axes

| Axis | What may be recorded |
| --- | --- |
| Region responsibility and boundary | Global Header versus page-local context, breadcrumb, local navigation, Drawer body, and content. |
| Required identity | Required title slot and its visual prominence; content value is a product input. |
| Optional roles | Independent navigation, search, utility, account, and Drawer-control roles. |
| Composition | Reading order, grouping, density, spacing relationships, surface, divider, and on-header contrast. |
| Icon responsibility | Meaningful inline `currentColor` SVG and the interactive control's accessible name. |
| Drawer trigger seam | Presence, placement, treatment, controlled role, target, and independent side input. |
| Drawer-owned concerns | Content, presentation, current visibility, closed representation, persistence, and transition. |
| Static-image limits | Responsive, focus, keyboard, motion, overflow, targets, and behavior. |
| Contract gaps | Values, optional roles, ordering/grouping, icon semantics, Drawer inputs, viewport, and unresolved handling. |

# Required interpretation

Header may specify a visible trigger only as a Header control. It must not claim Drawer content or state. A generic icon does not identify a target side. If a source does not visibly establish a seam, record the trigger, target, side, and state as `unresolved` or `not observed`, then require a Contract decision before application.
