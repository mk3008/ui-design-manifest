# Result Grid Calibration Report

## Status

ready_for_review — source-blind calibration fixture corrected, rendered, and verified.

## Opened files

- `profile/ui-profile.md`
- `docs/poc/experiments/007-search-components/result-grid/attempt-1/manifest.md`
- `docs/poc/experiments/007-search-components/result-grid/attempt-1/application-input-contract.md`
- `docs/poc/experiments/007-search-components/result-grid/attempt-1/apply-instruction.md`

`prohibited_inputs_used=false`.

## Fixture trace and decisions

- The Contract's selection slot supplies one checked native checkbox and one unchecked native checkbox.
- The Contract's text, numeric, and sorted-column slots supply placeholder-only labels and values; no product data, identity, status, or aggregate is asserted.
- Five neutral repeated rows make the compact repeated rhythm reviewable without adding a new semantic slot.
- The active sorted text header uses one meaningful inline ascending SVG at the control's right edge. Other headers have no persistent sort icon.
- The supplied remaining-space direction is trailing table-surface whitespace. The table has three semantic columns only; no filler column was added.
- CSS retains a compact, single-line, vertically centered table rhythm with text left, numeric values right, and selection centered.

## Assumptions and gaps

- This is static visual evidence only; controls have no declared update behavior.
- The narrow rendering deliberately retains the wide grid structure. Its content-width surface exceeds the 390px viewport, so horizontal overflow/clipping remains unresolved rather than receiving an invented narrow transformation or overflow policy.
- No unsupported user-visible hierarchy, action, destination, state, or copy was invented. The neutral placeholders are limited to Contract-declared fixture slots.

## Render and checks

- Rendered with installed Chrome in headless mode from the local HTML file at 1440x900 and 390x844.
- PNG dimensions and nonblank output were checked after rendering.
- Checked the allowlist record, scanned implementation text for network URLs/dependency references, ran `git diff --check`, and ran the focused Result Grid content check.

## Commit

The correction commit contains the five files in this experiment-local `implementation/` directory only; root-level copies were removed.
