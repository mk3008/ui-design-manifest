---
type: UI Flow
title: List to detail
description: Cross-screen guidance for an available record-opening relationship.
status: draft
source: authored
scope: Searchable record list and record detail patterns.
requires:
  - screen-patterns/record-list
  - screen-patterns/record-detail
---

# Guidance

Use this flow when a product binding declares that a record can be opened from a list. Preserve the user's list context when a binding supplies query, page, and scroll restoration behavior; otherwise do not claim restoration. The list pattern provides `open_record`; the detail pattern receives it and provides `return_to_list`.

# Selection conditions

Prefer a visible row operation when opening or editing is the primary frequent task. If editing is supplementary, prefer beginning it from detail. When multiple low-frequency row operations exist, consider an overflow menu; do not hide the only frequent operation there. Creation, edit, save, cancel, and deletion require separately declared binding facts and their own applicable flow guidance.

# Product boundary

This flow does not declare that opening, creation, editing, saving, cancellation, or return exists. It does not supply routes, permission checks, state transitions, records, or post-action destinations. Those remain product binding responsibilities.
