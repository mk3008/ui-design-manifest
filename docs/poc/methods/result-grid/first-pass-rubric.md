---
type: Extraction Rubric
title: Result-grid first-pass rubric
description: Review gates for a bounded source-blind result-grid handoff.
status: draft
source: authored
scope: Reusable method.
---

# Review checks

| Check | Pass condition |
| --- | --- |
| Complete observation | Every schema axis has one allowed classification and named knowledge ownership. |
| Sort restraint | The active sort column and direction are distinct; an inactive icon is not forced. |
| Selection restraint | A leading multi-select control and selected/unselected states are declared without implying bulk action or row activation. |
| Header selection ownership | The header checkbox is present only when select-all availability is Contract-declared; otherwise the header cell is empty. |
| Semantic alignment | Text/identifier/status, number, selection, and icon alignment are declared independently. |
| Width restraint | The grid uses its assigned container without arbitrary component margins; a meaningful flexible column absorbs residual width before empty surface space, and no semantic dummy column is introduced. |
| Typography | Header/body typography is independently considered; a restrained distinction does not require matching weight. |
| Contract completeness | Required neutral fixture slots and unresolved behavior have an owner. |
| Source boundary | The application bundle contains no identity, link, capture, copied values, or evidence reference. |
