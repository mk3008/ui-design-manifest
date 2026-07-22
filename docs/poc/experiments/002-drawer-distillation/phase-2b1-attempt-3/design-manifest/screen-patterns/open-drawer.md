---
type: screen-pattern
title: Open drawer
description: A wide-viewport composition with a visible navigation drawer.
status: draft
source: observed
scope: One visibly open drawer state at a wide viewport.
requires:
  - components/drawer-navigation
  - policies/application-input-contract
---

# Guidance

Show the drawer beside the content region rather than over it in the bounded state. The drawer should retain a stable vertical edge and full-height visual presence while the content region remains independently readable.

Within the drawer, preserve the ordering of context, search or filtering, primary navigation, then secondary navigation groups. Keep the active path visible without requiring the user to infer it from the content region.

# Unresolved

Do not infer a collapsed state, overlay behavior, responsive breakpoint, persistence policy, animation, or transition from this pattern.
