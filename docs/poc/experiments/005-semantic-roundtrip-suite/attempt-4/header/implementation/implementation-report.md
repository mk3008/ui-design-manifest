# Header implementation report

## Scope and input integrity

This was a source-blind static implementation. The only opened repository inputs were:

- `docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/manifest.md`
- `docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/application-input-contract.md`
- `docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/fixture-trace.md`
- `docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/claim-matrix.md`
- `docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/implementer-apply-packet.md`
- `docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/implementer-prompt.md`

The base commit was `0f99cfa1e3ce441b8a4b2a8f1489e9d853e013f9`. Canonical SHA-256 digests were computed from the Git blob byte streams at that commit, using `git cat-file blob HEAD:<path>`:

| Input | SHA-256 |
| --- | --- |
| manifest.md | `00FF8E98A15B45DCE5D016C541360206D1184F7F92F3F358441F78E957C6A8CF` |
| application-input-contract.md | `105F7B4C899DB4B5385DF0F095793DEEA03193CFE164E14C829E3D7BD2644CA1` |
| fixture-trace.md | `7CF8F9E97135E774276498F3AC391CEBD04C4E45EBB430294D364CFD3EC86E6A` |
| claim-matrix.md | `2C5C308316F5ABDDA1ABC34229E22FD19BEDB2AED4483A8A3E8359C2882FF003` |
| implementer-apply-packet.md | `40D8673E11C9016C47C9A840B90AF489F2BFBAE9A0AC8C3DBFDABD1C950479E7` |
| implementer-prompt.md | `57EA86C7BDB0F43D0CD9EF76B20680C9B74CC2B15362EC1E9E01A18251F7096D` |

No source UI, source-aware material, historical attempt, non-allowlisted repository input, external URL, network resource, package, or external asset was accessed.

## Fixture and guidance trace

- `Application` supplies the required leading identity title.
- `Section` is the sole neutral navigation fixture.
- `Search` is a separate search-group fixture.
- `Preferences` is the button-owned accessible name for the sole utility icon control; its inline SVG has `currentColor` strokes.
- The rectangular white Header, economical group dividers, compact 58px row, and lower border express the Header/work-surface boundary.

The implementation intentionally supplies no destination, page-local context, breadcrumb, local navigation, Drawer trigger/body/state, account data, notification, status, or business copy.

## Assumptions and unresolved gaps

The static viewport is the only exercised presentation. Responsive transformation, focus, keyboard interaction, motion, overflow behavior, control destinations, and all Drawer semantics remain unresolved. At 390px the same unwrapped horizontal structure is retained; the right utility area can fall outside the clipped viewport. This documents an unexercised overflow behavior rather than inventing a mobile transformation.

No unsupported fallback or product-specific invention was added.

## Capture and inspection

The installed browser was invoked directly against the local file:

```text
C:/Program Files/Google/Chrome/Application/chrome.exe --headless --disable-gpu --hide-scrollbars --window-size=1440,900 --screenshot=C:/Users/mssgm/.codex/worktrees/aae4/ui-design-manifest/docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/implementation/wide.png file:///C:/Users/mssgm/.codex/worktrees/aae4/ui-design-manifest/docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/implementation/index.html
C:/Program Files/Google/Chrome/Application/chrome.exe --headless --disable-gpu --hide-scrollbars --window-size=390,844 --screenshot=C:/Users/mssgm/.codex/worktrees/aae4/ui-design-manifest/docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/implementation/narrow.png file:///C:/Users/mssgm/.codex/worktrees/aae4/ui-design-manifest/docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/header/implementation/index.html
```

Both commands exited `0`. The captures were visually inspected: both are nonblank and show the Header plus its lower edge above the neutral work surface. The first capture froze the HTML, CSS, fixture values, and renders; no output correction followed inspection.

## Static re-extraction and checks

| Claim | Status | Result |
| --- | --- | --- |
| H1 | exercised | One `header` landmark is visually distinct from the `main` work surface. |
| H2 | exercised | Leading `h1` identity is `Application`. |
| H3 | exercised | Separate navigation, search, and utility groups occur in the required order. |
| H4 | exercised | Named Preferences button contains a meaningful inline `currentColor` SVG. |
| H5 | unresolved | No Drawer control exists; target, side, state, and behavior were not supplied. |
| H6 | exercised | Header contains no page-local context or Drawer body content. |
| H7 | not exercised | Responsive, focus, keyboard, motion, and overflow behavior are unspecified. |

Static checks found the required landmarks, title, group labels, SVG, and named utility button. No script, external URL/resource, Drawer term, breadcrumb, badge, placeholder, account, notification, or status marker was found in HTML/CSS. `git diff --check` passed before commit.

## Output digests before report creation

| Output | Bytes | SHA-256 |
| --- | ---: | --- |
| index.html | 1256 | `3CB1C97A87B6C1CBE6316CA391A216BCF65DB5A3D27FC9CBA676D9521FCAF5B9` |
| styles.css | 1387 | `E975D81A3E1C8B5E845010937DE51A09D1DEF41B603793FDD7454C8371406931` |
| wide.png | 8546 | `E27A59E97BBD873BF4007BB52CF5ECBFAE8937E14BECB22B5E304F5B031A5F15` |
| narrow.png | 4951 | `8B7449719133A6C7768BBA0466D517524B25A11EE0590627548D68DF98B167AC` |

Only the five required implementation outputs are present.
