---
type: Application Input Contract
title: Drawer application inputs
description: Bounded inputs and omissions for applying the drawer guidance.
status: draft
source: authored
---

# Allowed application inputs

The implementer may use the local design manifest, current target-product implementation, repository guidance, explicit product requirements, and this contract. The original visual input and extraction material are excluded.

# Primary-record value

A primary-record value is not applicable to this navigation surface. It is omitted and must never be invented. Provenance, display, update, and absence behavior for a primary-record value are inapplicable and omitted.

# State model

No drawer state source of truth, display condition, or update trigger is supplied. Do not add a toggle, persistence, dismissal behavior, compact representation, or disclosure operation. Render only the product-established open state when the target implementation already provides it; otherwise stop for a product decision.

# Navigation data

No destination, identity, aggregate, or display-copy value is supplied. Do not invent rows, labels, icons, destinations, identity, or hierarchy. Existing target-product navigation data may fill an already established semantic slot; absent that data, omit the dependent UI.

# Current state

No current destination is supplied. Apply a programmatic current-state indication only when the target product supplies one; otherwise render no selected item.

# Accessibility

When the target product supplies interactive navigation controls, it must supply their discernible names and destination semantics. If it supplies an expandable relationship, it must supply expanded/collapsed state and the controlled relationship. Keyboard, focus, contrast, forced-colors, responsive, and assistive-technology behavior require separate verification.
