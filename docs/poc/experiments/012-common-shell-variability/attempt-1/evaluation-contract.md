---
type: PoC experiment contract
title: Common Header–Drawer creation repeat
status: prepared
source: authored
baseline_commit: 28d7f788cc888cadf8cf1d889a5dadcfb3dbeef8
---

# Purpose

Measure whether the distribution-facing manifest, together with one unchanged
request for a reusable common shell, yields similar Header and Drawer
implementations across three independent new implementations. This is not a
screen-workflow or customer-search experiment.

# Consumer-visible input

Each implementation receives exactly two content inputs:

1. `consumer-input/design-manifest/` — a snapshot of the complete current
   manifest directory.
2. `consumer-input/user-prompt-ja.md` — the unchanged Japanese request.

The harness asks only for a self-contained static HTML deliverable. It does
not supply a prior shell, an image, an evaluator rubric, a special skill, or
an external design system.

# Isolation rule

Implementers must not read any other experiment, test, generated PNG, other
run directory, or skill instruction. They may read and use only the two
consumer-visible inputs. Cross-run communication is prohibited. This is a
procedural isolation rule, not a filesystem sandbox guarantee.

# Fixed execution matrix

| Item | Value |
| --- | --- |
| Model | `gpt-5.6-terra` |
| Reasoning effort | `medium` |
| Independent implementations | 3 |
| Output directory | `runs/run-N/` |
| Capture viewport | `1280 x 720` CSS pixels |

# Harness-only output shape

Each run creates `index.html`, `styles.css`, `app.js`, and `README.md` in its
assigned directory. The default page and both supplied Drawer query states
must render without external assets or network requests. After generation, the
evaluator captures the open and hidden states; capture is not a consumer input
or requirement.

# Evaluation boundary

Similarity does not mean pixel equality. Typography, geometry, CSS, DOM, and
the exact controller icon remain implementation decisions. The evaluation
checks whether all runs keep the Header and controller associated, represent
the supplied hierarchy/current state without synthetic `Current` text, and
remove residual Drawer space in the hidden state. Keyboard, focus, Escape,
ARIA, assistive technology, persistence, responsive behavior, and navigation
destinations are not exercised.
