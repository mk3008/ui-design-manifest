---
type: Evidence reconnection experiment contract
title: Header–Drawer Pattern A static contract
description: Fixed evidence roles, states, and claims for one isolated Pattern A attempt.
status: active
source: authored
---

# Identity

- Experiment ID: `header-drawer-pattern-a-reconnection-attempt-2`
- Baseline commit: `de00ec0f10c506e2aa74deae3c09b5d4c736406b`
- Pattern: Pattern A only — a Header-located Drawer controller with a fully
  hidden Drawer state.
- Viewport: `1280 x 720` CSS pixels. This is the confirmed viewport of the
  corrected `attempt-1/implementation-attempt-2` Pattern A captures; this
  attempt does not treat the unrelated `1280 x 800` legacy capture as the same
  evidence.
- Browser: Google Chrome `150.0.7871.184`, headless, direct local `file:` URI.
- Capture command: the exact command is the local
  [`implementation/capture.ps1`](implementation/capture.ps1) command recorded
  in the artifact manifest.

# Source-blind boundary

The implementation reads only
[source-blind-implementation-input.md](source-blind-implementation-input.md).
It receives no original UI, external oracle, copied product labels, source
image, route, or product binding. The external oracle is evaluator and human
review material only; it is not an implementation input.

# Fixed states and artifacts

| State ID | Stable artifact ID | Artifact | Intended static comparison |
| --- | --- | --- | --- |
| `A-open` | `HDA2-A-OPEN-1280X720` | `implementation/A-open.png` | Header controller, title anchor, visible Drawer. |
| `A-hidden` | `HDA2-A-HIDDEN-1280X720` | `implementation/A-hidden.png` | Same Header controller and title anchor, no visible Drawer or retained Drawer boundary. |

# Claims in scope

| Claim ID | Static claim | Allowed result vocabulary |
| --- | --- | --- |
| `PA-CTRL` | The Drawer controller is perceptibly in the Header in both states and is not a Drawer-body item. | `preserved`, `partial`, `failure`, `not exercised` |
| `PA-TITLE` | The primary title anchor remains in the Header in both states. | `preserved`, `partial`, `failure`, `not exercised` |
| `PA-HIDDEN` | `A-hidden` has no visible Drawer region, empty Drawer boundary, or retained Drawer space. | `preserved`, `partial`, `failure`, `not exercised` |

# Out of scope

Do not infer or assess controller activation, ARIA relationships, keyboard,
focus, Escape, assistive technology, DOM/CSS mechanism, animation,
persistence, responsive behavior, viewport policy, navigation destinations,
or a universal controller-ownership rule. These are `not exercised`, not
successful results.

# Evidence roles and decision gate

- The identity check proves paths, hashes, identifiers, and record references;
  it does not prove visual meaning.
- The independent evaluator compares only the fixed PNGs and the three claims.
- The human reviewer makes the three `accept`, `reject`, or `uncertain`
  decisions from the same fixed artifacts.
- A final identity reconciliation is permitted only after actual human answers
  are recorded. No AI result is a human answer.
