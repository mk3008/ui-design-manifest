# Evaluation

## Fixed conditions

- Manifest snapshot: 44 files under `consumer-input/design-manifest/`
- Fixed shell: common-shell experiment 012, attempt 3, Run 1
- Fixed prompt: `consumer-input/user-prompt-ja.md`
- Model: `gpt-5.6-terra`, reasoning effort `medium`
- Capture: Chrome `150.0.7871.187`, `1440x1200`, `--headless=new --disable-gpu`
- Fallback: not used for any of the 12 captures

## Validity note

An initial preflight created three incomplete pages before the fixed prompt was
placed under `consumer-input/`. Those pages were replaced and are not part of
this evaluation. The accepted Run 1–3 outputs were generated only after the
prompt's SHA-256 was confirmed equal to the fixed attempt-6 prompt.

## Observed comparison

| Rule under test | Run 1 | Run 2 | Run 3 |
| --- | --- | --- | --- |
| Dedicated condition-action toolbar directly below the fields | observed | observed | observed |
| Search then Reset group at the LTR logical end of its toolbar | observed | observed | observed |
| Opaque body surface using `surface_background` and `text_primary` | observed | observed | observed |
| Header surface using `table_header_background` and `table_header_foreground` | observed | observed | observed |
| Direct selector mapping: `tbody td` and `thead th` | partial — `tbody td`, generic `th` | partial — generic `td` and `th` | observed |
| Count immediately after result title | observed | observed | observed |
| No unrequested composite result cell | observed | observed | observed |
| Collection action in the result-summary action zone | observed | observed | observed |
| Fixed common-shell visual reuse | observed | observed — product-owned navigation fixture differs | observed |

The direct role application is stable across all three accepted runs. The exact
selector formulation remains variable. Run 2 preserves the shared Header and
Drawer structure while using different, product-owned navigation fixture text.
The snapshot is evidence of improved rendered conformance rather than a
guarantee of identical CSS text. See `capture-record.json` for raw-byte PNG
identity records.
