# Search/list standard-pack Phase 2 contract calibration

## Status and boundary

- Phase 2 baseline SHA: `f87f3a98628b1a8d75a7d8165de127ba01ddae42`
- Current branch and HEAD at final verification: `main` / `f87f3a98628b1a8d75a7d8165de127ba01ddae42`
- Worktree state: uncommitted. The baseline and HEAD are identical; all listed work is working-tree content.
- Limitation: Phase 1 and Phase 2 changes cannot be separated by a commit boundary. This report identifies the Phase 2-targeted files by purpose, not by a distinct Git diff.
- Existing working-tree context: `record-detail.md` and `flows/list-to-detail.md` are pre-existing Phase 1 artifacts relative to this closure request. They are retained untouched because resetting or restructuring the dirty tree is prohibited; this closure adds no Header, Drawer, or screen-pattern file.
- Distribution boundary: this report is PoC/evaluation evidence outside `templates/business-app/design-manifest/`; it is not part of the distributable standard pack.
- Scope: the existing search/list slice only. Header, Drawer, new screen patterns, runtime behavior, and generic validation are not introduced.

## Target files and final-tree digests

Digests below are SHA-256 of UTF-8 text after normalizing CRLF to LF. This makes the evidence stable across Git worktrees with different `core.autocrlf` materialization; it is not a raw-byte hash.

| File | SHA-256 | Purpose |
| --- | --- | --- |
| `templates/business-app/README.md` | `525E87B8E7C8A496C3FD7D4A3372309744ACE74B837BB9DF7433B22FE0C1E46A` | Pack boundary, human maintenance path, and three cases. |
| `templates/business-app/calibration.md` | `6A26C26BA72ADF16216495EA97A8B1C3D4CB0A32C4BFAF1D5A335C1F79C40739` | Case, classification, and combination evidence. |
| `templates/business-app/design-manifest/configuration/record-list-options.md` | `48B0255FC824BA385365B1FEE48599372AE43527AEFD79766DCA95DEE1570DEA` | Sole configuration authority, binding invariants, compatibility, and default rationale. |
| `templates/business-app/design-manifest/manifest.md` | `111E6AB3115A31AD4F957BC322FF587D396C14B742368165F1583D5C095E9F99` | Pack identity. |
| `templates/business-app/local-overrides/record-list-default.yaml` | `CB9A28A9BD377FD76485C10041AB35908BAE83D54E118A0053B3EDC643C969D3` | Default-value fixture. |
| `templates/business-app/local-overrides/record-list-alternate.yaml` | `28E3138D1F7DE033BDC5333C265246EE77FDCFCB8CE21D134DD66CA6CF31485B` | Valid whole-value override fixture. |
| `templates/business-app/product-bindings/record-list.example.yaml` | `0E7BD0385AE1BCBA8AC4B6C1F89619D387F05868BB3599A88FF0594D25E7E1B6` | Full-capability binding with available detail destination. |
| `templates/business-app/product-bindings/record-list-limited.example.yaml` | `8F2B2B39426BC36BD0F33A1A25FC0F3429F2317894EDFDED435022CF624B2670` | Limited-capability binding. |
| `tests/check-business-app-standard-pack.ps1` | `E46E66BFDEB067FDCF6445297F5009BE1AF5420B06ED10A4B786FCFE4E976400` | Bounded static acceptance and rejection checks. |

The report is intentionally not self-hashed because changing a self-hash changes the report.

## Three calibration cases

All cases use the same fixed Markdown concepts: Search Conditions, Result Grid, Pagination, Record List, and Record-list Options.

| Case | Override | Binding | Resolved/effective outcome |
| --- | --- | --- | --- |
| A — defaults | none | `record-list.example.yaml` | `end`, `[search, clear]`, `end`, `summary`, `link`; all dependent capabilities are exercised. |
| B — valid local difference | `record-list-alternate.yaml` | `record-list.example.yaml` | `start`, `[clear, search]`, `start`, `hidden`, `button`; only finite presentation values change. |
| C — limited capability | none | `record-list-limited.example.yaml` | Resolved order `[search, clear]` filters to effective `[search]`; pagination, count summary, and row action are not exercised. |

## Configuration classification and resolution

