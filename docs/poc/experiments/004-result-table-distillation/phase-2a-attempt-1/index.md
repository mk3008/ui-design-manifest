# Phase 2A extraction bundle

This directory records a new extraction pass for the bounded read-only operational-table experiment. It separates the source-blind application input from extraction-only analysis.

- [Source-blind manifest](source-blind-manifest.md) — the only artifact suitable for a later application packet.
- [Source-aware extraction trace](source-aware-extraction-trace.md) — extraction/evaluation-only; never supply it to an implementer.
- [Abstraction decisions](abstraction-decisions.md) — explains what was retained, generalized, or excluded.
- [Information-loss record](information-loss.md) — classifies unavailable or intentionally omitted detail.

The historical experiment artifacts remain outside this directory and are not changed by this pass.
