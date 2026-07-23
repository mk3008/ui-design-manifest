---
type: Application Instruction
title: Apply dense condition-entry guidance
description: Source-blind instructions for a bounded, wide static condition panel.
status: draft
source: authored
scope: One static condition-entry region in wide main content.
requires:
  - manifest
  - application-input-contract
---

# Allowed inputs

Use only the [Manifest](manifest.md) and [Application Input Contract](application-input-contract.md), plus this instruction. Render the four declared neutral condition rows as one wide, repeated horizontal panel. Associate every field, operator, value, and enabled choice with a visible label or caption; do not use placeholder-only labels.

Keep add-condition with the panel. Render the supplied Apply action as primary and the supplied Clear or reset action as secondary. Mark a boundary before separately owned results content, but do not render results without product inputs.

# Do not invent

Do not add domain copy, extra rows, saved conditions, advanced conditions, validation, result data, action behavior, or a narrow-layout rule. If Contract input is absent, omit the dependent UI or request a decision.
