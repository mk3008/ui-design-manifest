# Evidence register

All captures were made from the nominated public UI using visible and accessibility-exposed state only.

| ID | Capture | Direct observations | Inferences | Unresolved |
| --- | --- | --- | --- | --- |
| E-001 | [Expanded sidebar PNG](evidence/raw/source-expanded-1280x720.png) | 1280x720 desktop; light appearance; JP is pressed; Overview is the visible active navigation item; the sidebar control is named `サイドバーを閉じる` and exposes expanded state; header has product identity at left, workspace title near center-left, and grouped language/file/theme controls at right; the sidebar shows labelled groups and the overview main area begins with a pale lead card. | The composition prioritizes orientation and repeatable workspace navigation. | Exact spacing, color values, responsive behavior, keyboard behavior, and alternate states were not inspected. |
| E-002 | [Collapsed sidebar PNG](evidence/raw/source-collapsed-1280x720.png) | After the one permitted toggle action, the complementary navigation region is absent, the main area gains horizontal room, and the control is named `サイドバーを開く`; JP remains pressed. | The transition preserves task context while trading navigation visibility for working width. | Animation, persistence, focus movement, and shortcut support were not inspected. |

## Capture metadata

| ID | UTC capture time | URL | viewport | SHA-256 |
| --- | --- | --- | --- | --- |
| E-001 | 2026-07-18T12:31:40.566Z | `https://mk3008.github.io/ui-contract/` | 1280x720 | `A7D1BC6DA0DA718504456AA8EF88EFF85B42DBFA5510766113978FA21087CB7F` |
| E-002 | 2026-07-18T12:31:53.586Z | `https://mk3008.github.io/ui-contract/` | 1280x720 | `7F04D9C86F18216CEC588A14A466BAA553F8E088818971936336FDEC31CB9CD0` |

Both files were verified as PNG images with dimensions 1280x720 before this register was completed.
