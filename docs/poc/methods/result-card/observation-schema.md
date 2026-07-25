---
type: Observation Schema
title: Result-card observation schema
description: Required axes and ownership classifications for a bounded result-card observation.
status: draft
source: authored
scope: Reusable method.
---

# Required axes

Complete every row. Use `observed`, `not observed`, `unresolved`, or `not applicable`. Separately classify each finding as `observed`, `inferred`, `authored default`, `context pattern`, or `target-product input`.

| Axis | Record | Static-evidence limit |
| --- | --- | --- |
| Card-versus-table choice | Object identity and heterogeneous summaries versus dense repeated attributes, column comparison, sorting, and rapid scanning | Do not treat cards as a substitute for dense table/list scanning |
| Collection responsibility | Whether cards present a browsable collection, and the host surface relationship | Do not infer filtering or loading behavior |
| Host width and outer spacing | Host-assigned width and host-owned outer space | Do not derive page margins |
| Gallery packing | Uniform sizing, gaps, wrapping, and incomplete final-row alignment | Do not infer masonry |
| Collection Z/I traversal | Row-major Z order or column-major I order; DOM and visual order relationship | One static view cannot establish keyboard navigation |
| Card anatomy and identity | Header, title, body, footer, and identity placement | Do not require every optional region |
| Internal card Z/I flow | Vertical I-stack or horizontal/Z-like organization inside each card | Do not infer hidden reordering |
| Typography hierarchy | Shared versus mixed family; title/body/caption size and restrained weight relationships | Never convert hierarchy into exact font tokens |
| Caption presence | Visible field captions, repeated captions, and self-explanatory unlabeled secondary text | Do not remove needed labels |
| Density and media | Compactness, meaningful-media policy, metadata grouping, equal height, and overflow | Do not invent imagery or clipping behavior |
| Selection and activation | Multi-select affordance; selected/unselected distinction; selection, title navigation, activation, inline, and global actions | Presence does not establish update behavior |
| Surface relation | Background, border, and surface relationship | Do not extract exact visual tokens |
| Pagination and responsive behavior | Placement relation, narrow treatment, and overflow | Unshown transformations remain unresolved |
| Accessibility and state coverage | Labels, visible state distinction, empty/loading/failure states | Focus, keyboard, announcements, and unshown states remain unresolved |
| Application Input Contract needs | Required product values, state model, and omission rule | Never fill missing meaning from the observation |

# Authored defaults

When the Contract supplies no alternative, use compact equal-width cards in a wrapping gallery. Keep the incomplete final row left aligned, use a stable row-major Z order with left-to-right then top-to-bottom DOM order, and use one font family with restrained title size/weight emphasis. Use a vertical I-shaped content hierarchy and visible captions where values are otherwise ambiguous. Omit decorative media. Put a multi-select checkbox in the upper right and distinguish selected cards with more than color alone. A selectable navigable card uses its checkbox for selection and a distinct title link for navigation.
