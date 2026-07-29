---
type: PoC experiment contract
title: Clean-room customer-search creation repeat
status: prepared
source: authored
baseline_commit: 28d7f788cc888cadf8cf1d889a5dadcfb3dbeef8
---

# Purpose

Measure whether the current distribution-facing manifest, combined with one
unchanged user requirement, yields similar new customer-search screens across
three independent implementations. This is a creation test, not an
implementation of the previous PoC screens.

# Consumer-visible input

Each implementation receives exactly two content inputs:

1. `consumer-input/design-manifest/` — a snapshot of the complete current
   manifest directory that a repository consumer would receive.
2. `consumer-input/user-prompt-ja.md` — the unchanged Japanese user request.

The implementation harness only identifies those inputs and requests a
self-contained static HTML deliverable. It does not add product design
requirements, a binding, a reference screen, an artifact, a test, a prior run,
or a special skill.

# Isolation rule

Implementers must not read `attempt-1`, the parent experiment contract or
comparison, any `tests/` directory, generated PNGs, other run directories, or
any skill instructions. They may read and use only the two consumer-visible
inputs above. The evaluator may inspect outputs only after each implementation
is complete.

# Fixed execution matrix

| Item | Value |
| --- | --- |
| Model | `gpt-5.6-terra` |
| Reasoning effort | `medium` |
| Independent implementations | 3 |
| Cross-run communication | Prohibited |
| Output directory | `runs/run-N/` |

# Harness-only output shape

Each run creates `index.html`, `styles.css`, `app.js`, and `README.md` in its
assigned output directory. They use no external assets, requests, fonts, or
scripts. The evaluator captures the default view after generation; capture is
not an input or requirement for a manifest consumer.

# Evaluation boundary

Similarity does not mean pixel equality. Concrete CSS, spacing, typography,
and other decisions explicitly left to implementation may differ. The review
will instead observe whether the generated screens follow the current manifest
where it expresses a stable policy, and will record any remaining variance.
