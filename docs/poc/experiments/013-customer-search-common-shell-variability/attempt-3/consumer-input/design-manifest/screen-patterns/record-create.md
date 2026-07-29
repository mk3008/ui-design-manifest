---
type: UI Screen Pattern
title: Record create
description: A focused form for creating one product-declared record.
status: draft
source: authored
scope: Single-record creation.
requires:
  - components/record-fields
  - flows/record-lifecycle
---

# Guidance

Identify the create task in the screen title and show only supplied fields.
Start from product defaults or empty values; do not copy values from an
unrelated record. Follow the Record fields single-column default unless the
binding explicitly supplies a related field group.

Keep one clear primary Create action and a separate Cancel action when the
binding supplies a safe destination. These are page-finalizing actions: place
them in a persistent footer action region rather than at the top of the form.
The region must remain available while a long form scrolls and must not obscure
the last field or its validation message.

Within this full-page action region, put Create before Cancel in source,
reading, visual, and Tab order. Do not move initial focus to Cancel. Keep this
order consistent across full-page create and edit tasks; it is not local
configuration.

On validation failure, keep entered values, place messages with their fields,
and provide a summary that moves users to the errors. While submission is
pending, prevent duplicate creation without moving the primary action.

# Transition roles

This pattern receives `begin_create` and provides `create_success`,
`create_failure`, and `cancel_create`. The product binding supplies all
destinations and whether unsaved cancellation needs confirmation.

# Product boundary

Field schema, defaults, validation, permissions, persistence, identity
generation, duplicate detection, result, notification, and destinations are
product-owned.

# Implementation boundary

Footer positioning, scroll container mechanics, control widths, concrete
height, CSS, DOM, and framework are implementation decisions. The fixed
requirements are one aligned field flow, persistent finalizing actions, and
primary-before-cancellation logical order. A bidirectional platform may mirror
physical alignment without changing the logical action sequence.
