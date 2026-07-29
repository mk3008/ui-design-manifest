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

Keep each row's scanning cues and available operation associated with the same record. Reserve the strongest row-level treatment for one frequent operation; use an overflow presentation only when the product has multiple low-frequency operations. Do not decide which columns, records, values, statuses, row count, loading state, permission state, selection model, or sort model exist: those belong to product binding.

When the binding supplies multi-selection, use a leading checkbox column and make
selected and unselected rows distinguishable without relying on color alone. Do
not add visible `Select` or `Selected` text next to every checkbox merely to
demonstrate its state; the control's accessible name remains binding-owned. A
header checkbox is permitted only when the binding also supplies select-all
availability. When selection is absent, omit the selection column and selected
row treatment entirely.

When the binding supplies a sort model, show its active direction in the
corresponding column header. Do not put an active sort choice in detached page
chrome, and do not persist sort indicators for inactive columns. When sorting
is absent, do not infer a sortable header or direction state.

Let the host assign the grid width and outer spacing. Keep meaningful columns
at widths appropriate to their role rather than stretching them merely to fill
the grid. If the assigned width has residual space, use one trailing,
presentation-only empty column; it has no label, value, operation, sort state,
selection meaning, or responsive behavior.

Keep the result title, any product-declared count, and any short description of
the current result context in one compact summary immediately above the grid.
The title and a directly qualifying count may share the heading line; when a
description is needed, place it on the following line. An optional description
explains the set, filter, or data meaning; it does not teach the user how to
click an otherwise visible row link. Keep product-supplied global result
actions in an adjacent toolbar or action zone, rather than separating the title
from an unrelated instruction at the opposite edge.

When one frequent operation opens a record and the binding supplies a stable,
human-recognizable primary identifier or title, prefer that leading identity
cell as the record-opening link. Do not add a second trailing `Details` link
only to demonstrate navigation. If the binding does not supply a suitable
identity link, use the configured row-action presentation in a logical-end
action column. Keep destructive or multiple low-frequency row operations
separate from the primary record-opening treatment and use the existing
overflow rule when it applies.

# Avoid

Do not use a presentation setting to turn an absent action into an available one, or to hide the only frequent action behind an overflow menu. Do not invent selection, select-all, sorting, or column semantics from a static fixture.

# Relationships

The [searchable record list](../screen-patterns/record-list.md) supplies the screen role. The [list-to-detail flow](../flows/list-to-detail.md) governs an available `open_record` operation.
