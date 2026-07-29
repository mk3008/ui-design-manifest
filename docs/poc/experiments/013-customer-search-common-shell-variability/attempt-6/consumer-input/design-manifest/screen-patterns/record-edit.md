---
type: UI Screen Pattern
title: Record edit
description: A focused form for updating one existing product-declared record.
status: draft
source: authored
scope: Single-record editing.
requires:
  - components/record-fields
  - flows/record-lifecycle
---

# Guidance

Keep record identity visible and prepopulate fields from the current supplied
state. Put identity in the title or adjacent title context; do not add an
ambiguous information or success banner just to repeat the same identity.
Follow the Record fields single-column default unless the binding explicitly
supplies a related field group.

Use one clear Save action and a separate Cancel action. These are
page-finalizing actions: place them in a persistent footer action region rather
than at the top of the form. The region must remain available while a long form
scrolls and must not obscure the last field or its validation message. Do not
treat the entire read-only detail as disabled inputs, and do not hide changed
values behind a second interaction.

Within this full-page action region, put Save before Cancel in source, reading,
visual, and Tab order. Do not move initial focus to Cancel. Keep this order
consistent across full-page create and edit tasks; it is not local
configuration.

Keep valid values on validation failure. When the product detects a concurrent
change, show the conflict and recovery choices without silently overwriting
either version. Confirm abandonment only when unsaved changes are material and
the product supplies that state.

# Transition roles

This pattern receives `begin_edit` and provides `save_success`, `save_failure`,
and `cancel_edit`. It returns to a binding-owned destination and does not infer
that destination from page history.

# Product boundary

Current values, editable fields, validation, permissions, change detection,
conflict policy, persistence, outcome, and destinations are product-owned.

# Implementation boundary

Footer positioning, scroll container mechanics, control widths, concrete
height, CSS, DOM, and framework are implementation decisions. A save-success
message is an outcome after Save; the persistent action region and record
identity must not be styled as that outcome. A bidirectional platform may
mirror physical alignment without changing the logical action sequence.
