---
type: Exercised Classification
title: Drawer extraction coverage
description: Explicit classifications for the bounded static-image extraction.
status: draft
source: mixed
---

# Four-view classification

| View | Claim | Status | Classification | Boundary |
| --- | --- | --- | --- | --- |
| Component/control | Dedicated vertical navigation container is visible. | observed | contextual | Open static state only. |
| Component/control | Direct entries, nested relationships, and one current entry are visually differentiated. | observed | contextual | No destination or interaction meaning inferred. |
| Component/control | A paired trailing indicator supports a parent/child inference. | inferred | unconfirmed | Expansion operation and state are unknown. |
| Component layout | Rows form a top-to-bottom scan rhythm with repeated alignment. | observed | contextual | No measurements implied. |
| Component layout | Presentation, closed representation, toggle location, and persistence. | unknown | unconfirmed | Static open image cannot establish these axes. |
| Region composition | Navigation is separated from adjacent workspace responsibility. | observed | contextual | No rule about the workspace itself. |
| Accessibility | Current state and disclosure relationships need programmatic semantics if target data supplies them. | inferred | stable | Requirement to validate, not observation of implementation. |
| Accessibility | Keyboard, focus, contrast, forced-colors, responsive, and assistive technology outcomes. | unknown | unconfirmed | Requires targeted testing. |

# Decision log

| Candidate statement | Evidence classes | Result | Reason |
| --- | --- | --- | --- |
| Keep a dedicated open navigation region beside the workspace. | successful-product observation | keep / contextual | Visible within the bounded state. |
| Keep a repeated, vertically ordered navigation rhythm. | successful-product observation | keep / contextual | Visible grouping and reading order. |
| Preserve explicit parent/child distinction when target data establishes it. | observation; extractor inference | keep / unconfirmed | Visual nesting supports the distinction, not behavior. |
| Treat a current destination distinctly when supplied. | observation; authoritative accessibility guidance | keep / contextual | Current treatment is visible; actual state is not supplied. |
| Specify toggle, closed representation, persistence, or interaction. | unknown | omit / unconfirmed | Not established by this input. |
