# Global Header distillation method

## Boundary

This is extraction and evaluation method material, not a standard application input. Source observations, captures, correction logs, and evidence matrices may be used only in the test context. A resulting manifest or application packet must contain only source-independent abstractions and must report gaps rather than direct an implementer back to these materials.

This method extracts a product-wide Global Header as a bounded UI region. It is narrower than a complete application shell and excludes project context, local navigation, Drawer contents, and page content.

## Use

1. Record source evidence in the [evidence matrix](header-evidence-matrix.md).
2. Apply the [extraction prompt](header-extraction-prompt.md) with the [extraction template](header-extraction-template.md).
3. Evaluate the first pass with the [rubric](header-first-pass-rubric.md).
4. Record material human corrections in the [correction log](header-correction-log.md).

The method preserves observation class and unknowns. It records only coarse role order and material visual roles, not source labels, implementation details, measurements, exhaustive colors, or unobserved responsive and interaction behavior.

The Header–Drawer seam is explicit: Header owns a visible Drawer trigger's placement, treatment, and accessible name; Drawer owns its content, presentation, closed representation, visibility state, and persistence. A Header trigger establishes `outside-drawer` toggle location only when that relationship is visibly supported in the same context. Trigger absence or presence is contextual and must not be inferred across contexts.

The accepted calibration and cross-site holdout are recorded in [Experiment 003](../../experiments/003-header-distillation/README.md).
