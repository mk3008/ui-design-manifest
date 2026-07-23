---
type: Application Input Contract
title: Header–Drawer composite application input contract
description: Product-owned inputs required to apply a bounded composite policy.
status: draft
source: authored
---

# Required declarations

| Slot | Required declaration | Unknown handling |
| --- | --- | --- |
| `patternSelection` | `header-hidden` or `drawer-rail`; adaptive or always-visible cases are separately classified. | Stop for decision. |
| `drawerSide` | `left` or `right`. | Stop for decision. |
| `initialState` and `allowedStates` | One declared initial state and only valid states for the selected policy. | Stop for decision. |
| `triggerOwner` and `triggerPlacement` | The single authoritative owner region and placement for each state. | Omit dependent control. |
| `closedRepresentation` | `fully-hidden` for Pattern A or `icon-rail` for Pattern B. | Stop for decision. |
| `presentation`, `contentDisplacement`, `backdrop` | Independent product declarations. | Use pre-existing product fallback or stop. |
| `viewportMapping` | Optional mapping from viewport to declared mode; no inferred breakpoint. | Mark unresolved. |
| `persistence` | Product-owned retention rule. | Mark unresolved. |
| `accessibleControlRelationship` | Accessible name, controlled region identifier, and expanded-state relationship for each control. | Omit dependent control. |

`drawerShortcutIcons` is required only for Pattern B and declares neutral labels plus meaningful inline `currentColor` SVG semantics. The Contract must prohibit duplicate independent controllers unless an explicit synchronization contract identifies the authoritative control per state.
