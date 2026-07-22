# Phase 2A implementation requirements

This is a source-blind, bounded evaluation task. Build one static HTML/CSS table specimen; do not access any original UI, historical experiment artifact, or source-aware material.

## Required outcome

- One visible header row and exactly three repeated body rows.
- Four headers, in order: `State`, `Record`, `Context`, `Summary`.
- Use fixture record values `Item 1`, `Item 2`, and `Item 3`; use generic context values `Context A`, `Context B`, and `Context C`.
- Leave state and summary cells visually reserved but semantically empty: no state labels, status claims, counts, destinations, controls, or interactions.
- Make `Record` the strongest text target. Keep the other columns quieter.
- Maintain aligned columns, compact readable rows, restrained neutral surfaces, light row separation, and stronger grouping within a cell than between rows.
- Provide wide and narrow viewport renderings. Narrow may scroll horizontally rather than inventing a responsive transformation.

## Prohibited outcome

- No source/product names, URLs, screenshots, copied wording, data, identities, status names, identifiers, or original-specific layout claims.
- No actions, query inputs, navigation, row click behavior, links, selection, editing, loading, empty, or error UI.
- No semantic state or summary meaning beyond the explicit empty reserved cells.

## Deliverables

Create `implementation/initial-result.html`, `implementation/initial-result.css`, `implementation/wide.png`, `implementation/narrow.png`, and `implementation/implementation-log.md`. Preserve this first result unchanged after it is saved.
