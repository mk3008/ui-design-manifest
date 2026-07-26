# Business-app standard-pack vertical slice

`design-manifest/` is the distributable, versioned standard-pack slice. It contains authored Markdown guidance, finite configuration definitions, and a flow concept; it contains no source UI, screenshot, extraction trace, or product-specific binding.

`local-overrides/` demonstrates the recommended update-safe extension mechanism. Both examples resolve the same fixed Markdown guidance while changing only allowed configuration values. Editing `design-manifest/` directly is a pack fork.

`product-bindings/` demonstrates a separate Application Input Contract input. It supplies only safe semantic references, not real routes, permissions, data, counts, or business copy. It explicitly declares the availability of the configured Search and Clear actions; without such a binding, an implementer must not invent the related feature, state, or destination.

## Phase 2 calibration cases

All cases use the same Markdown concepts. Case A uses no override and the supported binding: defaults remain `end`, `[search, clear]`, `end`, `summary`, and `link`. Case B uses `local-overrides/record-list-alternate.yaml`: only placement, order, count visibility, and row-action treatment change. Case C uses the default resolution with `product-bindings/record-list-limited.example.yaml`: Clear, pagination, aggregate summary, and row operation are **not exercised** and their dependent UI is omitted; configuration does not recreate them.

An override is a value-only replacement against `configuration/record-list-options.md`; do not combine override files or add unknown IDs. Scalars and arrays replace whole values; `null` and an empty array are invalid. Check the selected binding after resolving values. A binding and override must identify the same `pack_id` and exact `pack_version`; a pack default/ID/allowed-value removal is breaking and needs an explicit migration or rejection instruction. Configuration cannot add a feature or supply a detail destination.

Distribute only `design-manifest/` as a ZIP or release artifact. Keep local overrides beside a consuming product, retain product bindings with the product, and leave PoC/extraction material in `docs/poc/`.

See [Phase 2 configuration calibration](calibration.md) for the three-case comparison, setting classifications, capability omissions, and compatibility rules.
