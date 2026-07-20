# Primary navigation drawer extraction template

## Use

Use this template for one primary navigation drawer and nothing outside it. For every substantive field, write one of `observed`, `inferred`, or `unknown`, plus at least one evidence ID from [evidence-matrix.md](evidence-matrix.md). `Inferred` is never promoted to an observed source fact.

## 0. Subject boundary

| Field | Entry |
| --- | --- |
| Subject | Primary navigation drawer only |
| Seed product / evidence set | |
| Included visual states | |
| Excluded regions and concerns | Header, main content, right utility region, footer, complete-page composition, runtime details |
| Evidence limitations | |

## 1. Component / control view

| Element or relation | Status | Observation or inference | Evidence IDs | Generalization status | Unknown / validation need |
| --- | --- | --- | --- | --- | --- |
| Container classification: drawer, panel, rail, or unknown | | | | | |
| Drawer toggle / restore affordance | | | | | |
| Navigation section/group (non-destination) | | | | | |
| Plain navigation item / destination | | | | | |
| Parent navigation item | | | | | |
| Disclosure trigger, indicator, and controlled child list | | | | | |
| Child navigation item | | | | | |
| Current navigation item | | | | | |
| Divider or section label, if material | | | | | |
| Icon-led control, if present | | | | | |

## 2. Component-layout view

| Relationship | Status | Observation or inference | Evidence IDs | Generalization status | Unknown / validation need |
| --- | --- | --- | --- | --- | --- |
| Presentation axis: `overlay`, `persistent`, or `unknown` | | | | | |
| Closed-representation axis: `dismissed`, `compact-rail`, or `unknown` | | | | | |
| Toggle-location axis: `inside-drawer`, `outside-drawer`, `none-observed`, or `unknown` | | | | | |
| Persistence axis: `persistent`, `non-persistent`, or `unknown` | | | | | |
| Grouping and reading order | | | | | |
| Parent-to-child nesting distinction | | | | | |
| Current-item visual distinctions (do not require a seed decoration) | | | | | |
| Material surface / foreground / state color-role relationships | | | | | |
| Icon foreground visibility in observed states | | | | | |

Do not enter measurements, palette inventories, copied labels, source data, CSS, assets, or framework details.

Do not derive one visibility axis from another. A static image may establish only the represented axis value; mark unobserved closed representation, toggle location, or persistence `unknown`.

## 3. Region-composition view

| Relationship | Status | Observation or inference | Evidence IDs | Generalization status | Unknown / validation need |
| --- | --- | --- | --- | --- | --- |
| Drawer’s orientation role relative to the adjacent workspace | | | | | |
| Drawer visibility effect on the adjacent workspace, if observable | | | | | |
| Boundary between persistent navigation and source-specific page content | | | | | |
| Scope stop: no rule about header, main, right utility, footer, or full page | | | | | |

## 4. Accessibility view

| Requirement or observation | Status | Observation or inference | Evidence IDs | Generalization status | Unknown / validation need |
| --- | --- | --- | --- | --- | --- |
| Navigation purpose / landmark naming requirement | | | | | |
| Discernible name for each interactive control, including icon-only controls | | | | | |
| Current destination exposed programmatically | | | | | |
| Disclosure expanded/collapsed state and control relationship | | | | | |
| Visible state distinctions not solely conveyed by color | | | | | |
| Keyboard, focus, contrast, forced-colors, responsive, and assistive-technology validation | `unknown` unless tested | | | | |

## 5. Output decision log

| Candidate Contract statement | Evidence classes used | Classification: stable / contextual / source-specific / unconfirmed | Keep, hold, or omit | Why |
| --- | --- | --- | --- | --- |
| | | | | |

## Completion gate

The extraction is ready for reconstruction only when every kept statement is traceable, every unknown remains explicit, and no rule crosses the subject boundary. Freeze the template and prompt before applying them to a different successful product’s drawer; the second source tests the extractor and must not quietly edit it mid-run.
