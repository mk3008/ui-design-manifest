# Static reconstruction evidence

The supplied contract exercises only the visibly open wide Drawer state. The wide image records that state. The narrow image is a fixed-layout capture at a narrower viewport; it records no responsive, collapsed, overlay, or interaction behavior.

## Artifacts

- `drawer-wide.png` — 1440 × 900 capture of the declared visible-open Drawer state.
- `drawer-narrow.png` — 375 × 812 fixed-layout capture. Narrow-state behavior is not exercised because the contract does not establish a viewport transition or alternate state.

## Static checks

- The HTML has four non-link navigation rows using only the supplied fixture labels.
- Parent 1 has a trailing, non-interactive disclosure affordance for its supplied expanded state.
- Child 1 is the supplied current row and is indented beneath Parent 1.
- The markup contains no navigation caption, group label, leading icon, marker, destination, search affordance, or script.
