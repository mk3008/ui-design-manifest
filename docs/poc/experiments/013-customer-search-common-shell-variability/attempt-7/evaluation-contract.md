---
type: PoC experiment contract
title: Customer-search composition with manifest-only presentation guidance, attempt 7
status: running
source: authored
baseline_commit: 74a11f23014150b0455201e4f7d81ab9525342f5
---

# Purpose

Re-test the manifest-only customer-search composition after expressing the
default condition-action toolbar and result-grid theme-role contracts in terms
that map directly to HTML structure and CSS declarations.

# Consumer-visible input

Each independent implementation receives exactly three content inputs:

1. `consumer-input/design-manifest/` — the current complete manifest snapshot.
2. `consumer-input/common-shell-run-1/` — the fixed common Header/Drawer implementation from common-shell experiment 012, attempt 3, Run 1.
3. `consumer-input/user-prompt-ja.md` — screen-specific product facts only.

The prompt must not supply generic visual composition, color, placement,
spacing, grid, pagination, or shell rules.

# Fixed execution matrix

| Item | Value |
| --- | --- |
| Model | `gpt-5.6-terra` |
| Reasoning effort | `medium` |
| Independent implementations | 3 |
| Cross-run communication | Prohibited |
| Output directory | `runs/run-N/` |
| Acceptance viewport | `1440x1200` |

# Evaluation focus

Evaluate only the generated output against the frozen snapshot: a separate
condition-action toolbar immediately below the fields; Search/Clear source and
visual order; `justify-content: flex-end` placement in LTR; `tbody td` use of
the resolved opaque `surface_background` and `text_primary` roles; `thead th`
use of the resolved header roles; title-adjacent count; no unrequested
composite cells; collection-action placement; and the existing local-asset,
fixture, identity, pagination, and shell evidence.
