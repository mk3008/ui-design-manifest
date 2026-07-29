# Evaluation

## Fixed conditions

- Manifest snapshot: 44 files under `consumer-input/design-manifest/`
- Fixed shell: common-shell experiment 012, attempt 3, Run 1
- Fixed prompt: `consumer-input/user-prompt-ja.md`
- Model: `gpt-5.6-terra`, reasoning effort `medium`
- Capture: Chrome `150.0.7871.187`, `1440x1200`, `--headless=new --disable-gpu`
- Fallback: not used for any of the 12 captures

## Observed comparison

| Rule under test | Run 1 | Run 2 | Run 3 |
| --- | --- | --- | --- |
| Customer ID omitted as an input control | observed | observed | observed |
| Five required fields and optional notes field | observed | observed | observed |
| Date, phone, and email format validation implemented | observed | observed | observed |
| Field-associated validation messages and summary | observed | observed | observed |
| Empty required-field submit exposes errors without persistence | observed in browser | observed in browser | observed in browser |
| Save action is visible and has no persistence, request, or navigation implementation | observed | observed | observed |
| Fixed common Header/Drawer and light/dark states | observed | observed | observed |

## Browser validation exercise

Each light, Drawer-open page was opened through a local temporary HTTP server.
Clicking Save with empty required fields kept the page URL unchanged, displayed
an error summary, marked each required field invalid, and displayed an
associated field message. The only browser console error was the local
server's missing `favicon.ico` request; no page-script error was observed.

The three generated pages are evidence for this frozen snapshot. See
`capture-record.json` for raw-byte PNG identity records.
