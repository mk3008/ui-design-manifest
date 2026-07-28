# Business-app standard pack

`design-manifest/` is the distributable, versioned standard pack. It contains authored Markdown guidance, finite configuration definitions, and flow concepts; it contains no source UI, screenshot, extraction trace, or product-specific binding.

`local-overrides/` demonstrates the recommended update-safe extension
mechanism. The record-list examples resolve the same fixed Markdown guidance
while changing only the five existing presentation settings. The
[theme-color example](local-overrides/theme-colors.example.yaml) changes
concrete Light and Dark values while preserving every semantic role. Editing
`design-manifest/` directly is a pack fork.

`product-bindings/` demonstrates a separate Application Input Contract input. It supplies only safe semantic references, not real routes, permissions, data, counts, or business copy. It declares available search, record-lifecycle, guided-task, and monitoring capabilities; without such a binding, an implementer must not invent the related feature, state, or destination.

## Phase 2 calibration cases

All cases use the same Markdown concepts. Case A uses no override and the supported binding: defaults remain `end`, `[search, clear]`, `end`, `summary`, and `link`. Case B uses `local-overrides/record-list-alternate.yaml`: only placement, order, count visibility, and row-action treatment change. Case C uses the default resolution with `product-bindings/record-list-limited.example.yaml`: Clear, pagination, aggregate summary, and row operation are **not exercised** and their dependent UI is omitted; configuration does not recreate them.

An override is a value-only replacement against `configuration/record-list-options.md`; do not combine override files or add unknown IDs. Scalars and arrays replace whole values; `null` and an empty array are invalid. Check the selected binding after resolving values. A binding and override must identify the same `pack_id` and exact `pack_version`; a pack default/ID/allowed-value removal is breaking and needs an explicit migration or rejection instruction. Configuration cannot add a feature or supply a detail destination.

Distribute only `design-manifest/` as a ZIP or release artifact. Keep local overrides beside a consuming product, retain product bindings with the product, and leave PoC/extraction material in `docs/poc/`.

See [Phase 2 configuration calibration](calibration.md) for the three-case comparison, setting classifications, capability omissions, and compatibility rules.

Record lifecycle, Dialog, Confirmation, Wizard, Dashboard, and accessibility
are fixed guidance plus product-binding responsibilities. Color and theme also
supplies one bounded local configuration:
[`theme-colors.default.yaml`](design-manifest/configuration/theme-colors.default.yaml).
Manifest consumers may replace its concrete `#RRGGBB` values through one
theme-color override. Role IDs and meanings, required Light/Dark modes, and
contrast obligations are not locally variable.

Use the [fixed and variable responsibility map](design-manifest/variability.md)
for a single cross-pack view of invariants, product-owned variables,
implementation decisions, the five existing record-list configuration IDs,
and the separate semantic theme-color values.

## Version 0.2.0 adoption

Version `0.2.0` adds fixed guidance and optional product-binding responsibilities
for record lifecycle, Dialog, Confirmation, Wizard, Dashboard, accessibility,
and theme. It also adds editable Light and Dark semantic color values as a
separate configuration definition. The five record-list setting IDs, defaults,
allowed values, and resolution rules are unchanged.

Because this pre-1.0 pack requires exact identity, a consumer must review the
new guidance and then update its selected override and binding from `0.1.0` to
`0.2.0`. Existing record-list setting values require no conversion. Consumers
that accept the pack palette need no theme override; consumers that change
colors must review and validate one explicit theme-color override. A capability
that the product does not bind remains unavailable or not exercised; the new
guidance does not create it.
