---
type: component-guidance
title: Drawer navigation
description: A navigation component with context, search, grouping, and selected-path expression.
status: draft
source: authored
scope: Visible open drawer only.
requires:
  - policies/application-input-contract
  - policies/fixture-policy
---

# Guidance

The component may establish product context, optionally show identity context, offer a compact search or filtering entry point, and present owner-supplied navigation.

Express the selected path at two levels when a parent is expanded: give the selected parent a strong full-row treatment, then distinguish the current child with a quieter contrasting row. A supplied disclosure indicator may communicate the visible expanded state without establishing interaction behavior.

Leading icons are optional. Render an icon only when the owner supplies a semantic icon slot, its permitted asset or category, and its accessible-name relationship. The icon supplements rather than replaces the row's accessible name. If any of those inputs is absent, omit the leading icon; do not substitute a generic marker, square, control-like shape, or reconstructed icon set.

# Unresolved

The component does not establish destinations, identity values, icon semantics, keyboard support, focus management, expansion control, or result behavior.
