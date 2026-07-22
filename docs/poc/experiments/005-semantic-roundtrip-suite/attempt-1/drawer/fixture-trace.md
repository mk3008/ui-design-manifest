---
type: Fixture Trace
title: Drawer neutral fixture disclosure
description: Declares the single neutral value set permitted for static relationship evidence.
status: draft
source: authored
scope: Pre-implementation static evidence only.
requires:
  - application-input-contract
---

# Permitted fixture values

| Contract slot | Neutral synthetic value | Provenance | Permitted use | Prohibited inference |
| --- | --- | --- | --- | --- |
| `drawer_presentation` | `visible` | Explicit static-evidence fixture | Shows the bounded Drawer state. | Any closed, persistent, responsive, or interactive behavior. |
| `navigation_item.display_label` | `Destination` | Explicit static-evidence fixture | Fills the already-declared item label slot. | A product caption, identity, grouping, or hierarchy. |
| `navigation_item.is_current` | `true` | Explicit static-evidence fixture | Makes `current navigation state -> navigation destination` observable. | A source-derived selection scheme or update behavior. |
| `navigation_destination` | omitted | Contract decision | Keeps the item non-activating when no target is authorized. | A route, external target, or action. |
| `entry_icon_responsibility` | omitted | Contract decision | Leaves the icon slot not exercised. | An icon treatment, name, or meaning. |

The single item is a minimal static witness for the declared relationship. It does not state or imply a source item count, collection shape, or navigation hierarchy.
