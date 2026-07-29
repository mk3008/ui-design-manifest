# Evaluation

## Inputs and execution

All three implementations used only the frozen 44-file manifest snapshot, the
same fixed common-shell input, and the unchanged Japanese product-facts-only
prompt. The implementations were independent `gpt-5.6-terra` runs at `medium`
reasoning effort.

## Observed outcomes

| Check | Run 1 | Run 2 | Run 3 |
| --- | --- | --- | --- |
| Customer ID omitted as an input | pass | pass | pass |
| Required fields and optional Notes | pass | pass | pass |
| Error-colored per-label required markers, no legend | pass | pass | pass |
| Action-oriented Japanese format help | pass | pass | pass |
| Unboxed host-surface field flow | pass | pass | pass |
| Date, phone, and email validation implementation | pass | pass | pass |
| Empty required field shows its error on blur | pass | pass | pass |
| Save validates the full form and shows a linked summary | pass | pass | pass |
| Invalid field re-evaluates during correction | pass | pass | pass |
| Save does not persist or navigate | pass | pass | pass |
| Local assets, fixed shell, Light/Dark, and Drawer states | pass | pass | pass |

Direct browser exercise at a temporary local HTTP origin focused the empty
Name field and moved focus to Birth date. Each run immediately exposed Name's
inline required error before Save. In Run 3, entering a name after that error
cleared Name's invalid state during input. Browser console output contained
only the expected temporary-server 404 for `favicon.ico`; no application error
was observed.

## Commands and results

| Command | Result |
| --- | --- |
| `node --check runs/run-N/app.js` | 3/3 passed |
| `capture-evaluation.ps1` | 12 PNGs captured; normal headless Chrome path, no SwiftShader fallback |
| `check-customer-create-common-shell-variability-attempt7.ps1` | passed |
| `check-business-workflow-standard-pack.ps1` | passed |
| `check-source-boundaries.ps1` | passed |
| `git diff --check` | passed |

## Scope

The pages are evaluation artifacts. They do not add a runtime, persistence,
new configuration, or product routing behavior.
