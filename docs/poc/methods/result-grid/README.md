---
type: Result-grid Observation Method
title: Result-grid observation method
description: Source-independent method for a bounded, selectable and sortable business result grid.
status: draft
source: authored
scope: Reusable method.
---

# Purpose and boundary

Use this method for one visible table surface with a header row and repeated records. It captures only the bounded grid relationship: selection, sort presentation, alignment, density, available width, and visibly established accessibility cues. It does not turn a calibration result into a canonical pattern.

# Use

1. Complete every axis in the [observation schema](observation-schema.md) as `observed`, `not observed`, `unresolved`, or `not applicable`.
2. Keep capture and identifying evidence outside the repository bundle.
3. Use the [extraction template](extraction-template.md) and [extraction prompt](extraction-prompt.md) to prepare a source-blind handoff.
4. Apply the [first-pass rubric](first-pass-rubric.md) before sharing the handoff.

# Boundary

Do not infer pagination, bulk actions, row activation, editing, focus behavior, narrow transformation, or overflow behavior when the bounded state does not visibly establish it. Selection and row activation are separate axes: a selection control does not establish activation.
