# Run 2: Customer search common-shell reuse

This local, dependency-free static HTML fixture reuses the supplied fixed Header and Drawer shell and adds the requested customer-search workspace.

## Included behavior

- Initial shell state accepts `?drawer=open|hidden` and `?theme=light|dark`; the default is an open Drawer and Light theme.
- The Header controls toggle the supplied Drawer and Light/Dark palettes.
- Search applies the four supplied conditions to six neutral fixture rows. Clear restores all rows.
- Pagination is rendered as a neutral, non-navigating fixture.

## Files

- `index.html` — semantic static markup and six customer fixtures.
- `styles.css` — supplied semantic Light/Dark palette roles and compact search-grid layout.
- `app.js` — shell controls and local filtering only.

## Generation record

- Model: `gpt-5.6-terra`
- Reasoning effort: `medium`
