---
type: Application Input Contract
title: Drawer method-default exercise inputs
description: Product-owned declarations required before guarded defaults may apply.
status: draft
source: authored
requires:
  - manifest
scope: Static primary navigation Drawer only.
---

# Product-owned declarations

| Slot | Provenance | Required declaration | Omission rule |
| --- | --- | --- | --- |
| `navigationItems` | product input required | Ordered semantic items, including one declared expandable parent with one declared child, one top-level leaf, and one independent direct item for this fixture only. | Do not add captions, groups, items, or children. |
| `expandedParents` | product input required | The parent identities whose declared children are shown. | Without it, do not invent shown children or disclosure state. |
| `currentDestination` | product input required | One declared current item and the programmatic current-state mechanism. | Without it, render no current distinction. |
| `disclosureIndicatorTreatment` | unresolved/not observed | Indicator treatment is unobservable for the declared expandable parent. | Apply the Manifest method-default only because the parent is declared. |
| `currentAccentTreatment` | unresolved/not observed | Accent treatment is unobservable for the declared current item. | Apply the Manifest method-default only because the current item is declared. |
| `targetSemanticAccentToken` | product input required | The target product semantic accent token used by the current-item method-default. | Do not substitute a copied color value. |
| `drawerVisibilityControl` | product input required | Optional named control, its display condition, and application-owned state. | If absent, omit it; no closed state is implied. |

# Constraint

The Contract explicitly declares both guarded cases for this fixture. No other default is implied. Neutral fixtures exercise only these declared slots and do not become product defaults.
