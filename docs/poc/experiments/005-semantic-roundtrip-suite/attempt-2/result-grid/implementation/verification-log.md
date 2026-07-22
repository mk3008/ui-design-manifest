# Initial static-evidence verification log

## Render check

- Local static server rendered `index.html` with no final console errors.
- Browser accessibility snapshot exposed one region header, two entry articles, and—inside each entry—a title, metadata value, and marker.
- The rendered relationship is limited to the frozen static exercise: header-to-repeated-entry region and entry-to-title/metadata/marker grouping.

## Captures

| Evidence | Viewport | SHA-256 |
| --- | --- | --- |
| `evidence/wide.png` | 1280 × 900 | `EFDC36F5F183D2821DB2EFF239D9BA2545F0B0D89F0D93E7335836FADE027476` |
| `evidence/narrow.png` | 360 × 760 | `7F6060267200ACE85970B10FBE3B02C6D625ADA49E78BE9323FCA23036CD5D35` |

## Static inputs

| File | SHA-256 |
| --- | --- |
| `index.html` | `FD15285A0C7B09AD418D6730812EB3FF9ADC731FAE4300F80A3F34EDC253D507` |
| `styles.css` | `EBE6B41B636A59FBA09D2AFAA9075C3AA7F68A21E4E7998DC15C20E8145F9E06` |

## Build and diff checks

- No build or test harness is declared for this docs-first static exercise; the browser render and semantic snapshot are the applicable execution checks.
- `git diff --check -- docs/poc/experiments/005-semantic-roundtrip-suite/attempt-2/result-grid/implementation` passed with exit code 0.

## Assessment boundary

The evidence is authorized and non-empty at both viewports. It remains unassessed for preservation; an independent source-blind re-extraction is required before any preservation, partial-preservation, or failure claim.
