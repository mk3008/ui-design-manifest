---
type: Coverage Classification
title: Drawer role and relationship coverage
description: Bounded classification of visible Drawer roles retained for source-blind reconstruction review.
status: draft
source: mixed
requires:
  - claim-matrix
scope: Open wide Drawer state only.
---

# Coverage inventory

| Candidate role or relationship | Coverage status | Retained source-independent relationship | Claim or omission |
| --- | --- | --- | --- |
| Expandable parent with shown children | observed and retained | Parent, disclosure relationship, and shown child remain distinct. | `C1` |
| Top-level leaf with no shown children | observed and retained | Direct top-level role remains distinct from a parent. | `C2` |
| Child navigation item | observed and retained | Shown child is distinguished through nesting beneath its parent. | `C1` |
| Independent/direct navigation item | observed and retained | Independent row is a direct destination, not an invented group. | `C3` |
| Selected and non-selected comparable-item contrast | observed and retained | Current item is visibly distinct from comparable rows. | `C4` |
| Drawer trigger and its declared responsibility | observed and retained | Compact icon-only control is separate from rows; application owns name, state, and operation. | `C5` |
| Repeated row rhythm | observed and retained | Comparable rows form a stable compact scan rhythm. | `C6` |
| Relationship to the Drawer region edge | observed and retained | Drawer is quietly bounded from the adjacent workspace; rows do not become floating cards. | `C7` |

# Classification boundaries

No non-destination group or group caption is retained. No badge, count, permission, destination meaning, icon family, or closed-state behavior is classified from this bounded state. Source-observation coverage above is distinct from the following pre-implementation evaluation status.

# Source-observation inventory

Each row below uses exactly one source-observation status. It is independent from both the retained-relationship coverage above and the C1-C8 implementation evaluation below. Only an explicitly unresolved or not-observed row needs additional evidence; visible hierarchy, spacing, caption absence, icon presence, edge, and compact-control relationships are established by the bounded state.

| Observation axis | Status | Bounded observation or missing evidence | Smallest later input or condition |
| --- | --- | --- | --- |
| Region responsibility | observed | A dedicated navigation region is visibly separate from the adjacent work surface. | None for this visible relationship. |
| Presentation and orientation | observed | The open Drawer visibly provides vertical orientation alongside the work surface. Runtime presentation mode is classified separately. | None for this visible orientation relationship. |
| Role inventory | observed | Parent, shown child, top-level leaf, independent/direct row, current row, and compact icon-only control are visibly distinguishable. | None for these visible roles. |
| Hierarchy and disclosure | observed | Parent-to-shown-child nesting and an expanded relationship are visible. Disclosure operation is not established by the still state. | Bounded interaction sequence only if operation must be evaluated. |
| Current and non-current comparison | observed | A current row is visibly distinguishable from comparable non-current rows. | Semantic inspection later if programmatic exposure must be evaluated. |
| Grouping and caption presence or absence | observed | No non-destination group caption or group container is visible in this bounded state. This is not a universal prohibition. | Another declared state only if a later product question concerns captions or groups. |
| Density, spacing, and scan rhythm | observed | Repeated rows form a compact, stable scan rhythm. | None for this visible relationship. |
| Outer edge and surface relation | observed | The Drawer is quietly bounded from the adjacent work surface; rows are related to that edge. | None for this visible relationship. |
| Icon responsibility | unresolved | Visible icons do not establish semantic responsibility, accessible naming, or asset approval. | Semantic inspection plus an approved product or fixture asset decision. |
| Trigger boundary | observed | A compact interior control is visibly separate from navigation rows. Its operation is not inferred. | Bounded interaction sequence only if operation must be evaluated. |
| Closed representation | not observed | No closed Drawer representation is shown. | One closed-state image at the same viewport. |
| Presentation axis independence | unresolved | One open state cannot determine overlay versus persistent layout behavior. | Paired visibility state at the same viewport showing workspace response. |
| Closed-representation axis independence | not observed | No closed state is represented. | One closed-state image at the same viewport. |
| Toggle-location axis independence | observed | The compact control is visibly located inside the open Drawer; no operation is inferred. | None for location; bounded interaction sequence for operation only. |
| Persistence axis independence | unresolved | State retention is not visible. | Context-change sequence that exposes retention or reset behavior. |
| Accessibility semantics | unresolved | Still imagery cannot establish programmatic names, current-state exposure, disclosure linkage, or keyboard semantics. | Semantic inspection plus keyboard test of a rendered result. |
| Responsive behavior | unresolved | No alternate viewport is represented. | One narrow-viewport image of the same declared Drawer state. |
| Focus behavior | unresolved | No focused control or keyboard sequence is represented. | Focused-state image plus bounded keyboard sequence. |
| Motion | unresolved | No transition sequence is represented. | Bounded interaction recording that includes the relevant transition. |
| Overflow behavior | unresolved | No content-pressure, clipping, or scrolling condition is represented. | Same-viewport overflow-pressure state. |
| Application Input Contract inputs | not applicable | Product-owned labels, destinations, state models, and approved assets are application inputs rather than source-observation facts. | Supply the relevant contract slot before application. |

# Pre-implementation evaluation status

| Claim | Implementation evaluation status | Boundary |
| --- | --- | --- |
| `C1` | not exercised | Await rendered nesting witness. |
| `C2` | not exercised | Await rendered top-level leaf witness. |
| `C3` | not exercised | Await rendered independent/direct witness. |
| `C4` | not exercised | Await rendered current/non-current witness. |
| `C5` | not exercised | Await rendered control-boundary witness and contract inspection. |
| `C6` | not exercised | Await rendered repeated-rhythm witness. |
| `C7` | not exercised | Await rendered region-edge witness. |
| `C8` | not exercised | Await rendered one-SVG witness and semantic inspection. |

The detailed reasons, required inputs, next conditions, and owner for every entry are in [the claim matrix](claim-matrix.md#pre-implementation-evaluation-classification).
