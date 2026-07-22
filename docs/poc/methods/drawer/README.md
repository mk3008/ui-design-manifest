# Drawer distillation method

## Boundary

This is extraction and evaluation method material, not a standard application input. Source observations, captures, correction logs, and evidence matrices may be used only in the test context. A resulting manifest or application packet must contain only source-independent abstractions and must report gaps rather than direct an implementer back to these materials.

This method extracts a primary navigation drawer as a bounded UI region. It is intentionally narrower than a page or application-shell extraction.

## Use

1. Record source evidence in the [evidence matrix](evidence-matrix.md).
2. Apply the [extraction prompt](drawer-extraction-prompt.md) with the [extraction template](drawer-extraction-template.md).
3. Evaluate the first pass and the semantic round trip with the [rubric](drawer-first-pass-rubric.md).
4. Record material human corrections in the [correction log](drawer-correction-log.md).

The method separates component/control, component layout, region composition, and accessibility. Drawer visibility is recorded through four independent axes: presentation, closed representation, toggle location, and persistence. Unobserved values remain unknown.

## Semantic round-trip gate

Before reconstruction, turn every kept Contract statement into a semantic claim matrix. The matrix identifies the required visual intent claim, its source-to-Manifest trace, its allowed source-blind fixture slot (if any), and the generated evidence needed to exercise it. It is a completeness review, not a request to fill unknowns by convention: a required observed relationship may be omitted only with a recorded justification that says why it is out of scope or cannot safely be exercised.

After generating static evidence, a reviewer who sees only the generated evidence and the matrix re-extracts the exercised claims. Compare that re-extraction with the matrix by semantic role and relationship, not pixels. The result fails if a required claim is contradicted, if an omission has no justification, or if no meaningful scoped Drawer relationship is exercised. A blank region that preserves only a navigation/workspace boundary therefore cannot pass as a successful Drawer reconstruction.

Fixtures used to exercise claims must be source-blind. They may use only declared semantic slots and neutral values (for example, a generic destination name or neutral state token); they must not reproduce source copy, product identity, item count, hierarchy shape, geometry, colors, icons, or runtime behavior. A fixture demonstrates that a declared relationship can render; it does not supply missing product requirements.

## Human review packet

Human review of a reconstruction must include a bounded, read-only display of the external source oracle next to the generated static evidence. An opaque ID and digest alone are not sufficient for visual review. Keep that display outside the repository and outside every source-blind Manifest and Implementer allowlist; it is evaluation-only material. The packet must also include the completed semantic claim matrix, the generated-evidence re-extraction, and a pass/fail gate result. It must identify which rendered claims are exercised, not exercised, or unresolved, so a blank or omission-only output is not mistaken for successful reconstruction.

The accepted calibration and cross-site holdout are recorded in [Experiment 002](../../experiments/002-drawer-distillation/README.md).
