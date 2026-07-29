---
type: PoC experiment contract
title: Customer-search composition with manifest-only presentation guidance, attempt 5
status: running
source: authored
baseline_commit: 74a11f23014150b0455201e4f7d81ab9525342f5
---

# Purpose

Re-test the manifest-only customer-search composition after the standard pack
clarified four presentation consequences: the default logical-end Search/Clear
action group, default visual and source order, result-collection action
placement, and the result-grid body surface.

# Consumer-visible input

Each independent implementation receives exactly three content inputs:

1. `consumer-input/design-manifest/` — a snapshot of the complete current manifest directory.
2. `consumer-input/common-shell-run-1/` — the fixed common Header/Drawer implementation from common-shell experiment 012, attempt 3, Run 1.
3. `consumer-input/user-prompt-ja.md` — product facts for this customer-search screen.

The prompt may state only screen-specific product facts. It must not repeat
generic presentation, placement, color, spacing, button, grid, pagination, or
common-shell rules.

# Fixed execution matrix

| Item | Value |
| --- | --- |
| Model | `gpt-5.6-terra` |
| Reasoning effort | `medium` |
| Independent implementations | 3 |
| Cross-run communication | Prohibited |
| Output directory | `runs/run-N/` |
| Acceptance viewport | `1440x1200` |

# Required observations

The evaluator will inspect each output against the frozen snapshot for:

- a separate, logical-end Search/Clear action row in default visual and source order;
- a collection-scoped Add action adjacent to the result summary, using lower emphasis than Search;
- table header and ordinary body surfaces distinct from the host page surface;
- existing prompt-scope, six-fixture, ID-link, pagination, local-asset, and shared-shell evidence.

This experiment does not prove runtime behavior, data access, routing,
authorization, or assistive-technology conformance.