| Setting | Classification | Default | Binding dependency / resulting effect |
| --- | --- | --- | --- |
| `search_actions_region` | keep | `end` | Requires an available search group; changes only logical placement. |
| `search_action_order` | keep | `[search, clear]` | Filters unavailable semantic actions while preserving selected order. |
| `pagination_region` | keep | `end` | Not exercised when pagination is unavailable. |
| `result_count_presentation` | keep | `summary` | Not exercised when aggregate/meaning is unavailable; `hidden` remains intentionally hidden. |
| `row_action_presentation` | keep | `link` | Not exercised when `open_record` is false; never creates an operation or destination. |

The definition retains defaults for omitted keys, replaces whole scalar/array values, rejects `null`, rejects empty arrays, rejects unknown IDs and values, and rejects multiple selected overrides rather than assigning precedence. Overrides cannot target fixed Markdown or product-binding capabilities.

## `open_record` invariant

When `open_record: true`, the binding must have a non-empty `destination_reference` and `destination_available: true`; a missing, blank, unresolved, or unavailable destination rejects before resolution. When false, row-action presentation is not exercised and configuration cannot recreate the capability. Route/URL syntax remains product-owned and unspecified.

## Bounded negative inputs

The existing static script keeps all test data in memory and is limited to the five search/list settings.

| Input | Expected handling | Test result |
| --- | --- | --- |
| `open_record=true` without destination | reject | rejected |
| `open_record=true` with unavailable destination | reject | rejected |
| unknown setting ID | reject | rejected |
| enum value `left` | reject | rejected |
| action order containing `unknown` | reject | rejected |
| two selected override objects | conflict reject | rejected |
| `null` override | reject | rejected |
| empty action-order array | reject | rejected |
| duplicate override ID fixture | reject | rejected |
| fixed Markdown override target | reject | rejected |
| product-binding override target | reject | rejected |

Case C is the positive capability-absence check: `clear=false` filters Clear, `pagination=false` omits pagination, `aggregate=false` omits count summary, and `open_record=false` omits row actions.

## Verification

| Command | Exit code | Result |
| --- | ---: | --- |
| `tests/check-business-app-standard-pack.ps1` | 0 | 3 positive contract cases and 11 negative contract cases passed. |
| all `tests/*.ps1` | 0 | 8 existing PowerShell checks passed; no failures. |
| `tests/check-source-boundaries.ps1` | 0 | Source-boundary check passed. |
| Python YAML/link audit | 0 | 11 Markdown front matters, 4 YAML examples, 47 local links, 0 broken links. |
| `git diff --check` | 0 | No whitespace errors; Git emitted existing LF→CRLF warnings for tracked files. |

Skipped / unconfirmed: browser or real-UI execution, generic validator behavior, external consumer integration, and product-route validity beyond the binding's explicit availability declaration.

## Initial independent review and correction

The first independent review found one P1 and two P2 items: undefined Case C partial-order handling, undecidable compatibility, and weak static evidence. The corrections were: ordered capability filtering, exact 0.x identity equality, and bounded case assertions. The final-closure changes additionally added the detail-destination invariant, negative inputs, default rationale, and this durable evidence record.

## Final independent re-review

A fresh read-only Codex task re-reviewed the corrected final snapshot after the earlier reviewer found the CRLF-sensitive assertion and raw-byte digest issues.

| Review item | Result |
| --- | --- |
| Verdict | `pass_with_p2_observations`; no P0 or P1 findings. |
| Static contract test | Passed: 3 positive and 11 negative cases. |
| Invariant and capability boundary | Confirmed: missing/unavailable detail destinations reject; configuration does not add a destination or capability. |
| Default rationale | Confirmed for all five settings; explicitly pack-specific rather than universal. |
| Final-tree digests | All 9 LF-normalized SHA-256 values matched independently. |
| Scope | No Header/Drawer, runtime, generic validator, DSL, external integration, Slack, or monitor was found in the Phase 2 surface. Existing untracked Phase 1 artifacts remain reported as untouched. |

P2 observations: the reviewer worktree was detached even though its HEAD matched the stated base, and the historical provenance of the existing untracked Phase 1 files cannot be independently proven from the base commit. This report's `main` branch claim refers to the final verification in the primary worktree, not the reviewer worktree.

## Header / Drawer decision

Do not begin Header or Drawer work. The search/list contract is deliberately bounded, and no evidence here establishes reusable Header/Drawer semantics.
