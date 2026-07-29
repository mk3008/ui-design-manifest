---
type: UI Component
title: Search conditions
description: A bounded query region with a primary search action and subordinate clearing action.
status: draft
source: authored
scope: Search/list tasks with product-declared query state.
requires:
  - configuration/record-list-options
---

# Guidance

Place conditions before the results they refine. Make the action that applies a declared query primary and make clearing subordinate. Use a stable semantic action order so placement can change without changing the intent or display copy. Do not introduce a condition, helper text, validation state, or query behavior unless product requirements or binding supply it.

Give the condition region a concise group caption so its purpose remains
recognizable beside the result set. The caption is present even when no
supporting explanation is needed. A group description is optional: place it on
the next line only when product-supplied context adds meaning beyond the
caption, visible fields, and actions. Do not use a decorative container merely
to compensate for an omitted caption.

When [record-list options](../configuration/record-list-options.md) resolves a
search action region, apply that logical placement to the complete action group.
In the default `end` region, place the group at the logical end of its compact
condition region rather than falling back to the first field's start edge. The
resolved action order remains intact. This is a presentation consequence of the
existing configuration, not a new setting or a permission to create actions.

# Selection conditions

Use this component only when the product exposes query state and a result set that it affects. If a clear operation does not exist, omit it; configuration cannot create it.

# Relationships

Use with the [searchable record list](../screen-patterns/record-list.md) and [record-list options](../configuration/record-list-options.md).
