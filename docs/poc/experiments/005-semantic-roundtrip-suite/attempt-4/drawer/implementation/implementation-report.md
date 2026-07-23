# Drawer static implementation report

## Scope and freeze

This is the first and frozen static implementation for the declared Drawer fixture. HTML and CSS were not revised after the initial wide and narrow evidence captures.

## Opened inputs

- `manifest.md`
- `application-input-contract.md`
- `fixture-trace.md`
- `claim-matrix.md`
- `implementer-apply-packet.md`
- `implementer-prompt.md`

All six frozen SHA-256 digests matched the authoritative packet before editing.

## Changed outputs

- `implementation/index.html`
- `implementation/styles.css`
- `implementation/wide.png`
- `implementation/narrow.png`
- `implementation/implementation-report.md`

## Fixture and guidance trace

- `parent-a` / `Parent A` owns the nested `child-a` / `Child A` list and is expanded.
- `leaf-a` / `Leaf A` is a top-level leaf; `direct-a` / `Direct A` is a separate direct item.
- `parent-a` is current. The declared guarded defaults produce an inline down-facing `currentColor` SVG disclosure indicator and a straight `--semantic-accent` leading marker with a font-weight distinction.
- The supplied `Change navigation visibility` control is separate from navigation rows and marked with `data-state-owner="application"`; no operation is implemented.
- Repeated rectangular rows and a bordered Drawer/workspace edge provide the declared static rhythm and boundary.

## Assumptions and unresolved gaps

System color keywords and the neutral CSS token `--semantic-accent` are used rather than source values. Exact palette, geometry, closed state, toggle operation, persistence, focus treatment, motion, overflow, contrast conformance, and responsive behavior remain unresolved and are not implemented.

## Unsupported-invention declaration

No captions, groups beyond the declared nested child list, additional rows, destinations, badges, counts, permissions, closed Drawer, persistence, animation, responsive transformation, external assets, scripts, or source-specific identity were added. Navigation rows use rectangular rather than pill treatment.

## Prohibited-input declaration

No allowlist-external repository file, historical attempt, oracle, recording, URL, package, network resource, or external asset was opened or used.

## Claim exercise status

| Claim | Status | Evidence |
| --- | --- | --- |
| C1 | done | Nested child `ul`, parent disclosure control, `aria-expanded="true"`, `aria-controls`, and down-facing SVG. |
| C2 | done | `Leaf A` is a top-level direct list row without child group or disclosure. |
| C3 | done | `Direct A` is a separate top-level direct list row without invented grouping. |
| C4 | done | `Parent A` has `aria-current="page"`, straight semantic-accent marker, and font-weight distinction. |
| C5 | done | Separate named visibility button has application ownership metadata and no scripted operation. |
| C6 | done | Comparable rectangular rows share the same static row rhythm in both captures. |
| C7 | done | Wide and narrow captures include the quiet Drawer/workspace border. |
| C8 | done | Disclosure is inline SVG with `stroke: currentColor`, `aria-hidden`, and synchronized expanded-state control. |

## Capture and verification results

Wide capture command:

```text
C:/Program Files/Google/Chrome/Application/chrome.exe --headless=new --disable-gpu --hide-scrollbars --window-size=1440,900 --screenshot=C:/Users/mssgm/.codex/worktrees/61ff/ui-design-manifest/docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/drawer/implementation/wide.png file:///C:/Users/mssgm/.codex/worktrees/61ff/ui-design-manifest/docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/drawer/implementation/index.html
```

Narrow capture command:

```text
C:/Program Files/Google/Chrome/Application/chrome.exe --headless=new --disable-gpu --hide-scrollbars --window-size=390,844 --screenshot=C:/Users/mssgm/.codex/worktrees/61ff/ui-design-manifest/docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/drawer/implementation/narrow.png file:///C:/Users/mssgm/.codex/worktrees/61ff/ui-design-manifest/docs/poc/experiments/005-semantic-roundtrip-suite/attempt-4/drawer/implementation/index.html
```

- Chrome captures succeeded: `wide.png` is 11,454 bytes at 1440x900; `narrow.png` is 8,263 bytes at 390x844.
- Text inspection passed for nested list structure, inline SVG/currentColor, expanded state/controls, programmatic current state, and no external links, scripts, or assets.
- `git diff --check` passed with no output.
- No build system or automated tests were introduced or run; the artifact is static HTML/CSS only.
