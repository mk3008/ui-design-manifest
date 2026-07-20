# GitLab primary navigation drawer Contract — holdout

## Provenance and boundary

- Original source: <https://gitlab.com/gitlab-org/gitlab>
- Official guidance: [Navigation sidebar](https://design.gitlab.com/patterns/navigation-sidebar/) and [left-sidebar tutorial](https://docs.gitlab.com/tutorials/left_sidebar/).
- Subject: the primary navigation drawer only. Excludes the header, repository content, detail panel, footer, page composition, copied navigation labels, measurements, palette inventory, and implementation mechanisms.

## Component / control

- **Observed product fact:** a named primary-navigation landmark contains one current top-level destination, additional top-level navigation controls, a help affordance, and a collapse affordance.
- **Observed product fact:** the current destination exposes a current-page state. Top-level controls that can reveal sub-level navigation expose a collapsed state and a controlled relationship in the observed state.
- **Documented GitLab pattern, source-specific:** top-level items use an icon or avatar and may own related sub-level items; the documented hierarchy stops at two levels. The visible holdout state does not show an expanded child list.
- **Extractor inference:** preserve the distinction among a non-destination group, a parent control with a disclosure state, a child destination, and a plain destination. Do not infer an expanded child list solely from the presence of a top-level control.
- **Visibility classification, observed desktop state:** `presentation=persistent`; `closedRepresentation=unknown`; `toggleLocation=inside-drawer`; `persistence=unknown`. The observed compact visibility control supports only its location, not a closed representation or persistence behavior.
- **Documented GitLab pattern, source-specific:** smaller-screen navigation can use `presentation=overlay`. The existing evidence does not establish its closed representation, toggle location, or persistence, so those axes remain `unknown`.

## Component layout

- **Observed product fact:** the drawer is a vertical leading region, with icon-and-label top-level controls arranged in a single scan path.
- **Observed product fact:** the current destination has a filled, cool-toned surface and a distinct icon/label treatment. No leading current-state indicator is observed; the prior calibration’s leading bar therefore does not transfer.
- **Observed product fact:** icon foregrounds are visibly distinct from the dark navigation surface in the represented state. This is not a measured contrast claim.
- **Documented GitLab pattern, source-specific:** the sidebar is visible by default on larger screens; on smaller screens it is hidden by default and, when revealed, overlays page content with a background overlay. Do not promote this behavior to a universal drawer rule.
- Do not capture exact colors, geometry, source labels, pinned-item behavior, or preference persistence.

## Region composition

- The drawer supplies persistent, context-specific orientation at the leading edge of the product workspace.
- Its presentation and visibility axes remain independent from its navigation hierarchy and disclosure state. Do not infer one axis from another.
- Do not add rules for the header, repository content, detail panel, footer, or complete page.

## Accessibility requirements and validation gaps

- Preserve a meaningful navigation region and a discernible name for every interactive control, including a compact visibility control.
- Preserve programmatic current-location state for the current destination.
- Preserve programmatic expanded/collapsed state and the parent-to-child relationship when a sub-level list is represented.
- Keep current-state recognition independent of color alone.
- **Unknown / required validation:** expanded child-list behavior, keyboard interaction, focus order and return, assistive-technology output, contrast measurement, forced-colors behavior, zoom/reflow, and responsive implementation.

## Holdout classification

The frozen extractor transfers the drawer boundary, named navigation, current-state distinction, state separation, and evidence restraint. GitLab’s two-level hierarchy, icon/avatar top-level treatment, cool-toned current surface without a leading indicator, and overlay behavior at smaller screens remain **source-specific**. The extractor is unchanged.
