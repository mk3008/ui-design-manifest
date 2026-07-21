# Global Header First-Pass Rubric

> Test-only rubric: it may compare extraction and application results with source-aware evidence, but none of that evidence may be passed to an implementer or linked from an application packet.

## Scoring labels

- `sufficient`: a fresh static implementer can act on the rule without source-local knowledge.
- `partial`: direction is useful, but an explicit unknown or human decision remains.
- `missing`: a required Header role or boundary is absent.
- `unsupported`: the statement claims unobserved source behavior.
- `source-specific`: copied source content, labels, data, icons, CSS, framework detail, measurements, or palette inventory leaked into the Contract.
- `out-of-scope`: Page Header, context/breadcrumb, local navigation, Drawer body, Main, footer, or full-page composition leaked in.

| Check | Finding for GitHub attempt 1 | Label |
| --- | --- | --- |
| Original URL, date, and observation state are recorded. | Recorded; a fresh isolated browser showed anonymous account-entry affordances and no account-specific Header controls. | sufficient |
| Header-only capture is available or blocked with a reason. | A banner-only anonymous PNG exists, with URL/date/state/viewport recorded in the evidence matrix. | sufficient |
| Global Header is separated from Context/Page Header and local navigation. | Explicitly separated using Primer's App Header, Context region, and Local navigation distinctions. | sufficient |
| Identity/home role is present without copied brand content. | Present as a generic role. | sufficient |
| Product-wide navigation role is handled. | One group of five disclosure-like triggers and one direct destination is recorded without copied labels. | sufficient |
| Global search is covered without invented runtime behavior. | Present as an entry-point role; behavior unknown. | sufficient |
| Global utilities and account access are not treated as anonymous facts. | One appearance-preference trigger and two anonymous account-entry links are directly evidenced. | sufficient |
| Drawer trigger is separated from Drawer ownership. | Absent in the observed 1280 × 720 desktop Header; Drawer contents excluded. | sufficient |
| Drawer trigger seam is complete when relevant. | Require presence (`observed`, `absent`, or `unknown`), Header owner, controlled Drawer role, coarse placement, and visible context. A visible Header trigger links to Drawer toggle location `outside-drawer` only in that observed context. | sufficient |
| Drawer boundary is not duplicated in Header rules. | Header rules may describe trigger placement, treatment, and accessible name only; Drawer content, hierarchy, presentation, closed representation, visibility state, and persistence remain Drawer-owned. | sufficient |
| No Drawer state is inferred from trigger placement. | An outside-Drawer toggle location never establishes dismissed, compact-rail, overlay, persistence, or responsive behavior. | sufficient |
| Four review views are Header-only. | Present. | sufficient |
| Material color roles are restrained; geometry is absent. | Dark neutral surface, light primary content, and muted secondary marks only; geometry omitted. | sufficient |
| Accessibility requirements distinguish evidence from guidance. | Landmarks/names are guidance; runtime state remains unknown. | sufficient |
| Source URLs for original and guidance are present. | Present. | sufficient |
| Responsive, keyboard, focus, disclosure, persistence, and AT behavior are not invented. | Explicitly unknown. | sufficient |
| Contract contains only source-independent design language. | Passed. | sufficient |

## Result

The method and the 1280 × 720 static GitHub Header Contract are ready for blind reconstruction review. Responsive and interactive behavior remain unknown and must not be fabricated.

## Seam failure guide

| Finding | Classification | Required correction |
| --- | --- | --- |
| A visible Header trigger has no presence, owner, controlled role, placement, or context record. | `missing` | Add the Header–Drawer trigger seam record; do not invent a Drawer state. |
| Header method specifies Drawer content, hierarchy, presentation, closed representation, visibility state, or persistence. | `out-of-scope` | Remove duplicated Drawer responsibility and retain only the linked trigger relationship. |
| A Header trigger’s placement is used to claim dismissed, compact-rail, overlay, persistence, or responsive behavior. | `unsupported` | Keep only the observed outside-Drawer toggle-location relation; mark other axes `unknown`. |
| A trigger is absent or unobserved but a control or Drawer behavior is added. | `unsupported` | Preserve the recorded context as absent or unknown. |
