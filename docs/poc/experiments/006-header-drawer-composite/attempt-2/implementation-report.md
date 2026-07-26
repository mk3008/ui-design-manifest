---
type: Pattern A capture record
title: Isolated static capture
description: Capture provenance for the two fixed evidence-reconnection artifacts.
status: frozen
source: authored
---

# Capture

The implementation used only
[source-blind-implementation-input.md](source-blind-implementation-input.md).
Google Chrome `150.0.7871.184` captured the two direct local `file:` URI states
at `1280 x 720` CSS pixels using
[implementation/capture.ps1](implementation/capture.ps1). Each state uses a
separate temporary browser profile so one capture cannot inherit state from the
other.

The raw-byte digests, capture command, implementation bundle digest, and stable
artifact IDs are fixed in [artifact-manifest.yaml](artifact-manifest.yaml).
The captures are static comparison evidence only. They do not prove activation,
ARIA, keyboard, focus, Escape, assistive technology, animation, persistence,
or responsive behavior.
