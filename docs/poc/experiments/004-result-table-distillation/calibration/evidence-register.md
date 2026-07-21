---
type: UI Evidence Register
title: GitLab read-only result table evidence
description: Bounded observations and provenance limits for the nominated source.
status: experimental
source: observed
scope: Anonymous public GitLab Pipelines table; four in-scope columns only.
---

# Evidence context

- **Nominated source:** https://gitlab.com/gitlab-org/gitlab/-/pipelines
- **Observed state:** anonymous public project surface, desktop table viewport.
- **Capture:** [bounded anonymous source evidence](evidence/gitlab-result-table-anonymous.png)
- **Re-observation:** the source URL resolved publicly during this extraction; the table exposed a header row and repeated body rows.

# Observation register

| Observation | Evidence boundary |
| --- | --- |
| The source uses named column headers for Status, Pipeline, Author, Stage, and an excluded Actions column. | Header labels are source facts only; they are not display-copy authorization. |
| The first four roles are repeated as aligned cells across body rows. | Supports the table structure and reading order, not a requirement to copy source data. |
| Status and pipeline values use visible links. | Supports only per-value link affordance when a product supplies a destination. |
| The stage cell contains repeated compact state marks. | Supports grouping and repeated visual treatment; it does not establish stage names, state meanings, counts, or updates. |
| The table uses a dark neutral surface, quiet headers, subtle row separation, and limited state accents. | Directional visual observation; no geometry or exhaustive palette is captured. |

# Copy and fixture register

No source-authored string is authorized for later display. The source URL, source header names, and general source description appear here only to identify evidence. No fixture string, label, status, identifier, person, action, count, or binding model is introduced or authorized by this register.
