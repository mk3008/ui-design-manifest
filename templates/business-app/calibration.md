# Phase 2 configuration calibration

This source-blind calibration applies the same `design-manifest/` Markdown guidance. It is maintenance evidence, not product implementation or a new runtime.

| Case | Override | Binding | Outcome |
| --- | --- | --- | --- |
| A — defaults | none | `record-list.example.yaml` | Use all definition defaults; all dependent capabilities are declared. |
| B — valid local difference | `local-overrides/record-list-alternate.yaml` | `record-list.example.yaml` | Only action/pagination placement, action order, count visibility, and row-operation treatment change. |
| C — limited capability | defaults | `product-bindings/record-list-limited.example.yaml` | The default `[search, clear]` order is filtered to `[search]`; Clear, pagination, count summary, and row operation are not exercised and their dependent UI is omitted. |

## Configuration classification

| ID | Decision | Reason |
| --- | --- | --- |
| `search_actions_region` | keep | A finite, logical placement choice; it does not create a search group. Its default is logical start for bounded in-page forms. |
| `search_action_order` | keep | Stable semantic IDs permit bounded order variation; each ID requires an available binding feature. |
| `pagination_region` | keep | A finite placement choice that applies only to pageable results. |
| `result_count_presentation` | keep | Visibility is a bounded presentation choice; aggregate meaning remains binding-owned. |
| `row_action_presentation` | keep | Treatment is distinct from action existence; overflow additionally requires multiple low-frequency bound operations. |

No ID is merged, moved, or removed in Phase 2. The evidence is sufficient only for this search/list slice; it does not justify adding Header, Drawer, or other vocabulary.

## Combination outcomes

- Unknown IDs, disallowed values, duplicate IDs, or layered overrides stop before application.
- A resolved value whose binding prerequisite is absent is **not exercised**; omit the dependent UI and report the missing fact. For `search_action_order`, remove unavailable semantic IDs while preserving the selected relative order; if none remain, omit the entire action group.
- `open_record: true` requires a non-empty, available binding-owned detail destination before resolution; a missing, blank, unresolved, or unavailable destination is rejected. `open_record: false` leaves every row-action presentation **not exercised** and no configuration can recreate it.
- Placement and semantic ordering are independent: region locates the group, while order sequences the remaining available semantic actions.
- A configuration override cannot change routes, permissions, state, data, aggregate meaning, display copy, product-binding capabilities, or fixed Markdown.

## Human maintenance and compatibility

Start from [Configuration](design-manifest/configuration/index.md), select at most one override, then inspect the binding. Unspecified override keys retain defaults and arrays replace whole values. For this 0.x pack, `pack_id` and `pack_version` must exactly equal the manifest values; ranges and implicit compatibility are rejected before resolution unless an explicit migration produces the target exact version. Clarifications and added values may be compatible only when existing meaning is unchanged; default changes, ID changes/removal, value removal, and responsibility moves are breaking and need migration or rejection guidance.
