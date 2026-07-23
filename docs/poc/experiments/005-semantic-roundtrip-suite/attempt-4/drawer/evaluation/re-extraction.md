---
title: Drawer default re-extraction
status: in-progress
date: 2026-07-23
---

# Drawer default re-extraction

## Stage order and verified inputs

The two generated PNGs were inspected before this document was written. HTML and the claim matrix had not been opened at the time the following section was fixed. SHA-256 verification passed for `wide.png`, `narrow.png`, `index.html`, and `claim-matrix.md` under the attempt-2 correction packet.

## Image-only recovery — fixed before structure inspection

### Region responsibility and presentation

- **Visually recovered:** A narrow, left-edge vertical navigation region occupies a white surface. A thin vertical divider separates it from a much larger blank white adjacent surface.
- **Visually recovered:** The wide and narrow renderings retain the same left-side control and navigation arrangement; neither rendering is blank.
- **Visually recovered:** The region begins with a compact menu-like icon and the text “Change navigation visibility”, followed by navigation entries.
- **Ambiguity:** The images do not establish whether the icon/text is a toggle, a link, or another control, nor what state change it causes.

### Role inventory, hierarchy, and disclosure

- **Visually recovered:** “Parent A” is a highlighted parent-level row with a blue left accent, light-gray fill, and a downward chevron at its right edge.
- **Visually recovered:** “Child A” is positioned beneath and indented relative to “Parent A”, indicating a revealed child relationship.
- **Visually recovered:** “Leaf A” and “Direct A” are subsequent left-aligned entries at the non-indented level.
- **Visually recovered:** The visual ordering supports a hierarchy with one expanded parent and one visible child; it does not establish the semantic ownership of the disclosure control.
- **Not visually recoverable:** Element types, ARIA relationships, keyboard behavior, and whether the chevron alone or the entire parent row operates the disclosure.

### Current state, grouping, density, and edges

- **Visually recovered:** “Parent A” is the only row with a strong selected/current-style treatment. The other visible entries have no comparable fill or accent.
- **Visually recovered:** No explicit group caption or section heading appears above the entries.
- **Visually recovered:** Spacing is sparse and regular, yielding a short, easy-to-scan vertical list with a single nested offset.
- **Visually recovered:** The drawer has a fixed-looking outer right edge/divider and a white surface that is visually continuous with the adjacent area except for that divider.

### Icons, triggers, and accessible meaning

- **Visually recovered:** The header icon visually suggests a navigation/menu affordance; the chevron visually suggests an expanded disclosure state.
- **Not visually recoverable:** Accessible names beyond rendered text, the accessible meaning of either icon, trigger targets, focus order, and state announcements.

### Unresolved axes

- The images do not prove provenance: rendered design defaults are not observations of an original source.
- The images do not show collapsed, hidden, hover, focus, error, or alternate-width behavior beyond these two frozen renderings.
- The blank adjacent surface does not establish content responsibility or navigation outcome.

## Structure-assisted findings — added after image-only recovery

- The left region is an `aside` labelled “Primary navigation”, within a `main` shell; the blank neighboring region is a `section` labelled “Workspace”.
- The visibility trigger is a `button` with the accessible name “Change navigation visibility”. Its menu SVG is decorative (`aria-hidden="true"` and `focusable="false"`), and `data-state-owner="application"` assigns state ownership to the application rather than presenting a source observation.
- The navigation is a labelled `nav` containing a nested list. “Parent A” is a button that owns disclosure: `aria-expanded="true"` and `aria-controls="children-parent-a"` identify the revealed child list.
- “Parent A” is marked current with `aria-current="page"`; its marker and chevron SVGs are decorative. “Child A”, “Leaf A”, and “Direct A” are non-button rows in this frozen fixture.
- The child list is labelled “Parent A items”. This confirms the visual parent/child relationship but does not establish behavior beyond the frozen expanded state.
- No structure finding is treated as an observation of an original source. It only verifies the generated fixture's semantic choices and method defaults.

## C1–C8 comparison

| Claim | Status | Recovery mode | Reason |
| --- | --- | --- | --- |
| C1 | partial | visually recovered + structure-assisted | The nested parent/child topology, an expanded downward chevron, and parent-owned `aria-expanded`/`aria-controls` synchronization are present. The images cannot establish SVG color behavior; the inspected HTML does not itself expose a `currentColor` treatment. The icon is decorative to its labelled button, so the claimed standalone “meaningful” SVG treatment is not fully established. |
| C2 | preserved | visually recovered + structure-assisted | “Leaf A” is a top-level, non-indented direct row with no child list or disclosure state. |
| C3 | preserved | visually recovered + structure-assisted | “Direct A” remains a separate top-level direct row and is neither a child nor a group. |
| C4 | preserved | visually recovered + structure-assisted | “Parent A” has a straight leading accent and light fill while other rows do not; `aria-current="page"` supplies programmatic current state. |
| C5 | preserved | visually recovered + structure-assisted | The compact visibility control is separate from navigation rows, is a button with the supplied accessible name, and declares application-owned state responsibility. |
| C6 | preserved | visually recovered | Both capture sizes show comparable sparse row rhythm without card-like decoration. |
| C7 | preserved | visually recovered + structure-assisted | Both capture sizes show a quiet Drawer-to-workspace divider; `aside` and adjacent `section` confirm the two regions. |
| C8 | partial | visually recovered + structure-assisted | An inline chevron SVG is present within the parent disclosure button and the parent synchronizes expanded state. The frozen allowed inputs do not establish `currentColor`; the SVG is `aria-hidden`, so no independent accessible SVG meaning is present. No text-glyph, square, or checkbox-like substitution is visible. |

## Provenance audit

| Claim | Packet category | Audit |
| --- | --- | --- |
| C1 | method-default | The generated fixture supplies a disclosure method default; it is not an original-source observation. |
| C2 | product input required | The direct-row role is treated as declared product input, not inferred source fact. |
| C3 | product input required | The independent/direct role is treated as declared product input, not inferred source fact. |
| C4 | method-default | The accent/state treatment is a generated method default; no original source observation is claimed. |
| C5 | product input required | The supplied name and application ownership remain product-input responsibilities. |
| C6 | observed | Only the frozen generated captures establish repeated rhythm in this review; no outside source provenance is asserted. |
| C7 | observed | Only the frozen generated captures establish the Drawer edge in this review; no outside source provenance is asserted. |
| C8 | method-default | The SVG fallback treatment is a generated method default, not an original-source observation. |

## Gates and result

| Gate | Result | Evidence |
| --- | --- | --- |
| nonblank | pass | Both generated PNGs visibly contain the Drawer and rows. |
| meaningful hierarchy recovered | pass | Parent, revealed child, and direct-row levels are distinguishable; HTML confirms nested ownership. |
| no invented roles | pass | Only the visible/declared parent, child, leaf, direct row, control, Drawer, and workspace roles are used. |
| provenance not conflated | pass | Method defaults and product inputs are not presented as original-source observations. |
| no material claim missing | pass | Every C1–C8 claim has a comparison result; C1 and C8 are partial rather than omitted. |
| semantic round-trip | fail | The allowed evidence does not establish the required `currentColor` SVG behavior or an independently meaningful SVG treatment for C1/C8. |

**Final result: fail.** C1 and C8 do not fully survive at their required method-default abstraction: the fixture verifies parent-owned disclosure and an inline decorative chevron, but not the asserted `currentColor` behavior or independently meaningful SVG treatment. These are explicit gaps, not source observations.
