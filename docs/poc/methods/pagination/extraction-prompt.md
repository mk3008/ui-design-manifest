---
type: Extraction Prompt
title: Pagination extraction prompt
description: Bounded prompt for source-blind pagination handoff.
status: draft
source: authored
scope: Reusable method.
---

# Prompt

Classify every pagination observation axis and name its knowledge ownership. Produce a Manifest, Application Input Contract, and compact apply instruction that preserve only the declared navigation relationship. Keep evidence outside the handoff.

Default to unknown-total cursor-oriented pagination when total knowledge is absent: show only Previous and Next with Contract-supplied availability; show a local position or range only when supplied; place it right-aligned in the grid footer. Do not create totals, page counts, jumps, first/last controls, page size, loading, focus, keyboard, persistence, responsive behavior, ordering mechanics, or data-access implementation. Mark unshown behavior unresolved.
