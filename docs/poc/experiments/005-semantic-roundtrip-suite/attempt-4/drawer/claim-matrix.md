---
type: Semantic Claim Matrix
title: Drawer method-default reconstruction claims
description: Independently reviewable source-blind Drawer relationships and guarded defaults.
status: draft
source: authored
requires:
  - manifest
  - application-input-contract
  - fixture-trace
scope: Static primary navigation Drawer review.
---

# Required claims

| ID | Relationship group | Provenance | Required visual-intent claim | Contract condition | Witness | Structural or semantic re-extraction condition | Pre-implementation status |
| --- | --- | --- | --- | --- | --- | --- |
| `C1` | Expandable parent, structural child, and disclosure default | method-default | The declared parent structurally owns its declared child group and uses the guarded meaningful inline `currentColor` SVG chevron/caret, right when collapsed and down when expanded. | Declared expandable parent and child; `disclosureIndicatorTreatment` is `unresolved/not observed`. | `F-parent-disclosure` | Re-extraction identifies actual nested parent-to-child structure, not visual indentation alone; semantic inspection confirms expanded-state synchronization. | not exercised |
| `C2` | Top-level leaf | product input required | The declared top-level leaf remains a direct destination with no child group or disclosure state. | Declared top-level leaf in `navigationItems`. | `F-direct-roles` | Re-extraction identifies a top-level direct row and no fabricated parent or caption. | not exercised |
| `C3` | Independent/direct item | product input required | The declared independent/direct item remains distinct from the top-level leaf and is not represented as a group or child. | Declared independent/direct item in `navigationItems`. | `F-direct-roles` | Re-extraction identifies an independent direct row without invented topology. | not exercised |
| `C4` | Current/non-current comparison and accent default | method-default | The declared current item has a restrained straight leading semantic-accent indicator, a non-color distinction, and programmatic current state compared with non-current rows. | Declared `currentDestination`; `currentAccentTreatment` is `unresolved/not observed`; `targetSemanticAccentToken` is supplied. | `F-current-comparison` | Re-extraction identifies current/non-current distinction; semantic inspection confirms programmatic current state. | not exercised |
| `C5` | Drawer visibility control/trigger responsibility | product input required | The declared compact control is separate from navigation rows and retains its supplied discernible name and application-owned responsibility. | Declared `drawerVisibilityControl`. | `F-control-boundary` | Re-extraction identifies a separate control; semantic inspection confirms its supplied name and ownership boundary. | not exercised |
| `C6` | Repeated row rhythm | observed | Comparable navigation rows retain restrained repeated scan rhythm without becoming decorative cards. | Declared static Drawer scope and fixture rows. | `F-rhythm-edge` | Re-extraction identifies comparable repeated rows at both supplied capture sizes. | not exercised |
| `C7` | Drawer edge | observed | The Drawer remains quietly distinct from its adjacent workspace and rows relate to its edge rather than floating as cards. | Declared static Drawer scope and adjacent workspace. | `F-rhythm-edge` | Re-extraction identifies the Drawer-to-workspace boundary at both supplied capture sizes. | not exercised |
| `C8` | Meaningful SVG and accessibility responsibility | method-default | The `C1` fallback is an inline meaningful `currentColor` SVG synchronized with expanded state; it is not a text glyph, square placeholder, or checkbox-like mark. | `C1` Contract condition applies. | `F-parent-disclosure` | Semantic inspection confirms inline SVG treatment, parent-owned accessible synchronization, and no placeholder substitution. | not exercised |

# Constraints and unresolved axes

`C1` and `C8` never apply to a caption or leaf and never create an expandable parent. `C4` never creates a current item and must not copy a color value, dimension, rounded-pill treatment, or geometry. Runtime axes remain `unresolved/not observed` and are not exercised by this bundle.
