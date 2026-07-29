# Run 3: customer search shell variation

Static local HTML specimen for the customer-search screen, reusing the fixed
common Header and Drawer shell supplied to this run.

## Runtime

No runtime, external dependency, external font, image, CDN, or remote script is used.
Open `index.html` locally. The following query parameters set the initial shell state:

- `?drawer=open` or `?drawer=hidden`
- `?theme=light` or `?theme=dark`

## Run record

- Model: `gpt-5.6-terra`
- Reasoning effort: `medium`
- Verification: `node --check app.js`
