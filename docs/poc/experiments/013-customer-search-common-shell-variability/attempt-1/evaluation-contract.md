---
type: PoC experiment contract
title: Customer-search composition with fixed common shell
status: prepared
source: authored
baseline_commit: 74a11f23014150b0455201e4f7d81ab9525342f5
---

# Purpose

Measure whether a fixed, reusable common shell combined with the current
manifest and one unchanged customer-search request yields similar new search
screens across three independent implementations.

# Consumer-visible input

Each implementation receives exactly three content inputs:

1. `consumer-input/design-manifest/` — a snapshot of the complete current
   manifest directory.
2. `consumer-input/common-shell-run-1/` — the fixed common Header/Drawer
   implementation from common-shell experiment 012, attempt 3, Run 1.
3. `consumer-input/user-prompt-ja.md` — the unchanged Japanese user request.

The implementation harness only identifies those inputs and requests a
self-contained static HTML deliverable. It does not add an existing
customer-search result, PNG, test, comparison, or special skill.

# Isolation rule

Implementers must not read the parent experiment contract or comparison, any
`tests/` directory, generated PNGs, prior customer-search experiments, other
run directories, or skill instructions. They may read and use only the three
consumer-visible inputs. The evaluator may inspect outputs only after each
implementation is complete.

# Fixed execution matrix

| Item | Value |
| --- | --- |
| Model | `gpt-5.6-terra` |
| Reasoning effort | `medium` |
| Independent implementations | 3 |
| Cross-run communication | Prohibited |
| Output directory | `runs/run-N/` |
| Acceptance viewport | `1440x1200` |

# Harness-only output shape

Each run creates `index.html`, `styles.css`, `app.js`, and `README.md` in its
assigned output directory. They use no external assets, requests, fonts, or
scripts. The evaluator captures four fixed states after generation:
light/dark and Drawer open/hidden. Capture is not a consumer input.

# Evaluation boundary

Similarity does not mean pixel equality. The evidence checks reuse of the
fixed shared shell, required customer-search content, local-only assets,
canonical theme values, and the four supplied states. It does not claim
keyboard, assistive technology, database connectivity, or actual navigation.
