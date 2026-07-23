---
type: Observation Record
title: Dense condition-entry static observation record
description: Source-aware, non-identifying classification record for a bounded static image oracle.
status: draft
source: observed
scope: Declared visible condition-entry region and its immediate results boundary.
---

# Oracle

- Opaque ID: OR-SC-02
- Digest: `7b225e743fb56baca0cc25250bf4511b2090ad2bdd4d9a9810ca639b18e02c43`
- Input format: PNG
- Declared scope: visible wide condition-entry region and immediate boundary to results

# Classifications

| Axis | Classification | Record |
| --- | --- | --- |
| Region responsibility | observed | A local panel supports repeated condition entry and condition-level enablement. |
| Field inventory | observed | Repeated rows visibly combine field, operator, value, enabled state, and removal responsibility. |
| Labels and association | observed | Visible labels or captions are adjacent to the exercised controls and their row roles. |
| Required indication | not observed | No visible required cue is established. |
| Grouping and boundaries | observed | Repeated rows belong to one panel, which has a distinct boundary before separately owned lower content. |
| Reading order | observed | A stable top-to-bottom row sequence and left-to-right within-row sequence are visible. |
| Tab order | unresolved | Not observable in a static image. |
| Density and rhythm | observed | Multiple aligned rows make a compact, repeated scan rhythm across wide content. |
| Primary/secondary actions | observed | The panel has apply responsibility and a distinct clear or reset responsibility; visual outcome is not established. |
| Default/state visibility | observed | Enabled states and populated control states are visible; their data model is unresolved. |
| Inline help | not observed | No reusable help responsibility is established. |
| Validation/error responsibility | unresolved | No validation or error state is visible. |
| Conditional dependencies | unresolved | Static evidence does not establish dependencies between rows or values. |
| Collapsed/advanced conditions | not observed | No such responsibility is visible in scope. |
| Saved-filter responsibility | not observed | No saving responsibility is visible in scope. |
| Results relationship | observed | A regional boundary separates the condition panel from lower result content; result ownership and updates are unresolved. |
| Narrow/responsive policy | unresolved | The static wide image does not establish a narrow transformation. |
| Focus/keyboard/motion | unresolved | Not observable in a static image. |
| Application Input Contract needs | observed | Product-owned labels, values, enabled state, row lifecycle, action behavior, and results model must be supplied externally. |

# Abstraction decisions

Preserve wide horizontal use, repeated row rhythm, row-level responsibility, add-condition ownership, apply versus clear/reset distinction, and the boundary to results. Exclude product vocabulary, exact condition count, dimensions, colors, copy, and all non-static behavior.

# Information loss and additional input needs

The source-specific purpose and values are intentionally not recoverable by normal application. Additional bounded state or viewport evidence would be required to decide validation, dependencies, keyboard behavior, action outcomes, result updates, focus, motion, persistence, or narrow transformation.

# Relationships

The source-blind application handoff is the [Manifest](manifest.md), [Application Input Contract](application-input-contract.md), and [apply instruction](apply-instruction.md).
