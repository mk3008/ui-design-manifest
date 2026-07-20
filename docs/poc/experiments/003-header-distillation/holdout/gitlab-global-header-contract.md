# GitLab Global Header Contract — Holdout Attempt 1

## Provenance and observation state

- Original source: https://gitlab.com/gitlab-org/gitlab
- Observed on: 2026-07-20, Asia/Tokyo
- Browser state: fresh isolated terminal Playwright session with no persisted user profile.
- Anonymous evidence: anonymous account-entry affordance was visible and account-specific Header controls were absent.
- Viewport: 1280 × 720 desktop representation.
- Header-only capture: `gitlab-global-header-anonymous-attempt-1.png` (1280 × 48), bounded to the top-level banner.
- Scope: Global Header only. Project context, local navigation, Drawer body, Main, sidebar, footer, and complete-page composition are excluded.

## Evidence ledger

| ID | Statement | Class | Status | Boundary |
| --- | --- | --- | --- | --- |
| G1 | The isolated public page presented an anonymous Global Header. | Observed product fact | kept | Anonymous account entry was visible; account-specific Header controls were absent. |
| G2 | The Header contains a leading identity/home affordance followed by three short product-wide destination links. | Observed product fact | kept | Header-only banner; destination labels are not copied. |
| G3 | The Header contains one central global-search entry with a visible search cue and compact shortcut cue. | Observed product fact | kept | Search interaction and shortcut behavior were not tested. |
| G4 | The trailing Header group contains one filled primary conversion action and one secondary account-entry action. | Observed product fact | kept | Action labels and destination details are not copied. |
| G5 | The observed Header uses a very light neutral surface, dark primary text, a dark primary-action surface, and a small warm identity accent. | Observed product fact | kept | Key material roles only; no palette inventory or values. |
| G6 | No Header-owned Drawer trigger was visible in the observed desktop context. | Observed product fact | kept, bounded | Project-local navigation and its controls are separate regions. No other context was evaluated. |
| G7 | App/Header content must remain separate from project context and local navigation. | Authoritative guidance | kept | [Primer Layout](https://primer.style/product/getting-started/foundations/layout/) distinguishes App Header, Context region, and Local navigation. |
| G8 | Multiple navigation landmarks need purpose-based accessible names, and icon-led controls need concise names. | Authoritative guidance | kept | [WAI navigation landmark guidance](https://www.w3.org/WAI/content-assets/wai-aria-practices/patterns/landmarks/examples/navigation.html) and [WAI accessible-name guidance](https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/). |
| G9 | Header–Drawer responsibility is non-overlapping: Header owns a visible trigger’s placement, treatment, and accessible name; Drawer owns controlled-region presentation and visibility semantics. | Human priority / frozen extractor method | kept | No visible Header trigger means no owner, controlled role, or Drawer state is inferred for this context. |
| G10 | A static reading order of identity/home, direct product-wide navigation, global search, then trailing actions is a suitable reconstruction interpretation of the observed visual grouping. | Extractor inference | kept, bounded | This describes only the observed desktop representation and does not prescribe geometry or responsive behavior. |
| G11 | Search behavior, account-entry behavior, focus, keyboard flow, responsive transformation, Drawer presence in other contexts, and assistive-technology output are unknown. | Unknown / unverified | preserved | No controls were activated and no alternate viewport was inspected. |

## Static anatomy and composition

| Role | Static rule | Evidence |
| --- | --- | --- |
| Identity/home | Place one compact identity/home affordance at the leading Header edge. | G2, G10 |
| Product-wide navigation | Follow identity/home with three short, direct product-wide destination links in one horizontal group. | G2, G10 |
| Global search | Place one visually prominent global-search entry after product-wide navigation. Include a search cue and a compact shortcut cue, without specifying runtime behavior. | G3, G10 |
| Primary action | Place one filled primary conversion action in the trailing action group. | G4, G10 |
| Account entry | Place one secondary account-entry action beside the primary action. | G4, G10 |
| Drawer trigger seam | `presence=absent`; Header owner and controlled role are `unknown`; coarse placement is none observed; visible context is anonymous desktop at 1280 × 720. Drawer toggle location is `none-observed`; no Drawer presentation, closed representation, visibility state, or persistence is implied. | G6, G9 |

## Visual treatment

- Use one very light neutral Header surface with dark primary text and icons.
- Give the identity/home affordance a small warm accent without making the Header itself an accent surface.
- Give the primary action a dark filled treatment; make the adjacent account-entry action visually secondary with a light surface and clear boundary.
- Keep the search entry visually distinct from navigation and actions with a light bounded field treatment.
- Do not encode dimensions, spacing values, icon sizes, shadow recipes, or exhaustive colors.

## Accessibility and region boundary

- Use a persistent top-level Header/banner for the Global Header.
- Name a product-wide navigation landmark by purpose when it coexists with project/local navigation.
- Give icon-led identity, search, and any future trigger control a concise accessible name that conveys purpose.
- Do not treat project-local navigation, its collapse control, project context, or breadcrumb material as Global Header content.
- Do not render or specify a Header-owned Drawer trigger in the observed desktop context. A different context requires its own observed seam record.

## Unknowns

- Search results, shortcuts, focus movement, and keyboard behavior.
- Action destinations, account-entry behavior, loading, persistence, and announcements.
- Responsive Header transformation, other viewport contexts, and any Header-owned Drawer trigger outside the observed context.
- Drawer presentation, closed representation, visibility state, content, hierarchy, and persistence.
- Focus appearance, contrast conformance, forced-colors behavior, and assistive-technology output.
