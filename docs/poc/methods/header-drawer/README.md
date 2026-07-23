---
type: Header–Drawer Composite Observation Method
title: Header–Drawer composite observation method
description: Source-blind method for control ownership and closed-state relationships across a Header and Drawer.
status: active
source: authored
---

# Purpose and boundary

This method observes only the cross-component seam between a Global Header and a primary navigation Drawer. Header and Drawer component-local roles remain owned by their accepted methods. The composite method owns no product behavior; it records which region owns a declared control and how an explicitly supplied state relates to the adjacent content.

# Required logical constraints

A fully hidden Drawer cannot own its only reopening control because that control disappears with it. Its surviving trigger must therefore be outside the hidden Drawer. An icon-rail closed representation remains a Drawer region and may retain one Drawer-owned expansion control and contract-declared shortcuts. For any state, declare exactly one authoritative open/close controller. Do not add duplicate independent Header and Drawer controls unless their synchronization is explicitly contracted.

# Use

1. Complete the [observation schema](observation-schema.md) with one classification per axis.
2. Use the [extraction template](extraction-template.md) and [extraction prompt](extraction-prompt.md) to keep source-aware evidence separate.
3. Apply the [first-pass rubric](first-pass-rubric.md).

Statuses are exactly `observed|required-pattern`, `optional-candidate`, `unresolved`, `not exercised`, or `not applicable`. A required pattern is a bounded requested policy, not proof that all products behave that way. A static record does not establish responsive breakpoints, motion, focus, keyboard behavior, persistence, backdrop, overlay, or content displacement.
