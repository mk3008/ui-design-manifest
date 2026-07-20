# Experiment 003: Global Header distillation and cross-site holdout

This experiment tests whether a reusable Global Header extraction method can distill one product-wide Header and transfer to a second public product without copying source labels, implementation, or complete-page composition.

## Scope

Included: product identity/home, product-wide navigation, global search, global utilities, account access, material Header treatment, coarse reading order, and a contextual Header–Drawer trigger seam when visibly supported.

Excluded: project or repository context, Page Header/title, local navigation, Drawer body and visibility semantics, Main, sidebar, footer, runtime implementation, copied product data, exhaustive geometry, exhaustive palette capture, and unobserved interaction states.

## Sources

- Calibration source: [GitHub public repository](https://github.com/mk3008/ui-design-manifest), observed anonymously at a bounded desktop viewport.
- Holdout source: [GitLab public project UI](https://gitlab.com/gitlab-org/gitlab), observed anonymously at a bounded desktop viewport.
- Official guidance is recorded in each Contract and the reusable method evidence matrix.

## Contents

- [Reusable Global Header extraction method](../../methods/header/README.md)
- GitHub calibration:
  - [Bounded source capture](calibration/evidence/github-global-header-anonymous.png)
  - [Contract](calibration/github-global-header-contract.md)
  - [Static review](calibration/review/index.html)
  - [Static review stylesheet](calibration/review/styles.css)
  - [Rendered reconstruction](calibration/review/global-header.png)
- GitLab holdout:
  - [Bounded source capture](holdout/evidence/gitlab-global-header-anonymous.png)
  - [Contract](holdout/gitlab-global-header-contract.md)
  - [Static review](holdout/review/index.html)
  - [Static review stylesheet](holdout/review/styles.css)
  - [Rendered reconstruction](holdout/review/global-header.png)

## Calibration and holdout result

The GitHub calibration established the reusable boundary and role vocabulary for the observed anonymous desktop Header. The GitLab holdout applied the frozen method without changing it and produced a separate source-grounded Contract and static reconstruction.

Both observed desktop contexts had no visible Header-owned Drawer trigger. This is contextual evidence, not a universal rule: absence in one Header representation does not establish absence in another viewport or product context. Conversely, when a trigger is visibly present in the same context, Header owns its placement, treatment, and accessible name, while Drawer owns the controlled region and its visibility semantics. A trigger relationship may therefore inform Drawer `outside-drawer` toggle location only in that matching context; it must not infer Drawer presentation, closed representation, state, or persistence.

The accepted results support continuing the bounded method. They do not establish universal Global Header fidelity or unobserved responsive and interactive behavior.
