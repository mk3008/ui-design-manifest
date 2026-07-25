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
| `A-open` | `expanded`; `[expanded, fully-hidden]` | Header, stable leading slot; stable title anchor | `header-drawer-a`; name `Open navigation`; `aria-expanded=true`; `aria-controls=header-drawer-a`. |
| `A-hidden` | `fully-hidden`; `[expanded, fully-hidden]` | Header, same stable leading slot; same title anchor | `header-drawer-a`; name `Open navigation`; `aria-expanded=false`; `aria-controls=header-drawer-a`. |
| `B-open` | `expanded`; `[expanded, icon-rail]` | Drawer, interior top edge at trailing/top edge; left-pointing collapse chevron | `drawer-b`; name `Compact navigation`; `aria-expanded=true`; `aria-controls=drawer-b`. |
| `B-rail` | `icon-rail`; `[expanded, icon-rail]` | Drawer, interior top edge; right-pointing expand chevron | `drawer-b`; name `Expand navigation`; `aria-expanded=false`; `aria-controls=drawer-b`. |

For the exercised patterns, an unknown controller placement or accessible relationship means stop for decision; do not omit the sole controller. Pattern A has `header-hidden` selection and `fully-hidden` closure, with the Header slot and title anchor stable across its paired witnesses. Pattern B has `drawer-rail` selection and `icon-rail` closure: its one Drawer control compacts left with a left-pointing chevron and expands right with a right-pointing chevron. An X-shaped affordance is reserved only for an explicitly contracted full dismissal with no retained rail. Duplicate independent controllers are prohibited.

# Neutral fixture inputs

Use the same Header title `Workspace` and navigation in every witness: expanded parent `Parent A` with child `Child A`, top-level leaf `Leaf A`, independent direct item `Direct A`, and current/non-current comparison with current item `Parent A`. Other rows are non-current. Expanded navigation rows have no supplied leading semantic icon slots and must omit leading icons. The expanded parent visibly exposes its child relationship with a trailing expanded disclosure affordance; because this calibration supplies no product asset, the neutral default is a simple downward chevron implemented as inline `currentColor` SVG. Navigation rows are square with no corner rounding. Pattern B retains two named shortcuts, `Home` and `Files`, each with a meaningful inline `currentColor` SVG. Use no caption, badge, count, permission, status, or product identity.
