# Source UI input specification

## Purpose

This specification bounds how extraction receives and observes a source UI. It applies to extraction and evaluation evidence only. It does not change the source-blind Manifest or normal application input boundary.

## Formal input forms

`source_ui` may be supplied as one or more of:

- URL
- single image
- image set
- recording
- local build

The extraction request also declares the screens, viewports, roles, states, and interactions in scope. The extractor records which input forms it used and the visual scope it observed outside the Manifest.

## Selection and observation rules

Images are formal, preferred inputs. If a supplied image or image set establishes the visual scope needed for the request, it is sufficient; do not access a supplied URL merely because one exists.

Use a recording or local build only for the declared visual scope. A URL is a last scoped observation input when the supplied visual material is insufficient. URL observation must be minimal: do not crawl, scrape, broadly traverse, bulk-capture DOM/CSS, or extract values. Do not inspect undeclared routes, roles, states, or data.

## Observable facts and gaps

Extract hierarchy, relationships, density, grouping, reading order, relative importance, and responsibility boundaries only where the declared visual input establishes them. Do not infer an operation, focus behavior, update condition, responsive change, or transition that the supplied visual scope does not visibly establish.

When a necessary fact is absent, preserve it as unresolved and request the smallest additional visual input that could decide it. Examples include a second viewport image for responsive behavior, a state image for a changed condition, or a bounded recording for a visible sequence. Do not substitute DOM/CSS inspection, source values, or broad URL exploration for that missing input.

## Evidence and Manifest boundary

Extraction/evaluation evidence records the input modality, non-identifying provenance reference, declared scope, observed visual scope, unresolved facts, and additional-input requests. A source-blind Manifest must not contain source modality, provenance references, URLs, capture paths, screenshots, source values, or links to this evidence. See the [extraction prompt](../../prompts/extract-from-existing-ui.md) and the [profile boundary](../../profile/ui-profile.md#extraction-source-inputs-and-observation-boundary).
