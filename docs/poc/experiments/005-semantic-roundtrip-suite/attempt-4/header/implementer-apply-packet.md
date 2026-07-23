---
type: Implementer Apply Packet
title: Header static implementation packet
description: Strict source-blind allowlist and output contract for a later isolated implementation.
status: draft
source: authored
---

# Allowed inputs

Read only [manifest](manifest.md), [application input contract](application-input-contract.md), [fixture trace](fixture-trace.md), [claim matrix](claim-matrix.md), and [implementer prompt](implementer-prompt.md). Do not access any source image, source-aware record, historical attempt, URL, external search, or remembered source vocabulary.

# Output contract

Write exactly these files under `implementation/`: `index.html`, `styles.css`, `wide.png`, `narrow.png`, and `implementation-report.md`. Do not add files or dependencies.

# Failure gates

Reject blank or visually contentless output; missing identity title; conflated search and utility roles; page-local context; a text-glyph or placeholder icon; invented Drawer target, side, state, or behavior; source leakage; or a static output whose re-extraction cannot recover H1 through H4 and H6.

# Implementation report

The report must list opened files, assumptions, gaps, fixture and guidance trace, unsupported invention declaration, prohibited-input declaration, input and output digests, rendering/build/test results, and claim exercise status. State unresolved Drawer semantics explicitly.
