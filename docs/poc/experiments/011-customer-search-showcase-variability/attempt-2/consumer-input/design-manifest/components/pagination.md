---
type: UI Component
title: Pagination
description: A continuation control for a product-declared result set.
status: draft
source: authored
scope: Result sets whose product binding declares a pageable state.
requires:
  - configuration/record-list-options
---

# Guidance

Place pagination with the result set it continues and keep its relationship to the current result context clear. A count presentation may summarize a product-declared aggregate, but does not define its meaning or calculate it. Preserve query and list context when the product supplies a pagination state.

# Selection conditions

Use only when the binding declares pageable results. Omit the control and any count presentation when the necessary aggregate or state is absent.
