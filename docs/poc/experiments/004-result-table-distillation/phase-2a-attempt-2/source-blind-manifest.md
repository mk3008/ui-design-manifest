---
type: UI Screen Pattern
title: Bounded read-only operational table
description: Direction for a compact, column-aligned table that supports repeated-record scanning without authoring product meaning.
status: draft
source: mixed
scope: One header row and repeated rows with record state, primary record, identity context, and grouped state summary.
---

# Guidance

Use this pattern only for a bounded read-only operational table. It describes visual and responsibility boundaries, not page composition, product data, or interaction requirements.

## Structure and reading order

Keep one persistent header row aligned with repeated body cells. Organize each row from record state, to primary record, to identity context, to grouped state summary. This order supports both vertical comparison within a role and horizontal reading of one record.

Treat the header as the interpretation key for body cells. Preserve clear column alignment and a stable row rhythm so surrounding page context is not needed to understand the repeated structure.

## Hierarchy and density

Make the primary-record value the strongest reading target in each row. Keep headers, identity context, and repeated state marks quieter. Use closer relationships among content that belongs to one cell and economical separation between records.

Maintain compact operational density while keeping values and state treatment distinguishable. Prefer a restrained neutral surface, light row separation, and limited state accents. Avoid decorative card treatment or emphasis that competes with repeated-record scanning.

## Role responsibilities

- **Record state:** A compact leading treatment may reinforce a product-owned state. It must not be the only carrier of state meaning.
- **Primary record:** This cell owns the strongest row-level value. Supporting context, if supplied by the target product, remains subordinate.
- **Identity context:** A compact identity representation is secondary to the primary record. Its form and content are product-owned.
- **Grouped state summary:** Repeated compact marks read as one cell-level summary, with shared containment and rhythm. Do not assign their labels, counts, meanings, or update behavior here.

When the target product supplies a destination, distinguish the relevant value as a link within its own cell. Do not infer a row-level destination or destinations for other cells.

# Inferences

- The ordered roles favor a left-to-right scan from condition, through the main record, to supporting context and compact summary.
- Repeated state marks should be perceived as one coherent summary rather than unrelated inline controls.

# Unresolved

- State meanings, allowed values, sources of truth, display conditions, and update triggers are not established.
- Record values, identity representation, destinations, interaction behavior, focus behavior, and assistive-technology behavior require target-product inputs.
- Responsive behavior, overflow treatment, and accessibility conformance are outside this bounded direction.
- Do not add actions, query inputs, result summaries, navigation, selection, editing, loading, empty, error, or page-composition rules from this manifest.
