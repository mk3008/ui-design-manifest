---
type: UI Component
title: Result grid
description: A scan-oriented result presentation that keeps data meaning product-owned.
status: draft
source: authored
scope: Declared record result sets in the example search/list workflow.
requires:
  - configuration/record-list-options
---

# Guidance

Keep each row's scanning cues and available operation associated with the same record. Reserve the strongest row-level treatment for one frequent operation; use an overflow presentation only when the product has multiple low-frequency operations. Do not decide which columns, records, values, statuses, row count, loading state, or permission state exist: those belong to product binding.

# Avoid

Do not use a presentation setting to turn an absent action into an available one, or to hide the only frequent action behind an overflow menu.

# Relationships

The [searchable record list](../screen-patterns/record-list.md) supplies the screen role. The [list-to-detail flow](../flows/list-to-detail.md) governs an available `open_record` operation.
