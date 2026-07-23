---
type: Observation Record
title: Condition-entry static observation record
description: Source-aware, non-identifying classification record for a bounded static image oracle.
status: draft
source: observed
scope: Declared visible condition-entry region only.
---

# Oracle

- Opaque ID: OR-SC-01
- Digest: `bc74674f8ba3daa5a33344c8bd9dcb8ed519c743fe7ed56b4740a48ec1b41b3b`
- Input format: PNG
- Declared scope: visible condition-entry region only

# Classifications

| Axis | Classification | Record |
| --- | --- | --- |
| Region responsibility | observed | A bounded local condition-entry responsibility is visible. |
| Field inventory | observed | Selection controls, an entry control, a boolean choice, and one submit action are visible. |
| Labels and association | observed | Every exercised control, including the boolean choice, has a visible adjacent label or caption. |
| Required indication | not observed | No visible required cue is established. |
| Grouping and boundaries | observed | Controls form one bounded group. |
| Reading order | observed | A stable top-to-bottom and left-to-right sequence is visible. |
| Tab order | unresolved | Not observable in a static image. |
| Density and rhythm | observed | The group uses compact repeated control rhythm with economical separation. |
| Primary/secondary actions | observed | One visually primary submit action is owned by the group; no secondary action is observed. |
| Default/state visibility | observed | A static displayed state is visible; its state model is unresolved. |
| Inline help | not observed | No reusable help responsibility is established. |
| Validation/error responsibility | unresolved | No validation or error state is visible. |
| Conditional dependencies | unresolved | Static evidence does not establish dependencies. |
| Collapsed/advanced conditions | not observed | No such control is visible in scope. |
| Saved-filter responsibility | not observed | No saving control is visible in scope. |
| Results relationship | not applicable | Results region is excluded by declared scope. |
| Narrow/responsive policy | unresolved | One static view cannot establish transformation policy. |
| Focus/keyboard/motion | unresolved | Not observable in a static image. |
| Application Input Contract needs | observed | Product meaning, values, requiredness, behavior, and state ownership must be supplied externally. |

# Abstraction decisions

Preserve the group, labelled-control association, role variety, reading order, compact density, boolean caption, and primary action ownership. Exclude instructional prose, product vocabulary, exact field count, placement, colors, dimensions, and all non-static behavior.

# Information loss and additional input needs

The source-specific purpose and values are intentionally not recoverable by normal application. Additional bounded state or viewport evidence would be required only to decide validation, conditional behavior, focus, keyboard, motion, persistence, results, or responsive transformation.

# Relationships

The source-blind application handoff is the [Manifest](manifest.md), [Application Input Contract](application-input-contract.md), and [apply instruction](apply-instruction.md).
