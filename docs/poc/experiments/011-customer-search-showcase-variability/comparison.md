---
type: PoC comparison record
title: Customer search showcase variability comparison
status: ready-for-human-review
source: authored
baseline_commit: 28d7f788cc888cadf8cf1d889a5dadcfb3dbeef8
---

# Result

Three independent `gpt-5.6-terra` / `medium` implementations completed from
the same contract. The fixed customer fixture, default capture state, local
asset boundary, and basic static application requirements are consistent.
The rendered output is nevertheless materially different in layout and in
some optional UI treatments.

This is the expected signal for the experiment: the current manifest guides
the screens but does not yet constrain all of the visual decisions required
for repeatable output.

Open [comparison.html](comparison.html) to compare the fixed PNGs side by
side. Each full static sample remains available through its own `index.html`.

# Fixed facts confirmed for all runs

| Fact | Result |
| --- | --- |
| Business subject | Japanese customer search |
| Fixed fields | Customer ID, Name, Date of birth, Address, Phone number, Email address, Notes |
| Customer ID | Internal sequential ID; no editable control in edit state |
| Search conditions | Name, Date of birth, Phone number, Email address |
| Default capture | Drawer open, Light, no conditions, six results, no transient message |
| External dependencies | None observed |
| Capture viewport | 1440×1200 for all three PNGs |
| Persistence | Create, edit, and delete remain non-persistent static demonstrations |

## Fixed capture identity

Chrome `150.0.7871.187` captured each default Search screen at `1440×1200`.

| Run | PNG raw-byte SHA-256 | Bytes | Fallback |
| --- | --- | ---: | --- |
| Run 1 | `9F6EE52E3632BE3DA5761A64CA932B3A0103BAD855DF2CB451A45E48FFDFCA9C` | 95,298 | SwiftShader used after the normal command did not produce a successful capture. |
| Run 2 | `293A15FBAC1CE87DDBD48904200B17CA870AA774CF59D7F0C8F2C10786E534BC` | 98,148 | Not used. |
| Run 3 | `9C992F6715E2214AC49E518F2411E5D414463A1E232BD078F5044C01B708670F` | 103,352 | Not used. |

# Observed variance

| Area | Observed difference | Contract interpretation |
| --- | --- | --- |
| Search form | Runs 1 and 3 show four fields in one row; Run 2 uses a two-column, two-row arrangement. | Layout density and maximum form width are not yet fixed. |
| Header | Header title, business context, and passive Light indicator differ. | Header content and whether a fixed mode is displayed are not yet fixed. |
| Drawer | Runs add different supporting navigation or an internal-demo note. | Drawer item scope and allowed supplementary content are not yet fixed. |
| Result region | New-record affordance, explanatory text, and separation of heading/actions differ. | Result-screen action placement and allowed helper copy are not yet fixed. |
| Create identifier | Run 1 does not show an unassigned Customer ID at create time; Runs 2 and 3 show or reserve it differently. | The lifecycle rule for an ID before sequencing needs explicit wording if this must be uniform. |

# Constraint candidates if reproducibility is the goal

These are observations, not changes to the current standard pack.

1. Fix a search-form geometry for the reference viewport, including a maximum
   content width and intended field grouping.
2. Fix the Header information architecture: product name, context, and whether
   a non-interactive theme/mode indicator is permitted.
3. Define the Drawer’s permitted navigation depth and whether explanatory
   product/demo content is allowed.
4. Define the result-heading action zone and which helper messages are allowed.
5. Define the create-time representation of an ID assigned only after save.

# Promotion after screen review

The observed variance and subsequent review promoted the following general
guidance into the standard pack. The historical three runs remain unchanged as
evidence of the prior contract.

| Observation | Pack decision | Configuration impact |
| --- | --- | --- |
| Decorative `CUSTOMERS` / `CUSTOMER DIRECTORY` lines appeared before every page title. | A [Page header](../../../../templates/business-app/design-manifest/components/page-header.md) now requires one meaningful page title and allows a description only when it adds supplied context. A category line is not generated merely for visual hierarchy. | None; a real classification remains product binding. |
| `Internal demo` / `社内デモ環境` was treated inconsistently as shell decoration. | An [Environment notice](../../../../templates/business-app/design-manifest/components/environment-notice.md) now separates consequential environment information from a decorative watermark and requires a textual, non-color-only cue when it matters. | None; existence and meaning remain product binding. |
| Search action groups were rendered at both logical end and start. | Search conditions now require the resolved `search_actions_region` to govern the complete group. The existing default remains logical end. | No new ID; uses `search_actions_region`. |
| Section and result headings used different density and explanatory treatments. | The compact-work-surface and result-grid guidance now use a consistent vertical heading group: heading first, optional meaningful description below, and no interaction teaching. | None. |
| A visible detail operation appeared both in an identity cell and in a trailing action cell. | The result grid now prefers the leading, supplied primary identifier as the record-opening link when it is recognisable; a distinct end action remains only for a genuine distinct operation or an unsuitable identifier. | No new ID; uses existing `row_action_presentation`. |

# Limits

The comparison measures three generated samples on this execution surface. It
does not establish a universal model-quality score, implementation quality, or
accessibility conformance. Further review should evaluate the screens as
business UI examples and decide which optional decisions belong in a stronger
manifest.
