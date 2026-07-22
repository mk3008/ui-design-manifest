---
type: Semantic Claim Matrix
title: Drawer reconstruction claims
description: Required source-blind visual-intent claims and their neutral witnesses.
status: draft
source: mixed
requires:
  - manifest
  - fixture-trace
scope: Static re-extraction review of the primary navigation Drawer.
---

# Required claims

| ID | Coverage relationship | Required visual-intent claim | Source-to-Manifest trace | Status | Neutral witness and re-extraction check |
| --- | --- | --- | --- | --- | --- |
| `C1` | Expandable parent with shown children | A supplied parent is distinguishable from its shown child, and nesting is visible without a fabricated group caption. | [Manifest hierarchy guidance](manifest.md#guidance) | required | `F-parent-child`; re-extractor identifies parent, shown child, and nesting from generated image. |
| `C2` | Top-level leaf with no shown children | A supplied top-level leaf remains a direct destination and is not represented as a parent. | [Manifest hierarchy guidance](manifest.md#guidance) | required | `F-direct-leaf`; re-extractor identifies a top-level direct row with no shown children. |
| `C3` | Independent/direct navigation item | A supplied independent/direct item is readable as a direct destination rather than an invented group or child. | [Manifest hierarchy guidance](manifest.md#guidance) | required | `F-direct-leaf`; re-extractor identifies the independent direct row. |
| `C4` | Selected and non-selected comparison | One supplied current item has a visible distinction from comparable non-current rows without a prescribed decorative treatment. | [Manifest current-state guidance](manifest.md#guidance) | required | `F-current-rhythm-edge`; re-extractor identifies comparable current and non-current rows. |
| `C5` | Drawer trigger and responsibility | A supplied compact icon-only control is separate from navigation rows at the interior top edge; its name and state responsibility are supplied by the application. | [Manifest control guidance](manifest.md#guidance) | required | `F-control-boundary`; image confirms separation and contract inspection confirms ownership. No operation is inferred from static evidence. |
| `C6` | Repeated row rhythm | Comparable navigation rows retain a stable, compact scan rhythm without becoming decorative cards. | [Manifest rhythm guidance](manifest.md#guidance) | required | `F-current-rhythm-edge`; re-extractor identifies repeated row rhythm and restrained row boundaries. |
| `C7` | Drawer region edge | The navigation region is quietly distinct from adjacent workspace, with rows related to its edge rather than floating as copied cards. | [Manifest region guidance](manifest.md#guidance) | required | `F-current-rhythm-edge`; re-extractor identifies Drawer/workspace boundary and edge relationship. |
| `C8` | Meaningful icon responsibility | The fixture-supplied inline SVG belongs to the one named icon-only control and does not replace that control’s discernible name. | [Manifest icon guidance](manifest.md#guidance) | required | `F-control-boundary`; rendered and semantic inspection confirm the single non-placeholder SVG and the exact control name. |

# Pre-implementation evaluation classification

This is implementation-evaluation status, not source-observation coverage. No HTML or generated evidence exists yet, so every required claim is `not exercised` rather than preserved by assertion.

| ID | Pre-implementation status | Reason | Required input | Next evaluable condition | Owner |
| --- | --- | --- | --- | --- | --- |
| `C1` | not exercised | No generated reconstruction exists. | Frozen `F-parent-child` inputs. | Rendered open Drawer image permits re-extraction of nesting. | Implementer |
| `C2` | not exercised | No generated reconstruction exists. | Frozen `F-direct-leaf` inputs. | Rendered open Drawer image permits re-extraction of the top-level leaf. | Implementer |
| `C3` | not exercised | No generated reconstruction exists. | Frozen `F-direct-leaf` inputs. | Rendered open Drawer image permits re-extraction of the independent/direct item. | Implementer |
| `C4` | not exercised | No generated reconstruction exists. | Frozen current and comparator inputs. | Rendered open Drawer image permits current/non-current comparison. | Implementer |
| `C5` | not exercised | No generated reconstruction exists. | Frozen control position, name, and ownership. | Rendered image and contract inspection permit control-boundary review. | Implementer |
| `C6` | not exercised | No generated reconstruction exists. | Frozen four-row fixture. | Rendered open Drawer image permits repeated-rhythm review. | Implementer |
| `C7` | not exercised | No generated reconstruction exists. | Frozen four-row fixture with adjacent workspace. | Rendered open Drawer image permits region-edge review. | Implementer |
| `C8` | not exercised | No generated reconstruction or semantic inspection exists. | Frozen one-SVG fixture and exact control name. | Rendered image plus semantic inspection permits meaningful-SVG review. | Implementer |

# Unexercised axes

Presentation mode, closed representation, persistence, responsive behavior, keyboard/focus behavior, animation, and contrast conformance are unresolved. They are not exercised and need the smallest additional state, viewport, sequence, or accessibility input appropriate to the axis. This is not evidence of their absence or of a default behavior.
