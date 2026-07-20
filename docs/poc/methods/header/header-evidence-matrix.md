# Global Header Evidence Matrix

## Scope and source

- Original product URL: https://github.com/mk3008/ui-design-manifest
- Observation date: 2026-07-20
- Intended observation state: public repository, anonymous browser
- Actual observation state: a fresh isolated terminal Playwright session with no persisted user profile. The public page exposed anonymous account-entry affordances and no account-specific Header controls.
- Viewport: 1280 × 720; desktop representation observed.
- Bounded screenshot: `github-global-header-anonymous-attempt-2.png`, captured from the top-level banner only.

## Evidence classes

| ID | Statement | Class | Status | Source / rationale |
| --- | --- | --- | --- | --- |
| E1 | The product-wide App Header is distinct from the repository context region and local repository navigation. | Authoritative guidance | kept | [Primer Layout](https://primer.style/product/getting-started/foundations/layout/) describes the App Header as the topmost bar and distinguishes its Context region and Local navigation. |
| E2 | A Global Header extraction must exclude repository identity, breadcrumb/context, page title, and repository tabs. | Extractor inference | kept | This follows E1 and prevents adjacent ownership from entering a global contract. |
| E3 | The public repository URL loads in a fresh isolated browser without a sign-in barrier. | Observed product fact | kept | Anonymous state was supported by anonymous account-entry affordances and the absence of account-specific Header controls. |
| E4 | The anonymous accessibility tree exposed a top-level banner with an identity/home link, a named global navigation list, a search trigger, two anonymous account-entry links, an appearance-preference trigger, and a separate repository navigation landmark. | Observed product fact | kept | Captured at 1280 × 720 in an isolated browser. Product labels, repository data, and icon artwork are not transferred into reusable rules. |
| E4a | The anonymous global navigation list contained five disclosure-like button triggers followed by one direct destination link. | Observed product fact | kept | Visible in the banner snapshot and semantic tree. Menu contents and expanded state were not observed. |
| E4b | No Drawer trigger was visible in the 1280 × 720 desktop Header representation. | Observed product fact | kept, bounded | This does not establish narrow-viewport behavior. |
| E5 | Multiple navigation landmarks need distinct accessible names. | Authoritative guidance | kept | [WAI navigation landmark example](https://www.w3.org/WAI/content-assets/wai-aria-practices/patterns/landmarks/examples/navigation.html). |
| E6 | Focusable controls need concise accessible names that describe purpose; use a hidden name only where visible text is not available. | Authoritative guidance | kept | [WAI accessible names guidance](https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/). |
| E7 | A disclosure trigger needs an exposed expanded/collapsed state only when a controlled disclosure has actually been observed. | Authoritative guidance | conditional | [WAI disclosure navigation example](https://www.w3.org/WAI/ARIA/apg/patterns/disclosure/examples/disclosure-navigation/). This task did not open a menu. |
| E8 | A current-page marker belongs to a navigation link only when the represented page/current state is observed. | Authoritative guidance | conditional | [WAI disclosure navigation example](https://www.w3.org/WAI/ARIA/apg/patterns/disclosure/examples/disclosure-navigation/). Local repository tabs are out of scope regardless. |
| E9 | Top-level semantic header content commonly maps to a banner landmark; navigation maps to a navigation landmark. | Authoritative guidance | kept | [WCAG technique H101](https://www.w3.org/WAI/WCAG21/Techniques/html/H101). |
| E10 | Keyboard flow, focus appearance, menu contents, responsive transformation, persistence, and assistive-technology announcements are unknown. The 1280 × 720 desktop representation alone was observed. | Unknown / unverified | preserved | No controls were activated and no alternate viewport was inspected. |
| E11 | A visible Header-owned Drawer trigger needs an explicit relationship to the controlled Drawer without transferring Drawer ownership into the Header. | Human priority / extractor method | kept | Header owns trigger placement, treatment, and accessible name. Drawer owns content, presentation, closed representation, visibility state, and persistence. The accepted Drawer method keeps these visibility axes independent. |
| E12 | A Header-owned trigger means Drawer toggle location is outside the Drawer only when the same visible context directly shows that relationship. | Extractor method | kept, conditional | It does not establish Drawer presentation, closed representation, visibility state, persistence, or another context’s representation. |

## Ownership decision table

| Candidate visible material | Owner | Decision |
| --- | --- | --- |
| Product identity or home affordance | Global Header | Include only as a role, never copy brand content. |
| Product-wide destinations and actions | Global Header | Include one global navigation group with five disclosure-like triggers and one direct destination; do not copy destination labels. |
| Search entry point | Global Header | Include one compact search trigger; interaction remains unknown. |
| Global utility cluster and account access | Global Header | Include one appearance-preference trigger and two anonymous account-entry links as generic roles. |
| Drawer toggle | Global Header control | In the observed desktop state, record `presence=absent`; no owner, controlled role, or Drawer behavior is inferred. When a trigger is observed, Header owns placement/treatment/name and links only to Drawer toggle location outside the Drawer in that same context. |
| Repository owner/name context or breadcrumb | Context / Page Header | Exclude. |
| Repository tabs or selected repository section | Local sub-navigation | Exclude. |
| Page title, content, sidebar, footer | Other regions | Exclude. |

## Color and geometry restraint

- Retained source-specific material roles: a dark neutral Header surface, high-contrast light primary text/icon content, and muted light secondary marks such as chevrons. No accent color or focus indicator was observed.
- Future extraction may record only material roles such as header surface, on-header content, separator, and focus indicator when visibly evidenced.
- Width, height, padding, margin, breakpoints, icon dimensions, and exhaustive palettes are intentionally not Contract rules.
