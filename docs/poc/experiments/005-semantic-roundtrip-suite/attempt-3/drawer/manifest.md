---
type: Drawer Design Manifest
title: Primary navigation Drawer relationships
description: Source-independent guidance for hierarchy, current-state emphasis, and restrained navigation density.
status: draft
source: mixed
scope: Open primary navigation Drawer at one wide visual state only.
---

# Guidance

Treat the Drawer as a persistent-looking orientation region in the represented wide state, visually distinct from its adjacent work surface. This is a visible relationship, not a claim about runtime presentation or persistence.

Use a stable vertical reading order and repeated navigation-row rhythm. Keep row treatment restrained: navigation rows are not decorative rounded cards. Express the Drawer edge through a quiet region boundary rather than a copied surface treatment.

When supplied navigation data contains an expandable parent with shown children, preserve the distinction between the parent row, its disclosure relationship, and the indented child rows. A top-level item with no shown children and an independent/direct item remain direct destinations; do not fabricate section captions or non-destination group containers.

Give the current destination a visible distinction from comparable non-current rows without prescribing a particular color, geometry, or icon treatment. The distinction must also be available programmatically when the application supplies a current-destination state model.

An icon-only control may occupy a compact position at the Drawer’s interior top edge, separate from navigation rows. Its semantic responsibility, state model, operation, and display condition belong to the application input contract. Do not infer closed representation, toggle behavior, or persistence from this open static state.

Use an icon only when the application supplies a meaningful semantic icon slot and an approved accessible SVG treatment. Otherwise omit the icon. Do not substitute ASCII boxes, empty squares, checkbox-like placeholders, or source-specific icon names.

# Boundaries and unresolved areas

No rule covers header, main content, right-side utilities, footer, or complete-page composition. The bounded wide open state establishes visible hierarchy, current-state comparison, rhythm, and edge relationships, but does not establish presentation mode, closed representation, persistence, responsive behavior, focus behavior, motion, overflow behavior, or contrast conformance.

The bounded state visibly has no retained non-destination group caption or group container. That is an observed absence for this state only, not a universal prohibition. No badge, count, permission, destination, or additional hierarchy role is retained. Product-owned navigation meaning and topology must be supplied through the [Application Input Contract](application-input-contract.md).

Each unresolved axis needs its own smallest later input: a paired visibility state for presentation mode; a closed-state image for closed representation; a state-retention sequence for persistence; a narrow-viewport image for responsive behavior; a focused-state image or keyboard sequence for focus; a bounded interaction sequence for motion; an overflow-pressure state for overflow; and semantic or contrast inspection for accessibility claims. The complete status inventory is in [the coverage classification](exercised-classification.md#source-observation-inventory).

# Relationships

Apply only with [the Application Input Contract](application-input-contract.md). Exercise the retained claims using [the fixture trace](fixture-trace.md) and review them through [the claim matrix](claim-matrix.md).
