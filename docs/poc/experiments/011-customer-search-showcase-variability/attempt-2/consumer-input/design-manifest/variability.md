---
type: UI Design Manifest variability map
title: Fixed and variable responsibility map
description: A discoverable summary of fixed guidance, product-owned variables, and implementation decisions.
status: draft
source: authored
scope: All foundations, components, screen patterns, and flows in this standard pack.
---

# Reading the map

Fixed guidance expresses the stable task or interaction responsibility supplied
by this pack. Product-owned variables must come from product binding,
requirements, or running implementation; a fixture cannot invent them.
Implementation decisions may vary without changing the semantic contract.

The five IDs in
[Record-list options](configuration/record-list-options.md) remain the complete
record-list configuration vocabulary. [Theme colors](configuration/theme-colors.md)
is a separate bounded configuration: it allows concrete values for the fixed
Light and Dark semantic roles to change without adding roles, modes, or product
capabilities. No other row below creates a setting.

# Foundations

| Area | Fixed guidance | Product-owned variables | Implementation decisions |
| --- | --- | --- | --- |
| Compact work surface | Preserve scanability with a supplied importance hierarchy, bounded reading measure, alignment, and restrained spacing before borders or containers; keep single-line controls aligned. | Applicable density needs, content priority, user tasks. | Spacing scale, typography, reading width, control-height token, concrete breakpoints. |
| Accessible work surface | Semantic names, keyboard reachability, visible focus, non-color cues, recovery. | Labels, errors, status meaning, time limits, task-specific requirements. | Markup, key handling, focus logic, contrast/reflow/AT verification. |
| Color and theme | Both light and dark modes are required; page/surface, primary/muted text, subtle/interactive border, action, link, selection, visible focus, success, information, warning, and error roles keep stable meaning; concrete `#RRGGBB` defaults are locally editable; brand and status remain separate; color is not the only cue. | Theme identity, user-selection capability, selectable preferences, initial-preference rule, preference source, persistence, brand constraints, additional requirements. | Header or host-shell control placement, caption, icon, and interaction model; CSS variable names, theme loading, system preference integration. |

# Components

| Area | Fixed guidance | Product-owned variables | Implementation decisions | Formal configuration |
| --- | --- | --- | --- | --- |
| Drawer | Separate navigation from workspace; distinguish visibility from hierarchy; omit hidden residual space. | Existence, items, hierarchy, routes, current destination, permissions, visibility, persistence. | Width, animation, CSS, DOM, breakpoint treatment. | None |
| Page header | Use one page title for the current task/destination; use a description only when it adds supplied task context; do not manufacture a decorative category line. | Title, description, actual classification, page actions, record identity, hierarchy, destinations, permissions. | Title size, action alignment, sticky behavior, CSS, DOM, framework. | None |
| Environment notice | Show a persistent textual environment indication only when it changes user expectations or action risk; do not use a decorative watermark as the only cue. | Existence, label, meaning, affected capabilities, visibility conditions, environment requirements. | Shell placement, visual emphasis, persistence, CSS, DOM, framework. | None |
| Breadcrumb | Show supplied ancestors in stable hierarchy order below global navigation and above the page title; do not represent visit history or wizard progress. | Hierarchy availability, ancestor identities, labels, order, destinations, current page, separate return context. | Separator, overflow, truncation, compact-width and sticky-header mechanics, CSS, DOM. | None |
| Search conditions | Bound one search task and keep Search/Clear responsibilities explicit; apply the resolved action group region and order. | Fields, values, validation, action capability, labels, query behavior. | Control layout, widths, CSS, framework. | Action region and complete action order |
| Result grid | Support dense comparison; keep title/count/context in one compact grid summary; keep sort in its column header; distinguish selection without synthetic status copy; prefer a leading primary-identity link for one frequent record-opening operation. | Columns, values, sort/select capabilities and state, row identity, row destination. | Column widths, filler columns, sticky behavior, CSS, DOM. | Row-action presentation; shared result count and pagination placement |
| Result card | Support identity-oriented summaries; separate selection from detail; do not stretch an incomplete final row. | Identity, title, summary, metadata, selection, destination, media, status, actions. | Card width, column count, gap, CSS, DOM. | None |
| Pagination | Continue one declared result set without inventing page state or count. | Paging capability, current position, totals, labels, destinations, loading state. | Concrete control composition and CSS. | Pagination region |
| Status badge | Add a concise non-color state cue only when a state is supplied. | State inventory, label, meaning, severity, transition source. | Shape, icon, color, CSS. | None |
| Record fields | Read-only desktop details use compact left-caption rows when captions are short and stack on narrow or long-caption surfaces; create/edit labels sit above controls; read-only values are content; only explicitly related editable fields may share a row; single-line controls align. | Field inventory, labels, order, importance, related-field groups, types, required state, values, validation, permissions, sensitivity. | Read-only caption width and reading measure, concrete control height, widths, breakpoints, CSS, framework. | None |
| Dialog | Contain one bounded blocking task with explicit entry, dismissal, and return-focus responsibilities. | Modal availability, title, content, actions, dismissal, pending/failure state, affected object. | Dimensions, overlay, animation, focus implementation, CSS, DOM. | None |
| Confirmation | Name the action and material consequence; provide a safe alternative; keep pre-action confirmation separate from outcome. | Consequence, impact, reversibility, identity, action availability, outcome. | Concrete container and visual treatment. | None |
| Step indicator | Orient a stable linear task of three or more pre-submit user steps without becoming implicit navigation; do not predict post-submit success as a pending `Complete` step. | Steps, labels, order, current state, revisitability, branching meaning, per-step completion. | Orientation, connectors, CSS, DOM. | None |
| Dashboard panel | Answer one operational question with clear unit, time, freshness, state, and destination. | Metric/queue/trend data, calculation, threshold, filters, priority, destination, states. | Chart type within supplied meaning, dimensions, CSS, framework. | None |

