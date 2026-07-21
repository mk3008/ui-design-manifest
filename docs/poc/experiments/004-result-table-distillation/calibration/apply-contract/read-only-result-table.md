---
type: UI Component
title: Read-only result table
description: A compact, column-aligned operational table with restrained hierarchy and repeated grouped state marks.
status: experimental
source: mixed
scope: Record state, primary record, identity context, and grouped state summary only.
---

# Contract boundary

Use this component only for a bounded read-only result table. Keep one header row aligned with repeated body cells beneath it. Preserve four column roles in reading order: record state, primary record, identity context, and grouped state summary.

Do not add a separate action area, controls, query inputs, result summaries, navigation, or page composition rules.

# Directional guidance

## Table identity and alignment

Treat the header row as the persistent key for interpreting every body row. Maintain clear header-to-cell alignment so a reader can scan one column vertically and one record horizontally without relying on surrounding page context.

Use a stable row rhythm and light record separation. Keep the table dense enough for operational comparison while leaving each column's value and state treatment distinguishable.

## Cell hierarchy

- **Record state:** place a compact state treatment at the leading edge. Color may reinforce a state only when a product-owned state model supplies its meaning; color alone must not carry that meaning.
- **Primary record:** make the primary record value the strongest reading target in the row. Keep supporting record context visually subordinate, without prescribing which details belong there.
- **Identity context:** use a compact identity representation that remains secondary to the primary record value. Whether it includes an image, name, or another identity value depends on product evidence.
- **Grouped state summary:** group repeated compact state marks as one cell-level summary. Preserve their repeated rhythm and shared containment without assigning semantics, labels, counts, or update behavior.

## Link affordance

When the product supplies a destination for a record-state or primary-record value, distinguish that value as a link within its own cell. Do not extend this into a rule that the whole row is clickable, that every cell is a destination, or that a specific destination exists.

## Density, contrast, and relational spacing

Keep a compact but readable operational density. Let the primary-record cell carry the clearest text hierarchy; keep headers, identity context, and repeated state marks quieter. Use closer relationships within each cell and stronger, economical separation between records. Prefer a restrained neutral surface with limited state accents over a decorative or card-heavy treatment.

# Inferences

- The column order supports a left-to-right scan from state, to primary record, to identity context, to grouped state context.
- Compact rows and restrained contrast are suitable direction for repeated operational scanning. This is qualitative guidance, not a claim about a product requirement.
- Repeated state marks should read as one coherent summary rather than as unrelated inline controls. Their semantic state model remains unresolved.

# State and display-copy boundary

No record value, state, identity value, link label, or neutral fixture is authorized by this Contract. A later rendering may add a state-bearing value only after its data/source of truth, possible meaning, display condition, and update trigger are established by an authoritative product input.

# Unresolved

- Hover appearance, keyboard behavior, focus treatment, assistive-technology behavior, and accessibility conformance are not established.
- The meaning, allowed values, update trigger, and data source for record state and grouped state marks are not established.
- Primary-record subfields, identity representation, link destinations, and all row interaction beyond per-value links remain product-owned decisions.
- Responsive behavior, overflow treatment, and all excluded seams remain outside scope.
