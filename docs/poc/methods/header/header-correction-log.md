# Global Header Review Log

## Review metadata

- Source: https://github.com/mk3008/ui-design-manifest
- Date: 2026-07-20
- Review state: anonymous desktop source confirmation obtained in a fresh isolated terminal Playwright session at 1280 × 720.
- Rule: a statement is retained only when its evidence class and boundary owner are explicit.

## Component / control review

| Item | Decision | Reason |
| --- | --- | --- |
| Identity/home | keep as a role | Evidence supports a global identity/home affordance, but not copied brand content. |
| Product-wide navigation | keep | The anonymous desktop Header shows five disclosure-like triggers and one direct destination; retain this composition without copied labels. |
| Global search | keep as a role | One compact search trigger was observed; query, results, shortcuts, and runtime behavior remain unknown. |
| Global utilities | keep | One appearance-preference trigger was observed in the anonymous Header. |
| Account access | keep | Two anonymous account-entry links were observed; do not copy their labels. |
| Drawer toggle | absent at observed viewport | Record `presence=absent` in this desktop context. Do not infer a Header owner, controlled role, or Drawer behavior. When visible, Header owns trigger placement, treatment, and accessible name; Drawer owns its contents and visibility semantics. |

## Component layout review

- Keep role order only at a coarse reading order: identity/home, product-wide navigation, search, anonymous account entry, appearance preference.
- Do not encode dimensions, spacing values, alignment offsets, breakpoints, or icon sizes.
- Visible material roles are a dark neutral Header surface, high-contrast light primary content, and muted light secondary marks. No accent or focus treatment was observed.
- Do not infer a compact/mobile representation from this observation.

## Region composition review

- The App Header owns product-wide identity, navigation, search, utilities, account access, and a Drawer trigger when present.
- A Header-owned trigger links to a Drawer toggle location outside the Drawer only when that placement is observed in the same visible context. This is not a Drawer presentation, closed-representation, visibility, or persistence rule.
- Repository context/breadcrumb material belongs to the Context region, not the Global Header extraction.
- Repository tabs are Local navigation, not Global Header.
- Repository title, page controls, main content, and footer are excluded.

## Accessibility review

- Use a top-level banner/header for site-wide persistent content when appropriate.
- Name multiple navigation landmarks by purpose rather than position.
- Give icon-only controls concise accessible names describing their purpose.
- Treat a visible Drawer trigger as Header-owned for accessible-name review; record controlled role `Drawer` only when observed, and keep its expanded/collapsed or other visibility state unknown unless observed.
- Preserve expanded/collapsed, current-page, keyboard, focus, and announcement details as unknown unless directly observed or separately verified.

## Human correction queue

| Priority | Question | Needed evidence | Status |
| --- | --- | --- | --- |
| High | What does the anonymous public Header contain at the observed desktop viewport? | Isolated visual and accessibility-tree observation | resolved |
| High | Is the observed account/global-utility cluster anonymous, authenticated, or mixed? | Isolated comparison | resolved for the observed desktop state |
| Medium | Does the Drawer trigger reveal a disclosure, dialog, or another pattern? | Direct interaction plus state inspection | open |
| Medium | What are the material visual color roles in the anonymous Header? | Header-only screenshot in anonymous state | resolved: dark neutral surface with light primary and muted secondary content |
| Medium | What are focus, keyboard, and responsive behaviors? | Interactive, keyboard, and viewport checks | open |
| Medium | Does every Header trigger have an explicit, non-duplicating Drawer seam record? | Trigger presence/owner/controlled-role/placement/context review | frozen method check |
