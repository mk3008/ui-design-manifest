---
type: UI Component
title: Record fields
description: A shared field-group contract for readable record values and editable record forms.
status: draft
source: authored
scope: Read-only detail, create, edit, and wizard steps.
requires:
  - foundations/accessible-work-surface
  - foundations/compact-work-surface
---

# Guidance

Group related record fields under a meaningful section heading. In a read-only
surface, render supplied values as readable label/value content rather than as
disabled form controls. In create and edit surfaces, use labeled native inputs
appropriate to the supplied value type.

For a read-only operational detail at desktop width, prefer compact horizontal
description rows when captions are short and users repeatedly scan keys and
values. Keep one bounded caption column beside one value column instead of
scattering unrelated fields across equal-width cells. Return to labels above
values when the pane is narrow, captions or translations are long, or values
need the full reading width. Choose the relationship once for the field group;
it is not a per-field choice or local setting.

When the screen needs a denser record-summary presentation, keep that
read-only group as one summary-list-like surface and subordinate any secondary
metadata. Do not turn each fact into its own mini-card or spread one small set
of details across several balanced columns merely because the canvas is wide.

For create and edit controls, place the label above its control by default.
This vertical relationship preserves one input direction and tolerates longer
labels, help, errors, and translations. Keep one alignment within a field
group.

Use an I-shaped single-column reading path as the maintainable default for
create and edit. It keeps unrelated fields, help, and errors in one predictable
vertical order. Put two or three fields on one row only when the product binding
explicitly groups them as a related value set that users understand
left-to-right. Treat that row as one layout unit so help or error content does
not misalign its neighboring controls.

Keep labels visible. Associate help, required state, validation, units, and
format expectations with the field they describe. On validation failure, show
an error summary for the screen and a specific message at each affected field.
Do not clear valid values or make users re-enter already supplied information.
Use one shared height for text inputs, select controls, and other single-line
controls on the same screen. A multiline text area is an intentional exception.

Create starts from product-supplied defaults or empty values. Edit starts from
the current supplied values and keeps record identity visible. Read-only,
create, and edit may share field meaning, but they do not share interaction
semantics.

# Product boundary

The product binding owns field inventory, captions, order, types, required
state, defaults, current values, help, validation, visibility, sensitivity,
permissions, and update source. Do not infer any of those facts from a fixture.

# Implementation boundary

The concrete read-only caption-column width, reading measure, single-line
control height, control width, breakpoint behavior, CSS, DOM structure beyond
required semantics, and framework are implementation decisions. A multi-column
form layout is not a generic density switch: it requires the supplied
related-field grouping above. This pack adds no field-layout configuration.
