---
type: Artifact identity reconciliation
title: Four-party attempt-2 identity check
description: A bounded comparison of the two fixed artifact tuples across all required records.
status: complete
source: authored
---

# Scope

This reconciliation compares only artifact identity. It does not reconcile the
evaluator and human visual judgments.

| Artifact ID | manifest | static check | evaluator | human review | result |
| --- | --- | --- | --- | --- | --- |
| `HDA2-A-OPEN-1280X720` | `A-open`; `implementation/A-open.png`; `FDA2661FAF07A0CD3F71177E6BE32F7036ADC45354C7136C74B776DC0FF96A7C`; `1280x720` | `tests/check-header-drawer-pattern-a-reconnection.ps1` fixes and checks the same ID, state, path, raw-byte SHA-256, and viewport. | `A-open`; `implementation/A-open.png`; `FDA2661FAF07A0CD3F71177E6BE32F7036ADC45354C7136C74B776DC0FF96A7C`; `1280x720` | `A-open`; `implementation/A-open.png`; `FDA2661FAF07A0CD3F71177E6BE32F7036ADC45354C7136C74B776DC0FF96A7C`; `1280x720` | match |
| `HDA2-A-HIDDEN-1280X720` | `A-hidden`; `implementation/A-hidden.png`; `EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161`; `1280x720` | `tests/check-header-drawer-pattern-a-reconnection.ps1` fixes and checks the same ID, state, path, raw-byte SHA-256, and viewport. | `A-hidden`; `implementation/A-hidden.png`; `EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161`; `1280x720` | `A-hidden`; `implementation/A-hidden.png`; `EBB960807FD73EEEEA6C953772A3306172B62075B6709BCBF13A5E0470C23161`; `1280x720` | match |

- Complete matches: `2`
- Mismatches: `0`
- The evaluator and human decisions remain separate: shared identity does not
  turn evaluator `failure` into human `accept`, or vice versa.
