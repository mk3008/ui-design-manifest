# Primary navigation drawer extraction template

## Use

Use this template for one primary navigation drawer and nothing outside it. For every substantive field, write one of `observed`, `inferred`, or `unknown`, plus at least one evidence ID from [evidence-matrix.md](evidence-matrix.md). `Inferred` is never promoted to an observed source fact. Every retained claim also has exactly one provenance classification: `observed`, `method-default`, `unresolved/not observed`, or `product input required`; method-default is never observed.

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
| Drawer toggle / restore affordance and ownership seam | | | | | |
| Navigation section/group or non-destination caption | | | | | |
| Independent/direct navigation item / destination, if observed | | | | | |
| Expandable parent navigation item with shown children, if observed | | | | | |
| Top-level leaf with no shown children, if observed | | | | | |
| Disclosure trigger/indicator: presence, placement, direction, synchronization, icon responsibility, controlled child list, and guarded method-default fallback when indicator treatment is unobservable | | | | | |
| Child navigation item | | | | | |
| Current navigation item: accent presence, placement, shape/role, coexistence with fill/text/icon cues, and guarded method-default fallback when accent treatment is unobservable | | | | | |
| Divider or section label, if material | | | | | |
| Icon-led control, if present | | | | | |

## 2. Component-layout view

| Relationship | Status | Observation or inference | Evidence IDs | Generalization status | Unknown / validation need |
| --- | --- | --- | --- | --- | --- |
| Presentation axis: `overlay`, `persistent`, or `unknown` | | | | | |
| Closed-representation axis: `dismissed`, `compact-rail`, or `unknown` | | | | | |
| Closed representation evidence: dismissed absence/external restore owner, or compact-rail retained region/internal control/declared shortcuts | | | | | |
| Toggle-location axis: `inside-drawer`, `outside-drawer`, `none-observed`, or `unknown` | | | | | |
| Persistence axis: `persistent`, `non-persistent`, or `unknown` | | | | | |
| Grouping and reading order | | | | | |
| Parent-to-child nesting distinction | | | | | |
| Selected and non-selected comparison, when both are observed (do not require a seed decoration) | | | | | |
| Repeated row rhythm, when material (do not enter measurements) | | | | | |
| Relationship between navigation rows and the Drawer region edge, when material (do not enter measurements) | | | | | |
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
| Header–Drawer control seam: later Header-owned external restore trigger versus Drawer-owned compact-rail internal control | | | | | |
| Scope stop: no rule about header, main, right utility, footer, or full page | | | | | |

## 4. Accessibility view

| Requirement or observation | Status | Observation or inference | Evidence IDs | Generalization status | Unknown / validation need |
| --- | --- | --- | --- | --- | --- |
| Navigation purpose / landmark naming requirement | | | | | |
| Discernible name for each interactive control, including icon-only controls | | | | | |
| Current destination exposed programmatically | | | | | |
| Disclosure expanded/collapsed state, parent-owned child group, indicator synchronization, and accessible state | | | | | |
| Visible state distinctions not solely conveyed by color | | | | | |
| Icon semantic responsibility, discernible naming, and omission when no approved/project-available asset is supplied; contract-declared parent with unobservable indicator treatment fallback only: meaningful `currentColor` inline SVG chevron/caret right when collapsed and down when expanded | | | | | |
| Keyboard, focus, contrast, forced-colors, responsive, and assistive-technology validation | `unknown` unless tested | | | | |

## 5. Output decision log

| Candidate Contract statement | Provenance: observed / method-default / unresolved/not observed / product input required | Evidence classes used | Classification: stable / contextual / source-specific / unconfirmed | Keep, hold, or omit | Why |
| --- | --- | --- | --- | --- |
| | | | | | |

## 6. Role-and-relationship coverage inventory

Complete this inventory before claiming that a reconstruction exercises retained organization. Every row is an observation question, not a required fixture role. Use exactly one coverage status per row: `observed and retained`, `observed but not exercised`, `not observed`, `out of scope`, or `unresolved`. An `observed but not exercised` row must name its concrete omission in the claim matrix.

| Candidate role or relationship | Coverage status | Evidence IDs / boundary | Retained source-independent relationship, if any | Claim-matrix ID or omission reason |
| --- | --- | --- | --- | --- |
| Expandable parent with shown children | | | | |
| Top-level leaf with no shown children | | | | |
| Child navigation item | | | | |
| Independent/direct navigation item | | | | |
| Selected and non-selected comparable-item contrast | | | | |
| Current-item accent cue and any coexistence with fill, text, or icon cues | | | | |
| Parent disclosure indicator and parent-to-child ownership | | | | |
| Drawer trigger and its declared responsibility | | | | |
| Closed representation and Header–Drawer control seam | | | | |
| Repeated row rhythm | | | | |
| Relationship to the Drawer region edge | | | | |

## 7. Semantic claim matrix for reconstruction review

Complete this matrix before an implementer receives the application packet. A required claim is a material Drawer relationship needed to demonstrate the scoped extraction; it is not a requirement to invent an unobserved state or source-specific treatment.

| Matrix ID | Coverage-inventory relationship | Required visual-intent claim | Source-to-Manifest trace | Claim status | Neutral fixture witness and generated evidence needed for re-extraction | If not exercised: concrete justified omission and required input | Re-extraction result: preserved / contradicted / not exercised / unresolved |
| --- | --- | --- | --- | --- | --- | --- |
| | | | | `required` / `justified omission` / `unknown` | | | |

Fixture constraints: use a fixture only in a declared semantic slot. Mark its value neutral and synthetic. Do not use a fixture to reproduce source display copy, product identity, destination data, item count, hierarchy shape, exact visual treatment, assets, or behavior. Do not add group captions or groups that were not observed and retained. Do not use square or checkbox-like placeholders as icons, and do not use rounded navigation items unless the accepted Contract retains that treatment. A meaningful icon is allowed only for a declared semantic slot; when a contract-declared expandable parent requires a disclosure indicator and the source cannot establish indicator treatment, use the explicit `method-default` meaningful `currentColor` inline SVG chevron/caret, right when collapsed and down when expanded; the parent control has a discernible name and synchronized accessible state. Otherwise omit it. Never use this fallback for captions or leaves, as text glyphs, or as placeholder boxes, and never invent a parent. `Not exercised` is acceptable only with the recorded concrete justification; it is never evidence that the claim was preserved.

## Completion gate

The extraction is ready for reconstruction only when every kept statement is traceable, every unknown remains explicit, no rule crosses the subject boundary, every observed-and-retained material relationship has a neutral witness and re-extraction check or a concrete justified omission, and every material kept statement is represented in the semantic claim matrix as `required` or a justified omission. Freeze the template and prompt before applying them to a different successful product’s drawer; the second source tests the extractor and must not quietly edit it mid-run.
