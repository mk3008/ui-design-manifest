---
type: Application Input Contract
title: Drawer application inputs
description: Product-owned semantic slots needed to apply the retained Drawer relationships.
status: draft
source: authored
requires:
  - manifest
scope: Application of the primary navigation Drawer only.
---

# Required product-owned slots

The application owner supplies only the slots needed to exercise the retained relationships. Values, destinations, and topology are product-owned; this contract does not supply them.

| Slot | Required meaning | State model and omission rule |
| --- | --- | --- |
| `navigationItems` | A product-defined ordered collection of direct destinations, top-level leaves, and, when needed, expandable parents with their child destinations. | Each item supplies a product-owned discernible label and destination binding. Omit roles not supplied; do not add labels, groups, or entries. |
| `currentDestination` | The product-owned identity of the current destination, if one is applicable. | The owner supplies source of truth, allowed values, display condition, and update trigger. Without it, render no current-state emphasis. |
| `expandedParents` | The product-owned set of parents whose supplied children are currently shown. | The owner supplies source of truth, allowed values, display condition, and update trigger. Without it, do not invent shown children or disclosure state. |
| `drawerVisibilityControl` | An optional product-owned control for changing navigation-region visibility. | The owner supplies its discernible name, operation, source of truth, display condition, and update trigger. If absent, omit the control; no closed state is implied. |
| `semanticIcon` | An optional meaningful icon for a declared item or control role. | Supply an approved/project-available accessible SVG and its semantic responsibility. If unavailable, omit the icon; never add a dependency or placeholder. |

# Application constraints

The application may use neutral fixtures only for already-declared slots and only to demonstrate a relationship. A fixture cannot introduce product identity, a new caption, a count, permissions, an extra destination, or an unbound state.

For the isolated reconstruction, the exact synthetic values and asset decision are frozen in [the fixture trace](fixture-trace.md). They are harness inputs only and do not become product defaults.

Keep visibility axes independent. Presentation, closed representation, toggle location, and persistence require their own product inputs or remain unresolved. Current implementation and applicable requirements override this contract and [the Manifest](manifest.md).
