# Common shell variability experiment — Attempt 2, Run 2

This static fixture implements only the shared Header and Drawer.

## States

Open the page with either query parameter (or both):

- `?drawer=open` or `?drawer=hidden`
- `?theme=light` or `?theme=dark`

The Header controls update the displayed state and the URL query parameters.
All styling and behavior are local to this directory; no external assets or dependencies are used.
