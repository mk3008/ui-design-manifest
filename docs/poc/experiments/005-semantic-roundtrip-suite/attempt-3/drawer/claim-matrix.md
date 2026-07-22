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

# Future evaluation conditions for unresolved axes

These are source-observation conditions, not C1-C8 implementation-evaluation results. They do not alter the frozen fixture or infer a runtime result from the open static state.

| Axis | Observation status | Bounded missing evidence | Smallest later input or verification condition | Owner |
| --- | --- | --- | --- | --- |
| Presentation mode | unresolved | A single open state cannot establish whether the Drawer overlays or persistently occupies layout. | A paired visibility state at the same viewport that shows the adjacent workspace response. | Product owner / evaluator |
| Closed representation | not observed | No closed Drawer is represented. | One closed-state image at the same viewport. | Product owner / evaluator |
| Toggle location | observed | The open-state compact control is visibly inside the Drawer; its operation is not established. | No additional input for the visible location; a bounded interaction sequence is needed only to evaluate operation. | Product owner / evaluator |
| Persistence | unresolved | No state-retention evidence is represented. | A bounded sequence that changes context and shows whether Drawer state is retained. | Product owner / evaluator |
| Responsive behavior | unresolved | Only one wide viewport is represented. | One narrow-viewport image of the same Drawer state. | Product owner / evaluator |
| Focus behavior | unresolved | No focused state or keyboard sequence is represented. | One focused-state image plus a bounded keyboard sequence. | Product owner / evaluator |
| Motion | unresolved | No transition sequence is represented. | One bounded interaction recording that includes the relevant transition. | Product owner / evaluator |
| Overflow behavior | unresolved | No content-pressure or clipped/scrolling condition is represented. | One same-viewport overflow-pressure state with the Drawer content exceeding its available region. | Product owner / evaluator |
| Accessibility semantics | unresolved | Visual evidence cannot establish names, relationships, current-state exposure, or disclosure semantics. | Semantic inspection of the rendered control and navigation structure. | Implementer / accessibility reviewer |
| Contrast conformance | unresolved | Visual evidence does not establish measurable contrast or forced-colors behavior. | Contrast and forced-colors inspection of the rendered result. | Implementer / accessibility reviewer |
