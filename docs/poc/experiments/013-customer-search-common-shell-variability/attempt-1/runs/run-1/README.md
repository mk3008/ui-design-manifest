# Run 1: Customer search

Static local HTML implementation of the customer-search screen using the supplied Run 1 common shell.

## Scope

- Reuses the fixed Header and Drawer shell structure, including drawer visibility and light/dark theme controls.
- Provides the requested customer search conditions, six neutral fixture rows, a linked leading customer ID, result count, and non-functional pagination fixture.
- Does not add record reading, creation, editing, deletion, data connections, routing, external dependencies, images, fonts, CDNs, or scripts.

## Initial states

- `?drawer=open` or `?drawer=hidden`
- `?theme=light` or `?theme=dark`

The default is an open Drawer and light theme.

## Generation record

- Model: `gpt-5.6-terra`
- Effort: `medium`
