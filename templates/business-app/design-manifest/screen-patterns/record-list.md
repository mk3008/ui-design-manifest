---
type: UI Screen Pattern
title: Record list
description: A bounded list pattern for scanning records and acting on one item.
status: draft
source: authored
scope: Desktop list view in the example operations workspace.
requires:
  - foundations/compact-work-surface
  - components/status-badge
  - policies/confirm-destructive-action
---

# User task

Help an operations user locate a record, understand its current state, and choose an available action without losing list context.

# Guidance

Keep the list identity and primary scanning cues stable. Associate row-level actions with their record, expose action names, and preserve context after a non-navigation action. Apply the [compact work surface](../foundations/compact-work-surface.md), show state through the [status badge](../components/status-badge.md), and use the [destructive-action policy](../policies/confirm-destructive-action.md) when applicable.

# Unresolved

Filtering, pagination, bulk selection, responsive transformation, and all non-default states require product evidence before implementation.
