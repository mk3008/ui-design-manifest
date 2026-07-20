# Drawer distillation method

This method extracts a primary navigation drawer as a bounded UI region. It is intentionally narrower than a page or application-shell extraction.

## Use

1. Record source evidence in the [evidence matrix](evidence-matrix.md).
2. Apply the [extraction prompt](drawer-extraction-prompt.md) with the [extraction template](drawer-extraction-template.md).
3. Evaluate the first pass with the [rubric](drawer-first-pass-rubric.md).
4. Record material human corrections in the [correction log](drawer-correction-log.md).

The method separates component/control, component layout, region composition, and accessibility. Drawer visibility is recorded through four independent axes: presentation, closed representation, toggle location, and persistence. Unobserved values remain unknown.

The accepted calibration and cross-site holdout are recorded in [Experiment 002](../../experiments/002-drawer-distillation/README.md).
