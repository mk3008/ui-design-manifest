# Experiment 002: Drawer distillation and cross-site holdout

This experiment tests whether a reusable extraction method can distill a primary navigation drawer from one successful business application and transfer to another without copying a complete page.

## Scope

Included: the Drawer container, navigation hierarchy, current destination, material color roles, familiar icon affordances, visibility presentation, and bounded accessibility requirements.

Excluded: headers, main content, complete-page composition, runtime implementation, copied product data, exhaustive geometry, exhaustive palette capture, and unobserved interaction states.

## Sources

- Calibration source: [Grafana](https://grafana.com/), with [Grafana Navigation guidance](https://grafana.com/developers/saga/patterns/navigation/).
- Holdout source: [GitLab public project UI](https://gitlab.com/gitlab-org/gitlab), with [GitLab Navigation sidebar guidance](https://design.gitlab.com/patterns/navigation-sidebar/) and the [left-sidebar tutorial](https://docs.gitlab.com/tutorials/left_sidebar/).

The GitLab source screenshot could not be persisted during the bounded browser observation. The Contract and extraction result retain that evidence limitation instead of claiming a missing artifact.

## Contents

- [Reusable Drawer extraction method](../../methods/drawer/README.md)
- [Reference candidate stock](reference-candidates.md)
- Grafana calibration:
  - [Contract](calibration/grafana-drawer-contract.md)
  - [Static review](calibration/review/index.html)
  - [Rendered states](calibration/review/drawer-states-review.png)
  - [Raw calibration capture](calibration/evidence/grafana-business-metrics-1440x1000.png)
- GitLab holdout:
  - [Contract](holdout/gitlab-drawer-contract.md)
  - [Extraction result](holdout/gitlab-extraction-result.md)
  - [Static review](holdout/review/index.html)
  - [Rendered open state](holdout/review/drawer-desktop.png)

## Result

Human review accepted both the calibrated Drawer and the GitLab cross-site reconstruction as sufficiently natural for the PoC. The holdout exposed one material extraction gap: Drawer presentation and visibility cannot be represented safely as one causal enum.

The method now records four independent axes:

- `presentation`: `overlay`, `persistent`, or `unknown`
- `closedRepresentation`: `dismissed`, `compact-rail`, or `unknown`
- `toggleLocation`: `inside-drawer`, `outside-drawer`, `none-observed`, or `unknown`
- `persistence`: `persistent`, `non-persistent`, or `unknown`

For the observed GitLab desktop state, the evidence supports `presentation=persistent` and `toggleLocation=inside-drawer`. Closed representation and persistence remain unknown. The static artifact therefore shows only the supported open state and does not invent a compact rail or outside Show control.

This is evidence that the bounded method is worth continuing, not proof of universal Drawer fidelity.
