# Evaluation

## Fixed conditions

- Manifest input: `consumer-input/design-manifest/` (44 files)
- Common shell input: common-shell experiment 012, attempt 3, Run 1
- User input: `consumer-input/user-prompt-ja.md`
- Model: `gpt-5.6-terra`, reasoning effort `medium`
- Capture: Chrome `150.0.7871.187`, `1440x1200`, `--headless=new --disable-gpu`
- Capture fallback: not used for any of 12 images

## Observed presentation consequences

| Run | Separate logical-end Search/Clear row in Search → Clear order | Collection action in result summary with lower emphasis | Header/body/page surface roles visibly separated | Prompt-only product facts retained |
| --- | --- | --- | --- | --- |
| Run 1 | observed | observed | observed | observed |
| Run 2 | partial — separate row and order observed, logical-end alignment not observed | observed | partial — visible separation observed, but the declared table role names are not used consistently | observed |
| Run 3 | observed | observed | observed | partial — an editable-search presentation includes an additional Customer ID field not requested as a query condition |

This is descriptive evidence from the generated files and captures. It is not a
claim that a manifest alone enforces every generated implementation. In
particular, the current pack contains guidance rather than a runtime validator;
the next decision is whether the remaining deviations need more explicit
manifest constraints or are acceptable implementation variation.

## Artifact identity

See [capture record](capture-record.json) for raw-byte SHA-256, dimensions,
file sizes, capture mode, and Chrome version for all twelve PNG artifacts.
