---
type: Application Input Contract
title: Drawer static navigation inputs
description: Bounded semantic inputs required to render the declared static Drawer relationship.
status: draft
source: authored
scope: Static Drawer evidence only; it authorizes no runtime behavior.
requires:
  - manifest
  - fixture-trace
---

# Required semantic slots

| Slot | Required value or decision | State model | Display condition | Update trigger |
| --- | --- | --- | --- | --- |
| `drawer_presentation` | `visible` for the one bounded static state | Evidence-only static state; application owner owns any runtime state model. | Render this Drawer exercise. | Not exercised. |
| `navigation_item` | At least one application-provided item with a display label and `is_current` state. | Application owner supplies the source of truth for the current item. | Render the declared item in the Drawer. | Not exercised. |
| `navigation_destination` | Provide a target only when an application requirement authorizes a destination. | Application owner owns destination validity. | Omit activation when no target is supplied. | Not exercised. |
| `entry_icon_responsibility` | Optional semantic support for the declared navigation item. | No icon state is assumed. | Render only when application input supplies the responsibility. | Not exercised. |

# Missing or intentionally absent inputs

No destination, grouping, caption, hierarchy, aggregate, identity context, persistence, closing control, or responsive rule is supplied. Omit dependent UI or stop for the application owner's decision; do not create a fallback.

# Accessibility constraint for an exercised icon slot

If `entry_icon_responsibility` is exercised, it may communicate only the already-declared navigation responsibility. Use an accessible, non-checkbox-shaped SVG or icon treatment with an application-provided accessible name or equivalent text relationship. Do not use a square or checkbox-like placeholder, and do not infer an icon meaning.

# Relationships

The neutral exercise values are disclosed in [Fixture trace](fixture-trace.md); they fill these slots only and are not product data.
