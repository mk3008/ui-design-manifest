---
type: Source-blind static implementation input
title: Pattern A neutral static fixture
description: The only guidance supplied to the isolated implementation.
status: frozen
source: authored
---

# Produce exactly two static states

Render a 1280 x 720 static page in each state: `A-open` and `A-hidden`.

- Both states have one dark Header across the top.
- In both states, place one neutral menu-shaped controller in the Header's
  stable leading area and a nearby neutral title anchor, `Workspace`.
- `A-open` has a left primary-navigation region below the Header and a neutral
  workspace to its right. Use generic fixture labels only: `Parent A`,
  `Child A`, `Leaf A`, and `Direct A`.
- `A-hidden` retains the identical Header, controller, and title anchor, but
  has no visible Drawer, blank Drawer gutter, rail, or residual navigation
  boundary. The workspace occupies the available width below the Header.

# Boundaries

This is a visual comparison fixture, not an interaction implementation. Do not
add behavior, responsive rules, persistence, overlay treatment, focus logic,
keyboard behavior, accessibility claims, routes, product identity, badges,
counts, permissions, or external source material.
