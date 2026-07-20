# GitHub Global Header Contract — Attempt 2

## Provenance and validity

- Original source: https://github.com/mk3008/ui-design-manifest
- Observed on: 2026-07-20, Asia/Tokyo
- Intended source state: anonymous public repository
- Actual browser state: fresh isolated terminal Playwright session; anonymous state evidenced by account-entry affordances and no account-specific Header controls.
- Viewport: 1280 × 720 desktop representation.
- Visual capture: `github-global-header-anonymous-attempt-2.png`, bounded to the top-level banner.
- Status: reconstruction-ready for the observed static desktop Header; interactive and responsive behavior remains unknown.

## Contract boundary

This Contract owns the product-wide App Header only. It may contain an identity/home affordance, product-wide navigation, a global search entry point, product-wide utilities, account access, and a Drawer trigger when visible.

It does not own repository/project identity, context or breadcrumb material, Page Header/title, local repository tabs, Drawer contents, Main, sidebar, footer, overlays, or the composition of the full page.

## Static anatomy

| Role | Static rule | Evidence class |
| --- | --- | --- |
| Identity/home | Place one recognizable identity/home affordance at the leading edge of the Header. Keep brand-specific text and artwork out of this Contract. | observed role, source details unknown |
| Product-wide navigation | Place one global navigation group after identity/home: five compact text-and-chevron disclosure triggers followed by one direct destination. Do not copy destination labels or menu contents. | observed anonymous desktop composition; behavior unknown |
| Global search | Provide one compact icon-led global-search trigger after global navigation. Do not specify query behavior, results, shortcuts, or focus movement. | observed role; behavior unknown |
| Global utilities | Place one compact appearance-preference trigger at the trailing end, after account-entry links. | observed anonymous desktop role; behavior unknown |
| Account access | Place two adjacent anonymous account-entry links after search and before the appearance-preference trigger: one for an existing account and one for account creation. Do not copy source labels. | observed anonymous desktop composition |
| Drawer trigger | Do not render a Drawer trigger in the observed 1280 × 720 desktop Header. Drawer ownership and narrow-viewport representation remain outside this Contract. | observed absence at desktop viewport; responsive behavior unknown |

## Coarse composition

Use one persistent top-level Header group in this reading order: identity/home, product-wide navigation, global search, anonymous account entry, appearance preference. This is an ownership and reading-order rule, not a geometry rule.

Do not place repository/project context or local repository tabs within this group. If the page needs them, render them as adjacent, separately owned regions beneath or after the Global Header according to the product layout.

## Visual treatment

- Use a dark neutral Header surface with high-contrast light primary text/icon content and muted light secondary marks. No accent color, separator, or focus treatment was observed.
- Preserve clear text/icon contrast and add a focus indicator in the specimen; the exact focus treatment requires a human accessibility decision because it was not observed.
- Do not encode dimensions, spacing values, icon sizes, breakpoints, shadows, or exhaustive colors.

## Accessibility rules

- Use an appropriate top-level header/banner landmark for persistent site-wide Header content.
- If more than one navigation landmark exists, give each a distinct purpose-based accessible name; do not name them by screen position.
- Give icon-only controls concise accessible names that convey purpose.
- Expose a current-page state only for a navigation item whose state has been observed. Local repository tab state is out of scope.
- Expose expanded/collapsed state only after the Drawer or another disclosure pattern has been directly confirmed.

## Known unknowns

- Responsive transformation and whether a Drawer trigger appears or changes role at narrow viewports.
- Drawer contents, state, focus handling, keyboard behavior, and persistence.
- Search behavior, shortcuts, result surface, and focus movement.
- Utility/account behavior, menu contents, and sign-in transition.
- Focus appearance, tab sequence, screen-reader announcements, and assistive-technology behavior.

## Official guidance consulted

- [Primer Layout](https://primer.style/product/getting-started/foundations/layout/)
- [WAI navigation landmark example](https://www.w3.org/WAI/content-assets/wai-aria-practices/patterns/landmarks/examples/navigation.html)
- [WAI accessible names guidance](https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/)
- [WAI disclosure navigation example](https://www.w3.org/WAI/ARIA/apg/patterns/disclosure/examples/disclosure-navigation/)
- [WCAG technique H101](https://www.w3.org/WAI/WCAG21/Techniques/html/H101)
