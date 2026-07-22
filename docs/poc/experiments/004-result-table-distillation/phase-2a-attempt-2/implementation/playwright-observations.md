---
title: "Playwright observation provenance"
status: "recorded"
---

# Playwright Observation Provenance

This record preserves the evidence-bearing parts of the transient `.playwright-cli/`
directory created during the isolated initial implementation. It is not an input to
the implementation and does not alter the fixed HTML, CSS, or images.

## Origin and purpose

- Origin: local Playwright rendering of the fixed initial implementation over a
  temporary localhost server.
- Purpose: record the accessibility tree observed for the wide and narrow render
  and the only browser-console warning.
- Access boundary: `http://127.0.0.1:8765` was a temporary local server, not an
  external source.

## Preserved observations

| Original transient file | SHA-256 | Preserved evidence |
| --- | --- | --- |
| `console-2026-07-21T23-43-01-214Z.log` | `986B88AAE85E3FA5BF3AD3D91CB3CC1C20EA371E12B180237ABDE3F0E47E614D` | A `404` for the browser-requested `/favicon.ico`; no application-resource error. |
| `console-2026-07-21T23-43-07-087Z.log` | `C22BD85F35759B99F5D7BE8085AFECEA1A342E5CA329B9DFFC7F297FF1A0B9A4` | The same browser-requested `/favicon.ico` `404`; no application-resource error. |
| `page-2026-07-21T23-43-01-509Z.yml` | `ABDEC4427A5A61D963B27E446B73805151E7FFD59E389E52E202FCC8B6AD6209` | Accessibility tree: one read-only table, four headers, and three rows with empty State/Summary cells. |
| `page-2026-07-21T23-43-07-155Z.yml` | `ABDEC4427A5A61D963B27E446B73805151E7FFD59E389E52E202FCC8B6AD6209` | The same accessibility-tree structure for the second viewport. |

The complete page-tree facts are also recorded in the Implementer report at
`C:\tmp\orchestration\ui-design-manifest-phase-2a-experiment-004\reports\implement-004-phase-2a-attempt-1.yaml`.
