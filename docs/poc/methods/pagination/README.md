---
type: Pagination Observation Method
title: Pagination observation method
description: Source-independent method for bounded business-list pagination.
status: draft
source: authored
scope: Reusable method.
---

# Purpose and boundary

Use this method to distinguish a known-total, page-indexed presentation from an unknown-total, cursor-oriented presentation. It preserves only a bounded navigation relationship; it does not promote a calibration to a canonical component or prescribe data access.

# Use

1. Classify every [observation-schema](observation-schema.md) axis as `observed`, `not observed`, `unresolved`, or `not applicable`, and name its knowledge ownership.
2. Keep capture and identifying evidence outside the repository bundle.
3. Prepare a source-blind handoff with the [extraction template](extraction-template.md) and [extraction prompt](extraction-prompt.md).
4. Apply the [first-pass rubric](first-pass-rubric.md) before sharing it.

# Boundary

Do not infer totals, direct navigation, first/last navigation, backward availability, page size, loading, focus, keyboard, persistence, responsive behavior, or data-access mechanics from a bounded state.
