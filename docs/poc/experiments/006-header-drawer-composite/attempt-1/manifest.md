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

The expanded state shows the declared Drawer. In the fully hidden state, the Drawer is absent and the single authoritative reopen control remains in the Header. The Header control's placement, accessible name, `aria-expanded`, and `aria-controls` come from the Contract. Do not add a second Drawer control for this state.

# Pattern B: Drawer control with icon rail

The expanded state shows the declared Drawer control within the Drawer. The compact state retains an icon-only rail with that same single authoritative Drawer control and Contract-declared meaningful icon shortcuts. Do not add a Header trigger for this policy.

# Separate cases

An adaptive viewport-to-mode mapping is an optional policy candidate that may select expanded, icon-rail, or Header-trigger-only states when supplied; it is not a third universal close mechanism. An always-visible persistent Drawer with no close control is `not applicable` for open/close ownership. Target side, presentation, displacement, backdrop, persistence, focus, keyboard, motion, and viewport thresholds require product input.
