---
type: Independent evaluator record
title: Pattern A static evaluation
description: Read-only evaluation of the fixed attempt-2 artifacts and three bounded claims.
status: human-review-required
source: independent-evaluator
---

# Evaluation boundary

The evaluator used the experiment contract, artifact manifest, and the two
fixed PNGs only. Raw-byte SHA-256 and viewport identity were checked before
observation. No implementation source, prior attempt, external Web material,
or human result was used. This is a static image observation, not evidence of
behavior or implementation semantics.

| Artifact ID | State | Path | SHA-256 raw-byte | Viewport |
| --- | --- | --- | --- | --- |
| `HDA2-A-OPEN-1280X720` | `A-open` | `implementation/A-open.png` | `FDA2661FAF07A0CD3F71177E6BE32F7036ADC45354C7136C74B776DC0FF96A7C` | `1280x720` |
| `HDA2-A-HIDDEN-1280X720` | `A-hidden` | `implementation/A-hidden.png` | `EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161` | `1280x720` |

# Results

| Claim ID | Artifact IDs and digests | Comparison scope | Observed result | Result | Limitation | Next condition |
| --- | --- | --- | --- | --- | --- | --- |
| `PA-CTRL` | `HDA2-A-OPEN-1280X720` / `FDA2661FAF07A0CD3F71177E6BE32F7036ADC45354C7136C74B776DC0FF96A7C`; `HDA2-A-HIDDEN-1280X720` / `EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161` | Fixed `A-open` / `A-hidden` PNGs only. | The evaluator reported a Header controller in `A-open` but no Header/controller in `A-hidden`. | `failure` | Static image observation only; activation, ARIA, keyboard, focus, Escape, assistive technology, DOM/CSS mechanism, persistence, responsive behavior, destinations, and universal ownership are not assessed. | A human must inspect the identical fixed artifacts before any integration decision. |
| `PA-TITLE` | `HDA2-A-OPEN-1280X720` / `FDA2661FAF07A0CD3F71177E6BE32F7036ADC45354C7136C74B776DC0FF96A7C`; `HDA2-A-HIDDEN-1280X720` / `EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161` | Fixed `A-open` / `A-hidden` PNGs only. | The evaluator reported `Workspace` in `A-open` but not in `A-hidden`. | `failure` | Static image observation only; heading semantics and accessible name are not assessed. | A human must inspect the identical fixed artifacts before any integration decision. |
| `PA-HIDDEN` | `HDA2-A-HIDDEN-1280X720` / `EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161` | Fixed `A-hidden` PNG only. | The evaluator reported no visible Drawer, empty Drawer boundary, or retained Drawer width. | `preserved` | One fixed viewport only; no DOM/CSS, animation, persistence, or responsive inference. | Keep the comparison limited to this static state. |

## Evaluation note

The evaluator task was read-only and changed no files. A prior evaluator
attempt was discarded after its report could not be reconciled through a
same-task re-observation. The replacement evaluator above independently
recomputed the same artifact hashes and supplied the recorded results. Neither
evaluation is a human decision; the human-review packet remains the required
gate.
