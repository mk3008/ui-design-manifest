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
| Five required fields and optional Notes | pass | pass | pass |
| Required marker is in each required label and uses error foreground | pass | pass | pass |
| No asterisk legend or capability-style format copy | pass | pass | pass |
| Unboxed field group on the host content surface | pass | pass | pass |
| No horizontal rule below the group heading | pass | pass | pass |
| Date, phone, and email validation implementation | pass | pass | pass |
| Empty Save shows summary plus field-associated errors | pass | pass | pass |
| Save does not persist or navigate | pass | pass | pass |
| Form toolbar uses logical-end alignment | pass | pass | pass |
| Fixed shell, local assets, Light/Dark and Drawer states | pass | pass | pass |

The static attempt check passed for all three runs and twelve 1440x1200
captures. Direct browser exercise at a temporary local HTTP origin confirmed
that an empty Save keeps the URL unchanged and exposes five invalid required
fields, their inline messages, and a linked error summary in every run.

The only browser-console message was the expected temporary-server 404 for
`favicon.ico`; no application error was observed.

## Commands and results

| Command | Result |
| --- | --- |
| `node --check runs/run-N/app.js` | 3/3 passed |
| `capture-evaluation.ps1` | 12 PNGs captured; normal headless Chrome path, no SwiftShader fallback |
| `check-customer-create-common-shell-variability-attempt5.ps1` | passed |
| `check-business-workflow-standard-pack.ps1` | passed |
| `check-source-boundaries.ps1` | passed |
| `git diff --check` | passed |

## Scope

The pages are evaluation artifacts. They do not add a runtime, persistence,
new configuration, or product routing behavior.
