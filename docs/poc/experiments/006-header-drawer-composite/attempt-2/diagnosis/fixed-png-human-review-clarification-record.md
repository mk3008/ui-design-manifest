---
type: Human review clarification record
title: Pattern A fixed-PNG human decisions
description: User-provided decisions for the two fixed PNG artifacts only.
status: recorded
source: human
review_id: HDA2-FIXED-PNG-HUMAN-CLARIFICATION-20260726
phase_3b_baseline: 33a16e2bfbd2f1f60cfabb78cc26b6b4d02e4ea6
phase_3c_commit: 857abc0a9015603af46581c5cb0df841d07d0567
---

# Fixed-PNG Human Review Clarification

## Review boundary

This record captures the user’s response to the fixed-PNG clarification packet
only. The reviewed evidence is the `A-open` and `A-hidden` PNG pair at
`1280x720`, identified below. It neither replaces nor edits the historical
`human-review-record.md`, and it does not alter the Phase 3B `rejected` result
or the Phase 3C diagnosis.

| Artifact ID | State | Path | SHA-256 raw-byte | Viewport |
| --- | --- | --- | --- | --- |
| `HDA2-A-OPEN-1280X720` | `A-open` | `../implementation/A-open.png` | `FDA2661FAF07A0CD3F71177E6BE32F7036ADC45354C7136C74B776DC0FF96A7C` | `1280x720` |
| `HDA2-A-HIDDEN-1280X720` | `A-hidden` | `../implementation/A-hidden.png` | `EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161` | `1280x720` |

## Recorded human decisions

| Claim | Decision | Visible basis | Reviewed artifacts |
| --- | --- | --- | --- |
| `PA-CTRL` | `accept` | In both `A-open` and `A-hidden`, the Drawer-control icon is visible within the Header region and is recognizable as the same control across the state change. | `HDA2-A-OPEN-1280X720`; `HDA2-A-HIDDEN-1280X720` |
| `PA-TITLE` | `accept` | In both `A-open` and `A-hidden`, the primary title is visibly retained within the Header region. | `HDA2-A-OPEN-1280X720`; `HDA2-A-HIDDEN-1280X720` |
| `PA-HIDDEN` | `accept` | In `A-hidden`, no Drawer body, empty Drawer boundary, or retained Drawer space is visible; the Drawer is visually hidden. | `HDA2-A-HIDDEN-1280X720` |

## Out of scope

This human decision is visual-only. Keyboard, focus, Escape, ARIA, assistive
technology, persistence, responsive behavior, animation, DOM/CSS mechanics,
destinations, and runtime behavior remain out of scope.

No evaluator comparison, claim/rubric revision, independent review, standard
pack promotion, or conclusion change is made by this record.
