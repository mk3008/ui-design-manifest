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

# Selection conditions

Use this component only when the product exposes query state and a result set that it affects. If a clear operation does not exist, omit it; configuration cannot create it.

# Relationships

Use with the [searchable record list](../screen-patterns/record-list.md) and [record-list options](../configuration/record-list-options.md).
