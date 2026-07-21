---
type: Interaction policy
title: Navigation visibility transition
description: An explicit reversible control changes navigation visibility while retaining workspace context.
status: draft
source: mixed
scope: A navigation close and restore interaction.
requires:
  - components/sidebar-navigation
  - components/workspace-header
---

# Guidance

Make navigation visibility an explicit, reversible workspace action. When hidden, let the main reading area use released width while retaining header and current content context. Expose the reverse action from the same control region.

# Unresolved

Animation, focus placement, persistence, escape behavior, and accessibility announcements are target-product decisions.

# Relationships

This policy changes [sidebar navigation](../components/sidebar-navigation.md) inside [the workspace pattern](../screen-patterns/explanatory-workspace.md).
