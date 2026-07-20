# Header Extraction Template

## 1. Provenance

- Product URL:
- Observation date and timezone:
- Browser state: anonymous / authenticated / unknown
- Header-only capture path or capture-blocked reason:
- Official guidance URLs actually consulted:

## 2. Boundary declaration

### Included

- Product identity/home
- Product-wide navigation
- Global search
- Global utilities
- Account access
- Drawer trigger, only if visible

### Excluded

- Page Header and title
- Context region, breadcrumb, repository/project identity
- Local tabs or sub-navigation
- Drawer body and menu contents
- Main, sidebar, footer, overlays, and complete-page composition

## 3. Evidence ledger

| Statement | Class: observed / guidance / inference / human priority / unknown | Source | Keep, hold, or reject | Why |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## 4. Role anatomy

| Role | Visible evidence | Contract rule | Unknowns |
| --- | --- | --- | --- |
| Identity/home |  |  |  |
| Product-wide navigation |  |  |  |
| Global search |  |  |  |
| Global utilities |  |  |  |
| Account access |  |  |  |
| Drawer trigger |  |  |  |

## 5. Header–Drawer trigger seam

Use this section to record whether a Drawer trigger is visibly placed in the Header. Describe trigger ownership only when it is present; it never describes Drawer content, hierarchy, presentation, closed representation, visibility state, or persistence.

| Field | Entry | Evidence / unknown boundary |
| --- | --- | --- |
| Trigger presence | `observed`, `absent`, or `unknown` | Record the supplied visible context with the result. |
| Trigger owner | `Header` when a trigger is observed; otherwise `unknown` | Header owns placement, visible treatment, and accessible name. |
| Controlled role | `Drawer` or `unknown` | Record only the controlled region’s role, never its content or internal hierarchy. |
| Coarse placement | leading Header edge, trailing Header edge, or another observed Header group | Use relational placement only; do not enter geometry. |
| Visible context | | Record the observation state or supplied representation context; do not invent unobserved contexts. |
| Reciprocal Drawer reading | | When the same observed context shows a Header-owned Drawer trigger, record Drawer toggle location as `outside-drawer`. Otherwise leave Drawer toggle location `unknown` or `none-observed` as appropriate. This does not determine Drawer presentation, closed representation, visibility state, or persistence. |

### Seam traces

- **Visible Header trigger:** `presence=observed`; owner is Header; record its coarse Header placement, treatment, accessible name, controlled role `Drawer`, and visible context. In the matching Drawer record, toggle location is `outside-drawer`. All other Drawer visibility axes remain observed values or `unknown`.
- **No observed trigger:** `presence=absent` in the recorded context. Do not add a control, controlled role, Drawer behavior, or a different-context representation by convention.

## 6. Four reviews

### Component / control

Record purpose, visible treatment class, accessible-name requirement, and whether an item is source-specific or reusable. For a Drawer trigger, record Header ownership only; controlled Drawer semantics remain a linked, separate record.

### Component layout

Record only coarse grouping and reading order. Do not record measurements, spacing values, or breakpoints.

### Region composition

State why every adjacent region is excluded or included.

### Accessibility

Record landmarks, distinct navigation labels, accessible names, observed current/expanded state, and unknown behavior separately. A visible Drawer trigger needs a concise accessible name; expanded/collapsed or other visibility state remains unknown unless observed.

## 7. Visual roles

Record at most: header surface, on-header text/icon, divider, focus indicator, and a selected/current treatment when actually observed. Do not inventory a palette.

## 8. Unknown preservation

List all unobserved interaction, keyboard, focus, screen-reader, responsive, persistence, and disclosure behavior. Do not turn a plausible convention into a Contract requirement.
