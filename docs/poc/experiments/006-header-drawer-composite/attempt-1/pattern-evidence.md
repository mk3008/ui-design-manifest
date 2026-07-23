---
type: Source-aware Pattern Evidence
title: Header–Drawer required-pattern and primary-guidance record
description: Evaluation-only provenance record; never an Implementer input.
status: draft
source: mixed
---

# Required patterns

| Pattern | Classification | Bounded evidence |
| --- | --- | --- |
| A: Header trigger + fully hidden closure | required-pattern | User-required calibration policy. The Header retains the declared trigger while the Drawer is absent. |
| B: Drawer control + icon rail closure | required-pattern | User-required calibration policy. One Drawer control compacts a left Drawer with a left-pointing chevron and expands its retained rail with a right-pointing chevron; an X is reserved for full dismissal without a rail. |

# Primary-guidance corroboration

- Microsoft NavigationView distinguishes expanded, compact icon-only, and minimal menu-button modes, with an adaptive policy: https://learn.microsoft.com/en-us/windows/apps/design/controls/navigationview
- Carbon UI Shell permits the Header to trigger the left panel while the two regions remain independently usable: https://carbondesignsystem.com/components/UI-shell-left-panel/usage/

# Logical inference and unresolved details

A fully hidden region cannot retain its only reopening control. An icon rail can retain one internal expansion control. This is a logical ownership constraint, not a universal behavioral rule. Presentation, backdrop, content displacement, focus, keyboard, motion, persistence, and breakpoints remain unresolved/non-universal.
