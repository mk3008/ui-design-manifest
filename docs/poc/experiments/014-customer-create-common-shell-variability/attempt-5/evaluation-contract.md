---
type: PoC experiment contract
title: Customer-create composition with revised form guidance, attempt 5
status: running
source: authored
baseline_commit: c8698d6ddfbd200cff75f7eab738d5bbdca29807
---

# Purpose

Test whether the revised manifest, fixed common shell, and unchanged
product-facts-only prompt produce comparable customer-create pages. This run
uses no consumer-visible input other than the frozen manifest, shell, and
prompt.

# Consumer-visible input

Each independent implementation receives exactly three content inputs:

1. `consumer-input/design-manifest/` — the complete frozen manifest snapshot.
2. `consumer-input/common-shell-run-1/` — the fixed common Header/Drawer implementation.
3. `consumer-input/user-prompt-ja.md` — screen-specific product facts and validation requirements.

The prompt does not supply generic visual composition, color, placement,
spacing, form-layout, shell, group treatment, helper-copy, requiredness, or
action-hierarchy rules.

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

Evaluate the generated pages against the frozen snapshot and fixed prompt:
customer ID omitted as a form control; required/optional fields; date, phone,
and email validation; visible field-associated errors; consistent instruction
copy; a host-surface unboxed field flow; one error-colored per-label
requiredness treatment; bottom Save/Cancel toolbar order and alignment when
Cancel is supplied; Save visible but non-persistent; local assets; fixed shell;
and the existing theme and Drawer evidence.
