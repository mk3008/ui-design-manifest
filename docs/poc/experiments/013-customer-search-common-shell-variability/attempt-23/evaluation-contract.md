---
type: PoC experiment contract
title: Customer-search conditional pinned-boundary test, attempt 23
status: completed
source: authored
baseline_commit: 2074bf0ac6b99d6265917bad987cf2dc2039e139
---

# Purpose

Test whether the revised fixed Manifest and the same product-specific prompt
produce three fresh implementations that preserve the initial pinned-column
boundary rule: the initial Grid position has only the one-pixel separator, and
a subtle shadow is present only after the Grid itself has scrolled horizontally.

## Frozen inputs

- `consumer-input/design-manifest/` — complete current Manifest snapshot
- `consumer-input/user-prompt-ja.md` — fixed product-specific Japanese prompt
- `consumer-input/common-shell-fixture/` — declared fixed shell fixture

Each run creates `index.html`, `page.css`, and `page.js` once from these inputs.
No output from attempt 22 is copied, repaired, or used as a run source.

# Evaluation boundary

The three-run protocol applies. A visible deviation is classified before any
input changes. Individual generated output is never repaired or replaced.
