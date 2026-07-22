---
type: Fixture Trace
title: Neutral Drawer method-default witnesses
description: Minimal synthetic values for static relationship exercise.
status: draft
source: authored
requires:
  - application-input-contract
  - claim-matrix
scope: Generated static evidence only.
---

# Frozen neutral fixture inputs

| Slot | Neutral fixture value |
| --- | --- |
| `navigationItems` | `parent-a` / `Parent A` is the declared expandable parent with `child-a` / `Child A`; `leaf-a` / `Leaf A` is a top-level leaf; `direct-a` / `Direct A` is an independent direct item. Order: parent, child, leaf, direct. |
| `expandedParents` | `[parent-a]`; this shown-child state is fixture-supplied. |
| `currentDestination` | `parent-a`; the other rows are non-current comparators. |
| `disclosureIndicatorTreatment` | `unresolved/not observed`; the declared parent triggers only the explicit disclosure method-default. |
| `currentAccentTreatment` | `unresolved/not observed`; the declared current item triggers only the explicit current-item method-default. |
| `targetSemanticAccentToken` | `semantic-accent`; a neutral token name, not a color value. |
| `drawerVisibilityControl` | Present once at the interior top edge, named `Change navigation visibility`; its operation is not evaluated. |

# Witness map

| Witness | Relationship exercised | Required static evidence |
| --- | --- | --- |
| `F-parent-disclosure` | Declared parent, child, and guarded disclosure method-default. | Open capture makes parent, child, nesting, chevron direction, and expanded state inspectable. |
| `F-current-comparison` | Declared current item and guarded current-item method-default. | Open capture makes the straight leading accent and non-color comparison inspectable; semantic inspection confirms current state. |
| `F-direct-roles` | Top-level leaf and independent direct item. | Open capture makes both direct roles visible without a caption or group. |
| `F-control-boundary` | Declared `drawerVisibilityControl` and its application-owned responsibility. | Open capture makes the control separate from navigation rows; semantic inspection confirms its supplied name and ownership boundary. |
| `F-rhythm-edge` | Repeated rows and Drawer region edge. | Wide and narrow captures make rhythm and the quiet region boundary inspectable. |
