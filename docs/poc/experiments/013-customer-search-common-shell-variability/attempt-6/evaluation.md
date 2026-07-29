# Evaluation

## Fixed conditions

- Manifest snapshot: 44 files under `consumer-input/design-manifest/`
- Fixed shell: common-shell experiment 012, attempt 3, Run 1
- Fixed prompt: `consumer-input/user-prompt-ja.md`
- Model: `gpt-5.6-terra`, reasoning effort `medium`
- Capture: Chrome `150.0.7871.187`, `1440x1200`, `--headless=new --disable-gpu`
- Fallback: not used for any of the 12 captures

## Observed comparison

| Rule under test | Run 1 | Run 2 | Run 3 |
| --- | --- | --- | --- |
| Search then Clear on a separate logical-end row | observed | partial — start aligned | partial — start aligned |
| Count immediately after result title | observed | observed | observed |
| Collection action at logical end of result summary with lower emphasis | observed | observed | observed |
| Table header/body/page surfaces visibly distinct | observed | observed | not observed — body is transparent and therefore uses the page surface |
| No unrequested composite result cell | observed | observed | observed |
| No unbound result-query summary | observed | ignored by current review — optional group description | partial — instructional text rather than an applied-query summary |

The extra Customer ID condition in Run 2 is also ignored by the current review.
The three generated pages are evidence for this frozen snapshot. They do not
claim that prose guidance is an implementation-time guarantee. See
`capture-record.json` for the raw-byte PNG identity record.
