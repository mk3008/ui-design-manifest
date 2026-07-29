# Run 3: common shell fixture

This fixture implements only the shared Header and Drawer.

## State combinations

Open `index.html` with either or both query parameters:

- `?drawer=open|hidden`
- `?theme=light|dark`

The header controls update the local shell state and the corresponding query
parameters. The palette values are the semantic roles from the supplied default
theme manifest. No external resources are used.
