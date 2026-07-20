# GitLab drawer extraction result — frozen-extractor holdout

## Observation record

| Field | Value |
| --- | --- |
| Original source URL | <https://gitlab.com/gitlab-org/gitlab> |
| Observation time | 2026-07-19T13:11:04.508Z |
| Access state | Public, not signed in; no interaction that changes external state was performed. |
| Visual evidence | **Capture blocked.** A bounded primary-drawer crop was observed in the in-app browser, but the browser runtime was denied permission to write the requested PNG evidence path. No durable image file is claimed. |
| Official source 1 | [GitLab Navigation sidebar](https://design.gitlab.com/patterns/navigation-sidebar/) |
| Official source 2 | [GitLab left-sidebar tutorial](https://docs.gitlab.com/tutorials/left_sidebar/) |
| Refined method | [Evidence matrix](../../../methods/drawer/evidence-matrix.md), [correction log](../../../methods/drawer/drawer-correction-log.md), [template](../../../methods/drawer/drawer-extraction-template.md), [prompt](../../../methods/drawer/drawer-extraction-prompt.md), and [rubric](../../../methods/drawer/drawer-first-pass-rubric.md) now require independent presentation/visibility axes. No unrelated extraction rule was changed. |

## Evidence separation

| Class | Evidence and permitted conclusion |
| --- | --- |
| Observed product fact | The public page exposes a named primary-navigation landmark. In the observed localized desktop state, one top-level destination has current-page state; eight top-level controls expose `collapsed` state and a controlled relationship; a compact sidebar-collapse control has a discernible name. The visual drawer is vertical, dark-surfaced, icon-and-label led, and has a filled cool-toned current row. |
| Official GitLab documentation | The sidebar is persistent and context-specific; its documented hierarchy is two levels with icon/avatar top-level items and related sub-level items. GitLab documents a smaller-screen overlay presentation, but not the other axis values for this observed state. |
| Extractor inference | Treat drawer visibility separately from disclosure; preserve taxonomy rather than assuming every labeled row is a parent; retain source-specific visual treatment as a calibration fact. |
| Human priority | The frozen correction log requires established terminology, a distinct current state, a group-versus-parent distinction, discernible compact controls, visible icon foreground, and restraint from geometry/source-copy leakage. |
| Unknown / unverified | No expanded child list, closed representation, persistence behavior, keyboard path, focus behavior, assistive-technology output, contrast measurement, forced-colors, or responsive implementation was tested. |

## Four-view extraction

| View | Result | Classification |
| --- | --- | --- |
| Component / control | A primary navigation landmark contains current, top-level, help, and visibility controls. The observed top-level controls are collapsed and identify controlled content. Official guidance supplies the two-level parent/sub-level model, but no child list is open in the public state. | `partial` — taxonomy is usable, but expanded-child visual evidence is absent. |
| Component layout | A vertical leading drawer uses icon-and-label rows. The current row has a filled cool-toned treatment rather than the prior calibration’s leading indicator. Icon foreground is visibly distinct in the observed state. | `sufficient` for first-pass static reconstruction; current treatment is `source-specific`. |
| Region composition | Visibility axes are independent: observed desktop `presentation=persistent` and `toggleLocation=inside-drawer`; `closedRepresentation=unknown` and `persistence=unknown`. GitLab documentation supplies conditional smaller-screen `presentation=overlay`; it does not fill the other unknown axes. No adjacent-region rule was extracted. | `partial` — documented overlay is source-specific and unobserved axes remain unknown. |
| Accessibility | The observed landmark, current-page state, collapsed state, controlled relationship, and control names support a bounded semantic baseline. Keyboard, focus, contrast, and assistive-technology behavior remain unverified. | `partial` — static semantic evidence is present; conformance is not claimed. |

## Contract decision log

| Candidate statement | Evidence classes | Decision | Why |
| --- | --- | --- | --- |
| Name the container a primary navigation drawer/sidebar. | Observed product fact; official documentation; extractor inference | keep — `source-specific` container realization | The evidence shows a persistent left navigation region; its responsive overlay behavior belongs to GitLab. |
| Preserve current location as a visible and programmatic state. | Observed product fact; frozen current-state rule | keep — `sufficient` | A current-page state and a distinct filled row are both observed. The leading marker is not transferred. |
| Preserve parent/disclosure and child-list taxonomy. | Observed product fact; official documentation; frozen taxonomy rule | keep with gap — `partial` | Collapsed controls and official two-level guidance support the relationship, but no expanded child list is visible. |
| Classify presentation and visibility through independent axes. | Observed product fact; official documentation; frozen visibility-mode rule | keep with gap — `partial` | Observed desktop supports `presentation=persistent` and `toggleLocation=inside-drawer`; closed representation and persistence remain unknown. Official documentation supplies only a conditional smaller-screen overlay presentation. |
| Record exact color values. | Observed product fact; frozen color-restraint rule | omit — `source-specific` | Material color relationships are visible, but exact values were not directly collected and an exhaustive palette is prohibited. |
| Require discernible names and meaningful icon foreground. | Observed product fact; frozen accessibility rules | keep — `partial` | Names and visible foreground are observed in this state; measurement and all-state validation are not available. |

## Frozen first-pass rubric

| Rubric check | Result | Evidence / limitation |
| --- | --- | --- |
| Subject boundary | `sufficient` | Contract stays drawer-only. |
| Evidence separation | `sufficient` | Product, documentation, inference, human priority, and unknowns are separated above. |
| Taxonomy | `partial` | Parent controls and official two-level model are available; expanded child list is not observed. |
| Four-view coverage | `sufficient` | Each drawer-only view is completed. |
| Current state | `sufficient` | Visual and programmatic current state are observed. |
| Disclosure state | `partial` | Collapsed state is observed; open-state behavior and keyboard handling are unverified. |
| Visibility-mode axes | `partial` | Presentation and toggle location are observed for the desktop state; closed representation and persistence are explicitly unknown. |
| Visibility causality | `sufficient` | No closed representation or persistence is derived from toggle location. |
| Accessible naming | `sufficient` for observed controls | The visible controls expose discernible names; all-state validation remains unconfirmed. |
| Distillation restraint | `sufficient` | No copied labels/data, geometry, palette inventory, or implementation mechanism is used as a rule. |
| Generalization boundary | `sufficient` | GitLab-specific overlay, hierarchy, and current-row treatment are explicitly classified. |
| Freeze discipline | `sufficient` | The reviewed visibility-mode refinement is explicit and bounded; this holdout does not add any unrelated source-derived rule. Gaps remain recorded rather than inferred. |

## Holdout finding

The refined extractor transfers the important questions without forcing the prior calibration’s persistent/no-scrim or leading-indicator treatment onto GitLab. The holdout exposes one evidence limitation rather than a method defect: a public, collapsed initial state does not visually establish a child-list-open state. The reviewed visibility-mode refinement adds no rule from that gap; carry the limitation into blind reconstruction review.
