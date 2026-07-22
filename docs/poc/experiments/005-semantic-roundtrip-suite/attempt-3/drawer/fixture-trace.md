---
type: Fixture Trace
title: Neutral Drawer fixture witnesses
description: Minimal source-blind witnesses for retained relationships.
status: draft
source: authored
requires:
  - application-input-contract
  - claim-matrix
scope: Generated static reconstruction evidence only.
---

# Frozen fixture inputs

These are the complete, exact synthetic inputs for the isolated reconstruction. The four navigation rows are the minimum count needed to witness the retained parent, child, top-level leaf, independent/direct, current/non-current, rhythm, and edge claims; they do not reproduce an observed item count or topology.

| Slot | Frozen value |
| --- | --- |
| `navigationItems` | `parent-a` / `Parent A` is an expandable parent with exactly one shown child: `child-a` / `Child A`. `leaf-a` / `Leaf A` is a top-level leaf with no children. `direct-a` / `Direct A` is an independent/direct item with no children. Their visual order is parent, child, leaf, direct. |
| `expandedParents` | Exactly `[parent-a]`; the shown-child state is fixture-supplied only. |
| `currentDestination` | Exactly `parent-a`. The non-current comparators are `child-a`, `leaf-a`, and `direct-a`. |
| `drawerVisibilityControl` | Present exactly once at the Drawer’s interior top edge. Its accessible name is exactly `Change navigation visibility`; ownership is application-controlled. Its operation, closed representation, and persistence are not evaluated. |
| `semanticIcon` | Present exactly once on `drawerVisibilityControl`: a fixture-supplied inline SVG with `viewBox="0 0 16 16"`, `aria-hidden="true"`, and `focusable="false"`, containing three non-square parallel strokes. The named control carries the discernible meaning. No package, external asset, placeholder, or additional icon is allowed. |

# Witness map

| Witness | Frozen inputs exercised | Required generated evidence |
| --- | --- | --- |
| `F-parent-child` | `parent-a`, `child-a`, and `expandedParents` | One open Drawer image where parent, shown child, and nesting can be re-extracted. |
| `F-direct-leaf` | `leaf-a` and `direct-a` | One open Drawer image where both direct-row roles are visible without a caption. |
| `F-current-rhythm-edge` | All four navigation rows and `currentDestination` | One open Drawer image showing current/non-current contrast, repeated rows, and the quiet region boundary. |
| `F-control-boundary` | The one `drawerVisibilityControl` and its one frozen SVG | One open Drawer image plus semantic inspection proving the exact accessible name and application-controlled ownership. |

# Trace discipline

Generated evidence must be reviewed only against [the semantic claims](claim-matrix.md). It must not be compared by source labels, pixels, palette, asset family, or source-specific structure. A failed or absent witness identifies an application-input or implementation gap; it does not authorize invention.
