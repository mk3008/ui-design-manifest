# Evaluation

## Outcome

`valid with fixture-gap` — the three untouched outputs are a valid observation
set for the frozen current Manifest, product prompt, and declared common-shell
fixture. They consistently implement the supplied customer-create task, but
they also expose a fixture contract gap for the semantic error role. This set
is evidence of that gap; no generated Run was repaired.

## Fixed inputs

- Baseline commit: `b12905907ba383bd8a49d2e7da6eaccc4cffdd27`
- Model and reasoning effort: `gpt-5.6-terra`, `medium`
- Runs: `3`, independently authored once
- Manifest snapshot: `45` files
- Prompt SHA-256:
  `FCEA798C64880A88024A17BF45D7DCDED365086F7CE7E61BFBFD329B061E4874`
- Common-shell template SHA-256:
  `764E870E5DC584BAB41EF07220653AD98ACBC3A9769D31F678BDBF3A9AB7C21F`

## Observed supplied responsibilities

| Requirement | Run 1 | Run 2 | Run 3 |
| --- | --- | --- | --- |
| Customer ID omitted as a control | pass | pass | pass |
| Five required fields and optional Notes | pass | pass | pass |
| Labeled fields with field-associated error regions | pass | pass | pass |
| Blur, submit, and correction validation source | pass | pass | pass |
| Non-persistent Save and local assets | pass | pass | pass |
| Fixed shell asset hashes and page-slot boundary | pass | pass | pass |
| Dedicated bottom Save/Cancel row at logical start | pass | pass | pass |
| Primary-before-secondary source order | pass | pass | pass |
| 1440px Light/Dark and Drawer captures | pass | pass | pass |
| 720px bounded-pane capture | pass | pass | pass |

## Deviation ledger

| Observable deviation | Classification | Evidence | Consequence |
| --- | --- | --- | --- |
| The frozen shell exposes `action_*`, table, surface, and text variables but does not expose the Manifest's `error_foreground` role. | `fixture-gap` | `consumer-input/common-shell-fixture/shell.css` has no `--error-foreground`; the Manifest requires resolved semantic roles at the shell root. | A page cannot consistently consume the resolved error role through the declared fixture. |
| Runs 1 and 2 use a literal fallback `#B42318` when marking required/error content; Run 3 writes Light/Dark literals explicitly. | `fixture-gap` | `runs/run-N/page.css`; all three pages visibly retain red required markers, but role consumption is not uniform. | The current experiment must not claim correct manifest-driven error-color resolution in both modes. |

This is not repaired in-place. A later improvement must first correct the
fixture contract (and, if needed, make the shell expose `--error-foreground`
and the paired semantic roles), then use a new numbered attempt with three
fresh implementations.

## Capture evidence

- Chrome: `C:\Program Files\Google\Chrome\Application\chrome.exe`
- Chrome version: `150.0.7871.187`
- Desktop: `12` PNGs at `1440x1200`
- Narrow: `3` PNGs at `720x1200`
- Normal capture exit code: `0` for `15/15` captures
- SwiftShader fallback: `0` uses
- Raw PNG SHA-256, byte counts, dimensions, commands, and exit codes:
  [capture-record.json](capture-record.json)

Visual review of the initial Light/Drawer-open captures confirms a shared
shell, a bounded single-column form, visible field labels, and a separate
left-aligned Save/Cancel row in all three runs. It does not turn the
fixture-gap above into a pass.

## Verification

| Command | Exit | Result |
| --- | ---: | --- |
| `tests/check-customer-create-common-shell-variability-attempt8.ps1` | 0 | 3 fresh sources, 45-file snapshot, immutable fixture boundary, 15 captures, local-only assets, required/optional labels, and validation source checks |
| `tests/check-business-workflow-standard-pack.ps1` | 0 | 26 concepts, 23 index links, 5 settings, 23 theme roles, 2 modes, 10 overrides, 8 negative cases, 72 contrast assertions, 2 binding fixtures |
| `tests/check-source-boundaries.ps1` | 0 | Source Independence preserved |
| `git diff --check` | 0 | No tracked whitespace errors in the current working diff |

## Protocol review

| Check | Result |
| --- | --- |
| Output changed after the three-run generation phase | No |
| Previous generated output reused | No |
| Manifest, prompt, or fixture changed after generation | No |
| Validity for reproducibility comparison | Valid observation set |
| Final status | Partial because the fixed shell omits the required semantic error role |
