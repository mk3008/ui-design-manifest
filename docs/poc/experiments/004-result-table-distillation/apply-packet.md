# Source-blind application packet

An implementer may receive this file only, together with the standard application prompt and target-product inputs. Do not provide any calibration material.

## Read-only result-table direction

Use this direction only for a bounded read-only operational table. Keep one header row aligned with repeated body cells. Preserve four reading roles: record state, primary record, identity context, and grouped state summary. Do not add actions, query inputs, result summaries, navigation, or page composition rules.

Treat the header as the persistent key for body cells. Maintain vertical column scanning and horizontal record scanning with a stable row rhythm and light separation. Keep the table compact but readable.

Make the primary-record value the strongest reading target. Keep identity context secondary. A compact state treatment may appear at the leading edge only when the target product supplies a state model; color alone must not carry meaning. Group repeated compact state marks as one cell-level summary without assigning semantics, labels, counts, or update behavior.

When the target product supplies a destination, distinguish a value as a link within its own cell. Do not infer a whole-row destination.

Use compact operational density, restrained contrast, limited state accents, closer relationships within a cell, and economical separation between records.

## Unresolved

State meanings, data sources, update triggers, record values, identity representation, destinations, interaction behavior, responsive behavior, overflow treatment, and accessibility conformance are target-product decisions.
