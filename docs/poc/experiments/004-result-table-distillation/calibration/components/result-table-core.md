---
type: UI Component
title: Read-only result table core
description: A compact, column-aligned operational table with a restrained hierarchy and repeated stage-state grouping.
status: experimental
source: mixed
scope: Status, Pipeline, Author, and Stage columns in a read-only result table.
requires:
  - ../evidence-register
---

# Contract boundary

Use this component only for a bounded read-only result table. Keep one header row aligned with repeated body cells beneath it. Preserve the four accepted column roles in reading order: Status, Pipeline, Author, and Stage.

Do not treat the source's adjacent Actions column as part of this component. Do not add controls, query inputs, result summaries, navigation, or page composition rules.

# Evidence

- **Observed:** the nominated source exposes a table with a single header row and repeated aligned body cells. The four in-scope columns occur before the excluded Actions column.
- **Observed:** each body row presents a compact status treatment, a Pipeline cell with the strongest text hierarchy, an Author cell led by an avatar-like identity mark, and a Stage cell that repeats grouped state marks.
- **Observed:** status and pipeline identifiers are links in the source. This supports a visible link affordance for those values, but does not establish a whole-row click target.
- **Observed:** the source uses a dark neutral table surface, subdued column headers, compact horizontal rules between rows, and small state accents against otherwise restrained neutral treatment.
- **Observed:** the stage area contains multiple compact, repeated visual state marks within the same cell. Their product meaning and update model are not established by this extraction.

# Directional guidance

## Table identity and alignment

Treat the header row as the persistent key for interpreting every body row. Maintain clear header-to-cell alignment so a reader can scan one column vertically and one record horizontally without relying on surrounding page context.

Use a stable row rhythm and light record separation. Keep the table dense enough for operational comparison while leaving each column's value and state treatment distinguishable.

## Cell hierarchy

- **Status:** place the compact state treatment at the leading edge. Its color may reinforce a state only when a product-owned state model supplies the meaning; color alone must not carry that meaning.
- **Pipeline:** make the record identifier or primary record value the strongest reading target in the row. Keep supporting record context visually subordinate, and do not prescribe which source-specific details belong there.
- **Author:** use a compact identity representation that remains secondary to the pipeline value. Whether an avatar, name, or other identity value is present depends on product evidence.
- **Stage:** group repeated compact state marks as one cell-level summary. Preserve their repeated rhythm and shared containment without assigning status semantics, labels, counts, or update behavior.

## Link affordance

When the product supplies a destination for a Status or Pipeline value, distinguish that value as a link within its own cell. Do not extend this observation into a rule that the whole row is clickable, that every cell is a destination, or that a specific destination exists.

## Density, contrast, and relational spacing

Keep a compact but readable operational density. Let the Pipeline cell carry the clearest text hierarchy; keep headers, identity detail, and repeated stage marks quieter. Use closer relationships within each cell and stronger, economical separation between records. Prefer a restrained neutral surface with a limited use of state accents over a decorative or card-heavy treatment.

# Inferences

- **Inferred from the observed table structure:** the four-column order supports a left-to-right scan from state, to primary record, to identity context, to grouped progress/state context.
- **Inferred through the business-application lens:** the source's compact rows and restrained contrast are suitable direction for repeated operational scanning. This is authored evaluation, not a source fact.
- **Inferred from repeated stage marks:** stage-state grouping should read as a coherent summary rather than as unrelated inline controls. Its semantic state model remains unresolved.

# State and display-copy boundary

No source status, stage, identifier, author, record context, or link label is authorized as reusable display copy. No neutral fixture is authorized by this Contract. A later rendering may add a state-bearing value only after its data/source of truth, possible meaning, display condition, and update trigger are established by an authoritative product input.

# Unresolved

- Hover appearance, keyboard behavior, focus treatment, assistive-technology behavior, and accessibility conformance were not observed.
- The meaning, allowed values, update trigger, and data source for status and grouped stage marks were not established.
- Pipeline cell subfields, author representation, link destinations, and all row interaction beyond observed per-value links remain product-owned decisions.
- Responsive behavior, overflow treatment, and all excluded seams remain outside scope.
