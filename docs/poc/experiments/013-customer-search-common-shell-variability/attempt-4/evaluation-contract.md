---
type: PoC experiment contract
title: Customer-search composition with manifest-only presentation guidance, attempt 4
status: prepared
source: authored
baseline_commit: 74a11f23014150b0455201e4f7d81ab9525342f5
---

# Issue

Attempts 2 and 3 repeated manifest-owned presentation rules in the consumer
prompt. They can demonstrate a rendered result but cannot isolate whether the
manifest itself is sufficiently precise.

# Customer and value

A manifest consumer can provide only screen-specific product facts and obtain
a screen whose generic presentation remains consistent with the standard pack.

# Consumer-visible input

Each implementation receives exactly three content inputs:

1. `consumer-input/design-manifest/` — a snapshot of the complete current
   manifest directory.
2. `consumer-input/common-shell-run-1/` — the fixed common Header/Drawer
   implementation from common-shell experiment 012, attempt 3, Run 1.
3. `consumer-input/user-prompt-ja.md` — product facts for this one customer
   search screen.

The prompt may state only screen identity, supplied domain fields and values,
available product operations or destinations, supplied state/capabilities, and
fixture constraints. It must not state generic visual composition, color
roles, spacing, borders, cards, captions, typography, field/action placement,
grid treatment, pagination presentation, or common-shell treatment.

Implementers must not read tests, comparisons, previous customer-search
attempts, generated PNGs, other Run directories, or skill instructions.

# Acceptance criteria and evidence

| Criterion | Verification |
| --- | --- |
| Prompt contains product facts only | The prompt-scope checker rejects manifest-owned presentation language. |
| Generic presentation comes from the manifest | Each output has the manifest-required unboxed search caption, separate logical-end action row, semantic grid-header roles, row-only dividers, no decorative grid frame, and plain numeric pagination. |
| Product facts remain supplied | Each output contains the declared fields, six fixtures, leading ID link, declared operations, and paging capability. |
| Shared shell is reused | The fixed input hashes match common-shell experiment 012 Run 1; open/hidden and Light/Dark states render. |

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
assigned output directory. No external assets, requests, fonts, or scripts are
permitted. The evaluator captures Light/Dark × Drawer open/hidden after
generation; capture is not consumer input.

# Scope

This experiment evaluates manifest precision for one static screen. It does
not prove interaction semantics, keyboard or assistive-technology behavior,
database connectivity, routing, or that every possible product requirement
will map without further manifest work.
