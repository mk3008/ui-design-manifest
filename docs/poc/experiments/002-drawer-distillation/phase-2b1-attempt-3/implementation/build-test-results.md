# Build and test results

## Static validation

- PASS: `index.html` contains every supplied fixture label: `Group 1`, `Group 2`, `Item 1`, `Parent 1`, `Child 1`, and `Item 2`.
- PASS: `index.html` contains no `http://`, `https://`, or anchor (`<a `) token; no external source or destination is present.
- PASS: static HTML/CSS uses no package, runtime, framework, external font, image, or dependency.

## Rendering

- PASS: local Chrome headless rendered `index.html` with `--window-size=1440,900` to `wide.png` (13,938 bytes).
- PASS: local Chrome headless rendered the unchanged `index.html` with `--window-size=390,844` to `narrow.png` (9,359 bytes).
- PASS: visual inspection confirms a visible left drawer beside independently readable abstract content at wide width; narrow output remains unchanged with no introduced responsive behavior.
- Rendering used a local `file:///` URL only and made no network request.

## Integrity

- `index.html` SHA-256: `130D856131634CA90FE3C54492C43D426D24B1C8FBFD41DC57DDDFF884AD74BC`
- `styles.css` SHA-256: `6AC9B6F1E83F0BCF0EEA649DF161DD615BA7292D21188E27E8BB00AE468FDE2E`
