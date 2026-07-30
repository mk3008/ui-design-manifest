# Evaluation

## Outcome

`valid` — this is a fresh, unchanged three-run observation set generated from
the revised Manifest snapshot, the same fixed product prompt, and the declared
fixed common-shell fixture. The result supports a bounded communication-quality
claim, not a pixel-identity or full runtime-conformance claim.

## Fixed inputs

- Baseline commit: `2074bf0ac6b99d6265917bad987cf2dc2039e139`
- Model and reasoning effort: `gpt-5.6-terra`, `medium`
- Runs: `3`, independently authored once
- Manifest snapshot: 45 files
- Prompt SHA-256:
  `27AD9B686EA590F45B75E100F9FFE68D2B82E3B2BE7BACBC4A609A9E135E9874`
- Common-shell template SHA-256:
  `764E870E5DC584BAB41EF07220653AD98ACBC3A9769D31F678BDBF3A9AB7C21F`

## Input change under test

Attempt 22 exposed a `manifest-gap`: the earlier wording allowed a generated
page to treat a subtle pinned-column shadow as permanent. The revised Result
Grid guidance now requires all of the following:

1. the initial position (`scrollLeft = 0`) has no box shadow;
2. the one-pixel row-separator boundary remains visible at that position;
3. a subtle shadow appears only after the Grid scroll container has
   `scrollLeft > 0`; and
4. the shadow is removed when the position returns to zero.

Because the Manifest input changed, this new numbered attempt regenerated all
three outputs. No Attempt 22 output was copied, repaired, or used as a source.

## Capture evidence

- Chrome: `C:\Program Files\Google\Chrome\Application\chrome.exe`
- Chrome version: `150.0.7871.187`
- Desktop: 12 PNGs at `1440×1200`; narrow: 3 PNGs at `720×1200`
- Normal capture exit code: `0` for 15/15 captures
- SwiftShader fallback: 0 uses
- Raw PNG SHA-256 values, bytes, dimensions, and command record:
  [capture-record.json](capture-record.json)

Initial-state PNG review confirms the pinned identity column has only its thin
separator in Run 1, Run 2, and Run 3. The generated sources and limited static
check confirm that each Run derives the optional shadow from its own Grid
container's `scrollLeft > 0` state and removes it at zero.

## Verification

| Command | Exit | Result |
| --- | ---: | --- |
| `tests/check-customer-search-common-shell-variability-attempt23.ps1` | 0 | 3 fresh sources, 45-file snapshot, immutable fixture boundary, 15 captures, no external references, complete-table local Grid scrolling, and conditional pinned-shadow source rule |
| `tests/check-business-workflow-standard-pack.ps1` | 0 | 26 concepts, 23 index links, 5 settings, 23 theme roles, 2 modes, 10 overrides, 8 negative cases, 72 contrast assertions, 2 binding fixtures |
| `tests/check-source-boundaries.ps1` | 0 | Source Independence preserved |
| `git diff --check` | 0 | No whitespace errors |

## Evidence limits

The PNGs prove the initial no-shadow state. The later-scroll shadow behavior is
verified from the generated JavaScript/CSS source and static check; it was not
captured as a separate post-scroll PNG. Browser automation for a direct file
URL was blocked by that tool's file-protocol safety restriction, so this report
does not claim an observed post-scroll screenshot.

## Protocol review

| Check | Result |
| --- | --- |
| Output changed after three-run generation | No |
| Previous attempt output reused | No |
| Manifest/prompt/fixture change after generation | No |
| Validity for reproducibility comparison | Valid |
| Remaining limitation | Post-scroll state has source/static, not screenshot, evidence |
