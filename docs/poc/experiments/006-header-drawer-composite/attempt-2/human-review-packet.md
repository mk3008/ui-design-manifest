---
type: Human review packet
title: Pattern A artifact-identity review
description: Human decision packet for three fixed static claims only.
status: awaiting-human-review
source: authored
---

# Review boundary

The human decision surface is [human-review.html](human-review.html). This
Markdown file is a mechanical identity sheet for the static check, not a
human-review gate.

This packet concerns only the two fixed artifacts listed below. Do not compare
them to assets under `../attempt-1/`; those are historical evidence and not
this experiment's input. The evaluator is not the human reviewer. Its findings
are supplied only as a separate, limited observation.

| State | Artifact ID | Bundle-relative path | SHA-256 raw-byte | Viewport |
| --- | --- | --- | --- | --- |
| `A-open` | `HDA2-A-OPEN-1280X720` | `implementation/A-open.png` | `FDA2661FAF07A0CD3F71177E6BE32F7036ADC45354C7136C74B776DC0FF96A7C` | `1280x720` |
| `A-hidden` | `HDA2-A-HIDDEN-1280X720` | `implementation/A-hidden.png` | `EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161` | `1280x720` |

![A-open](implementation/A-open.png)

![A-hidden](implementation/A-hidden.png)

# Fixed questions

Respond to every question with exactly `accept`, `reject`, or `uncertain`, and
add a short basis or problem location. Do not infer activation, ARIA,
keyboard, focus, Escape, assistive technology, persistence, animation,
responsive behavior, DOM/CSS mechanics, or navigation destinations.

1. `PA-CTRL` — In both states, does the Drawer controller visually belong to
   the Header rather than appearing as a Drawer-body item?
2. `PA-TITLE` — In both states, is the primary `Workspace` title anchor kept in
   the Header?
3. `PA-HIDDEN` — In `A-hidden`, is the Drawer absent without an empty Drawer
   boundary or retained Drawer space?

## Human response record

| Claim | Response | Basis / problem location |
| --- | --- | --- |
| `PA-CTRL` | pending | Actual human response required. |
| `PA-TITLE` | pending | Actual human response required. |
| `PA-HIDDEN` | pending | Actual human response required. |

# Evaluator input and limitation

The independent evaluator used the experiment contract, artifact manifest, and
the two exact PNGs only. Its record is
[evaluator-record.md](evaluator-record.md); it is not a human decision.

| Claim | Evaluator result | Limitation |
| --- | --- | --- |
| `PA-CTRL` | `failure` | Static image only; no activation, ARIA, keyboard, focus, Escape, AT, persistence, or responsive inference. |
| `PA-TITLE` | `failure` | Static image only; no heading or accessible-name inference. |
| `PA-HIDDEN` | `preserved` | One fixed viewport only; no DOM/CSS, animation, or behavioral inference. |

An external oracle, if a human reviewer is authorized to use one, is read-only
comparison material and is neither copied here nor used as an implementation
input.