# Screen patterns and flows

| Area | Fixed guidance | Product-owned variables | Implementation decisions | Formal configuration |
| --- | --- | --- | --- | --- |
| Search with grid | Combine search and dense comparison; keep list context when opening a record. | Search schema, result data, capabilities, destinations, empty/loading/failure states. | Screen composition within linked component contracts. | Uses the five record-list options |
| Search with cards | Combine search and identity-oriented browsing; do not treat cards as a grid display mode. | Search schema, record summaries, capabilities, destinations, states. | Screen composition within linked component contracts. | None |
| Record read | Present one supplied identity and compact read-only key/value groups without spreading unrelated fields across equal-width cells; keep one restrained summary-card-like surface when the workspace needs separation, use left captions for short-caption desktop scanning and stacked captions when space or content requires them, and keep supplied non-finalizing actions in a reachable page header; do not imply Edit or Delete. | Identity, fields, values, importance, promoted facts, visibility, freshness, available actions, return destination. | Caption width, reading measure, secondary-metadata treatment, responsive stacking, sticky/collapsing header mechanics, CSS. | None |
| Record create | Start from supplied empty/default values; use the single-column default; keep Create then safe cancellation in source/visual/Tab order within a persistent footer. | Schema, defaults, related-field groups, validation, permissions, persistence, outcome, destinations. | Footer/scroll mechanics, physical edge in bidirectional layouts, form width, CSS. | None |
| Record edit | Preserve identity and current values without an ambiguous banner; use the single-column default; keep Save then cancellation in source/visual/Tab order within a persistent footer; expose conflicts. | Editable schema, values, related-field groups, validation, permissions, concurrency, persistence, destinations. | Footer/scroll mechanics, physical edge in bidirectional layouts, form width, CSS. | None |
| Record delete | Confirm one identifiable destructive action and supplied consequence. | Availability, permission, consequence, impact, reversibility, execution, outcome, destination. | Confirmation presentation and CSS. | None |
| Wizard | Use only for a stable linear task; keep ordinary Back/advance, pre-submit Review, explicit final action, and post-submit Result distinct. | Steps, questions, validation, branching, persistence, review and Change destinations, advance/final action labels, submission, pending state, outcome, recovery, destinations. | Step layout and CSS. | None |
| Dashboard | Prioritize supplied exceptions and next tasks; keep metrics, queues, and trends distinct. | Purpose, panels, priority, data, freshness, filters, relationships, states, destinations. | Grid, chart rendering, CSS, framework. | None |
| List/Card to detail | Connect an available record-opening role to a supplied detail destination. | Capability, destination, return context. | Navigation mechanism. | None |
| Record lifecycle | Keep read, create, edit, and delete as separate task states. | Available transitions, permissions, state, outcomes, destinations. | Routing mechanism and state transport. | None |
| Screen transition | Distinguish hierarchy, history/return, step progress, navigation, and mutation; preserve only supplied context. | Origin, destination, hierarchy, ancestor labels, history, focus target, context restoration, failure recovery. | Router, URL shape, breadcrumb overflow, scroll restoration, animation, framework. | None |
| Wizard progress | Preserve values and validation across supplied steps; treat Review as the final numbered step when supplied, final submission as its action, and Result as a separate post-submit state. | Step graph, validation, persistence, final action, pending state, outcome, recovery, completion destination. | State and routing implementation. | None |

# Change boundary

Changing a fixed responsibility changes the guidance contract. Changing a
product-owned value changes the application input. Changing only an
implementation decision does not authorize a semantic change. Moving any item
between these columns requires explicit compatibility and migration review;
local overrides cannot perform that move.
