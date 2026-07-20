# Primary navigation drawer Contract

## Scope and evidence boundary

This Contract describes the primary navigation drawer only. It excludes product copy, identity, header composition, main content, utility regions, footer, full-page layout, measurements, motion, and implementation mechanisms.

- **Observed:** the frozen seed and accepted calibration show a leading, co-planar desktop navigation drawer with grouped destinations and a distinct current destination.
- **Inferred:** the drawer preserves orientation while remaining quieter than the adjacent workspace.
- **Unknown:** source interaction, keyboard behavior, focus behavior, responsive behavior, semantic tree, and accessibility conformance are not established by the static evidence.

## Component / control

- Treat the leading container as a **standard/persistent navigation drawer**, not a menu bar or a modal drawer. For this source-specific reconstruction, exclude a scrim.
- Provide a compact drawer-toggle affordance. Drawer visibility is a representation state; it is not a change to the navigation hierarchy.
- Use a **navigation section/group** only as a non-destination container for related entries. A section label or divider is non-interactive.
- A **parent navigation item** is a real navigation row that owns a disclosure state and a nested child list. Keep its disclosure trigger and trailing state indicator distinct from a non-interactive group label.
- Child navigation items are destinations within their parent’s child list. Plain top-level destinations remain distinct from parent items.
- Keep icon-led controls compact only when their action is familiar in context; otherwise retain visible clarification. Every interactive control needs a discernible name.

## Component layout

- When shown, the drawer sits beside the workspace and preserves a stable boundary from it. This co-planar, no-scrim arrangement is **source-specific**.
- Group related destinations vertically. Preserve visible hierarchy between section/group, parent item, child item, and plain item without copying source labels or geometry.
- Keep drawer visibility and parent disclosure as independent state dimensions. A compact/hidden representation retains a persistently discoverable restore affordance; the source’s runtime behavior remains unknown.
- The current destination is visibly distinct through a filled item treatment and a separate leading indicator. For this source-specific reconstruction, use `filled-with-leading-indicator`, a `leading-edge` straight bar with square ends, and non-color distinction in addition to the color treatment.
- Meaningful icons remain visibly distinguishable from the containing surface in every represented state. This is a visual requirement, not a contrast-conformance claim.

## Key color roles

The following directly observed, material calibration values are source-specific. Do not extend them into an exhaustive palette.

| Role | Value | Drawer use |
| --- | --- | --- |
| Persistent/navigation surface | `#181B20` | Drawer surface |
| Primary reading text | `#CCCFD8` | Navigation labels and current reading target |
| Current-selection surface | `#2E3136` | Filled current destination |
| Leading key accent | `#BA775A` | Separate leading current-state marker |

## Region composition

- The drawer’s only composition role is persistent product orientation at the leading edge of the adjacent workspace.
- Do not add rules for the header, dashboard/main content, right utility region, footer, or complete-page composition.

## Accessibility requirements and validation gaps

- Expose the navigation purpose as a meaningful navigation region and give interactive controls, including icon-only controls, discernible names.
- Expose the current destination programmatically; validate the selected/current state separately from its visual treatment.
- For a parent disclosure, expose whether its child list is expanded or collapsed and preserve its relationship to that list.
- Do not rely on color alone for the current destination.
- **Unknown / required validation:** keyboard traversal, focus order and return, assistive-technology output, contrast measurement, forced-colors behavior, target size, zoom/reflow, and responsive states.

## Reconstruction decision

This Contract is a source-specific first pass. It is sufficient for a blind static reconstruction of the drawer’s visible hierarchy and state treatment, but it is not a universal drawer rule or a claim of source/runtime accessibility behavior.
