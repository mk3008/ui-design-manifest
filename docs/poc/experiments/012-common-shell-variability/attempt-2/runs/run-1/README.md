# Run 1: Common shell specimen

This static specimen implements only the requested common Header and Drawer.

## Initial-state URLs

- `index.html?drawer=open&theme=light`
- `index.html?drawer=hidden&theme=light`
- `index.html?drawer=open&theme=dark`
- `index.html?drawer=hidden&theme=dark`

Unknown or missing query values resolve to the requested defaults: an open Drawer and the light theme.

The leading Header control toggles the Drawer. The logical-end icon-only Header control changes to the other theme. Both palettes contain only semantic role values from the supplied default theme YAML.
