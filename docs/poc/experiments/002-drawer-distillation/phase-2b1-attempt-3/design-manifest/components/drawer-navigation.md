---
type: component-guidance
title: Drawer navigation
description: A navigation component with context, search, grouping, and selected-path expression.
status: draft
source: mixed
scope: Visible open drawer only.
requires:
  - policies/application-input-contract
  - policies/fixture-policy
---

# Guidance

The component has four visual responsibilities: establish product context, optionally show identity context, offer a compact search or filtering entry point, and present grouped navigation.

Express the selected path at two levels when a parent is expanded: give the selected parent a strong full-row treatment, then distinguish the current child with a quieter contrasting row. A disclosure indicator may communicate the parent’s visible expanded state, but does not establish its interaction behavior.

Place icons or other compact markers at a consistent leading edge. They support scanability and should not replace accessible names supplied by the application.

# Inferences

The search or filtering entry point appears intended to narrow navigational choices, but its query model, results behavior, and update timing are unresolved.

# Unresolved

The component does not establish destination values, identity values, icon semantics, keyboard support, focus management, expansion control, or result behavior.
