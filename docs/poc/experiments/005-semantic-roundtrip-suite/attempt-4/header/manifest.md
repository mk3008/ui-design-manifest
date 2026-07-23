---
type: UI Design Manifest
title: Bounded Global Header
description: Source-blind visual and responsibility guidance for a compact global Header.
status: draft
source: mixed
---

# Scope

Create one horizontal Global Header that is visually distinct from the work surface below it. It is not page-local context, breadcrumb material, local navigation, or Drawer body content.

# Observed relationships

- The required identity title is a leading, prominent orientation anchor.
- Optional global roles follow a clear group order: identity, optional navigation, optional search, then optional utility and account actions.
- Groups are compact internally and separated economically; the Header surface and lower edge make the regional boundary legible.
- Icon-only controls are compact but meaningful: an inline `currentColor` SVG supplies the visible mark and the interactive control supplies an accessible name.

# Constraints

All title values and optional role values come from the [Application Input Contract](application-input-contract.md). A Drawer control is absent from this fixture because target, side, current state, and behavior are not established. If later supplied, Header owns its placement, treatment, and accessible name only; Drawer retains its own content and state concerns.

# Unresolved

Responsive transformation, focus, keyboard, motion, overflow, control destinations, and Drawer behavior require product input or additional bounded evidence.
