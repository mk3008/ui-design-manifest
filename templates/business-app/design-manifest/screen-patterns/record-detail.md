---
type: UI Screen Pattern
title: Record detail
description: A destination role for inspecting one product-declared record.
status: draft
source: authored
scope: Detail destination in the example list-to-detail flow.
requires:
  - flows/list-to-detail
---

# Guidance

Present the product-declared record identity and information in a stable reading order. Offer a return role only when the binding supplies a valid destination and context-restoration behavior. Editing, deletion, saving, and cancellation are not implied by this destination role; each requires an explicit product binding and an applicable flow.

# Transition roles

This pattern provides `return_to_list` and receives `open_record`. The [list-to-detail flow](../flows/list-to-detail.md) owns when and why those roles connect.
