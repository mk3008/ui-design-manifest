---
type: screen-pattern
title: Open drawer
description: A wide-viewport composition with a visible navigation drawer.
status: draft
source: authored
scope: One visibly open drawer state at a wide viewport.
requires:
  - components/drawer-navigation
  - policies/application-input-contract
---

# Guidance

Show the drawer beside the content region in the bounded state. Retain a stable vertical edge and full-height visual presence while the content region remains independently readable.

Within the drawer, preserve the ordering of context, search or filtering, uncaptained primary navigation, then any owner-supplied secondary collection. Keep the active path visible without requiring inference from the content region.

# Unresolved

Do not infer a collapsed state, overlay behavior, responsive breakpoint, persistence policy, animation, or transition.
