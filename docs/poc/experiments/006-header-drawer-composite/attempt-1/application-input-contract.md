---
type: Application Input Contract
title: Header–Drawer composite application input contract
description: Product-owned inputs required to apply a bounded composite policy.
status: draft
source: authored
---

# Static calibration inputs

Use a left Drawer with `inline` presentation, `content-displaced` relation, and `no-backdrop`. State persistence, viewport mapping, focus, keyboard, and motion are unresolved and must not be simulated.

| Witness | Initial / allowed state | Sole controller and placement | Controlled region / accessible relationship |
| --- | --- | --- | --- |
| `A-open` | `expanded`; `[expanded, fully-hidden]` | Header, leading position | `header-drawer-a`; name `Open navigation`; `aria-expanded=true`; `aria-controls=header-drawer-a`. |
| `A-hidden` | `fully-hidden`; `[expanded, fully-hidden]` | Header, leading position | `header-drawer-a`; name `Open navigation`; `aria-expanded=false`; `aria-controls=header-drawer-a`. |
| `B-open` | `expanded`; `[expanded, icon-rail]` | Drawer, interior top edge | `drawer-b`; name `Change navigation visibility`; `aria-expanded=true`; `aria-controls=drawer-b`. |
| `B-rail` | `icon-rail`; `[expanded, icon-rail]` | Drawer, interior top edge | `drawer-b`; name `Change navigation visibility`; `aria-expanded=false`; `aria-controls=drawer-b`. |

For the exercised patterns, an unknown controller placement or accessible relationship means stop for decision; do not omit the sole controller. Pattern A has `header-hidden` selection and `fully-hidden` closure. Pattern B has `drawer-rail` selection and `icon-rail` closure. Duplicate independent controllers are prohibited.

# Neutral fixture inputs

Use the same Header title `Workspace` and navigation in every witness: expanded parent `Parent A` with child `Child A`, top-level leaf `Leaf A`, independent direct item `Direct A`, and current/non-current comparison with current item `Parent A`. Other rows are non-current. Pattern B retains two named shortcuts, `Home` and `Files`, each with a meaningful inline `currentColor` SVG. Use no caption, badge, count, permission, status, or product identity.
