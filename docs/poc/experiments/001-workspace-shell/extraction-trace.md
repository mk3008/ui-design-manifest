# Extraction trace

## Repository guidance read, in order

1. `README.md`
2. `profile/index.md`
3. `profile/ui-profile.md`
4. `prompts/extract-from-existing-ui.md`
5. `docs/poc/experiment-ladder.md`

## Source states inspected, in order

1. The normalized expanded state: 1280x720, light theme, JP active, Overview active, top scroll position, sidebar expanded.
2. The visible sidebar-toggle interaction to the collapsed state.
3. The restored expanded state, only to confirm return of the exposed sidebar state.

Only the visible/accessibility-exposed labels, pressed/expanded state, landmark hierarchy, and screenshots required by the declared scope were used. Excluded pages, controls, scroll regions, lower content, alternate viewports, implementation source, CSS, network, browser storage, and cookies were not inspected.
