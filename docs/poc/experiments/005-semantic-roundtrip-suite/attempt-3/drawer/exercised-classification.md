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
