---
type: Header–Drawer Composite Manifest
title: Explicit Header–Drawer ownership policies
description: Source-blind policies for two static Header–Drawer comparison states.
status: draft
source: authored
---

# Scope

Apply a Global Header and primary navigation Drawer using the accepted component-local methods. This Manifest defines only their control ownership and state relationship.

# Pattern A: Header trigger with fully hidden Drawer

The expanded state shows the declared Drawer. In the fully hidden state, the Drawer alone is absent while the single authoritative reopen control remains in the same Contract-declared Header slot and the Header title anchor remains unchanged. The Header control's placement, accessible name, `aria-expanded`, and `aria-controls` come from the Contract. Do not add a second Drawer control for this state.

# Pattern B: Drawer control with icon rail

The expanded state shows one declared Drawer control near the Drawer trailing/top edge. Its left-pointing chevron compacts a left Drawer to the retained icon rail. The compact state retains that same single authoritative Drawer control, now with a right-pointing chevron that expands the rail, and Contract-declared meaningful icon shortcuts. When the Contract supplies no Drawer-header content, do not invent a title, logo, context selector, search field, or explanatory label. A control-only row may therefore contain only the control; keep it distinct from the first navigation row and no more visually prominent than needed for a clear accessible target. Do not add a Header trigger for this policy. Reserve an X-shaped control for a separately Contract-declared full dismissal with no retained rail; it is not the compact/expand control.

# Separate cases

An adaptive viewport-to-mode mapping is an optional policy candidate that may select expanded, icon-rail, or Header-trigger-only states when supplied; it is not a third universal close mechanism. An always-visible persistent Drawer with no close control is `not applicable` for open/close ownership. Target side, presentation, displacement, backdrop, persistence, focus, keyboard, motion, and viewport thresholds require product input.
