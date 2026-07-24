---
type: Result-grid Manifest
title: Bounded selectable result grid
description: Source-blind guidance for a static business table with selection and one active sort state.
status: draft
source: mixed
scope: One table surface with a header row and repeated records.
---

# Guidance

Present records in a single table surface whose header establishes the same column relationships as the body. Place row-selection checkboxes in the leading column. Put a checkbox in that column's header only when the Application Input Contract declares select-all availability; otherwise keep the header cell empty. A visible header control does not authorize select-all behavior unless the Contract also supplies it. For the neutral calibration fixture, make selected and unselected rows distinguishable as an authored default, while keeping selection distinct from row activation.

For the neutral calibration fixture, declare one sortable column active as an authored default. Its header control places the active direction icon at the right edge of the header control. Do not make inactive sort icons persist. Headers follow the alignment of their content: text, identifiers, and status values align left; numeric values align right; selection controls and standalone icons center. Keep single-line content vertically centered unless the Contract supplies a different condition.

Keep row rhythm compact and consistent. Consider header typography independently from body typography; a restrained distinction is permitted without requiring identical weight. Fill the inline width assigned by the host and leave page-level outer spacing to the host screen. Keep meaningful data columns at role-appropriate widths rather than stretching them merely to fill the grid surface. When residual width remains, use one trailing presentation-only filler column with an empty header and empty body cells. It carries no data meaning, label, selection, sorting, action, or responsive behavior. Do not add arbitrary component margins.

# Unresolved

- Selection source of truth, update trigger, header select-all behavior, and bulk actions.
- Sorting source of truth, available fields, change behavior, and update trigger.
- Row activation, destinations, editing, pagination, empty/loading/failure states, focus, keyboard, announcements, narrow transformation, and overflow policy.
- Product labels, record identities, status meaning, counts, and all non-neutral display values.

# Relationships

Apply only with the [Application Input Contract](application-input-contract.md) and [apply instruction](apply-instruction.md).
