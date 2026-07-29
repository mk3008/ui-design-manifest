---
type: PoC experiment contract
title: Customer search showcase variability experiment
status: implemented-awaiting-comparison-review
source: authored
baseline_commit: 28d7f788cc888cadf8cf1d889a5dadcfb3dbeef8
---

# Purpose

Measure the visual and structural variation produced by three independent
implementations from the same business-app standard pack and the same fixed
customer-search brief. This is a showcase experiment, not a change to the
standard pack.

## Generation matrix

| Item | Fixed value |
| --- | --- |
| Model | `gpt-5.6-terra` |
| Reasoning effort | `medium` |
| Independent implementations | 3 |
| Shared implementation input | This contract and the current committed standard pack at `baseline_commit` |
| Run directories | `runs/run-1`, `runs/run-2`, and `runs/run-3` |

The three implementations are an observed sample of this execution surface,
not a benchmark of every possible Terra response. They do, however, show which
parts of the manifest currently leave room for materially different UI output.

# Fixed input

## Application subject

The sample is a Japanese customer-search application. It has no external
network, image, font, database, authentication, route, persistence, or real
customer data.

## Customer record

Every record uses exactly these fields:

| Field | Rule |
| --- | --- |
| Customer ID | Internal sequential identifier; visible but never editable. |
| Name | Editable customer name. |
| Date of birth | Editable date value. |
| Address | Editable address value. |
| Phone number | Editable phone number. |
| Email address | Editable email address. |
| Notes | Editable long-form notes. |

The fixed internal fixture contains these six fictional records. All email
addresses use the `.test` domain.

| Customer ID | Name | Date of birth | Address | Phone number | Email address | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| C-000101 | 佐藤 花子 | 1988-04-12 | 東京都千代田区丸の内1-1-1 | 03-5555-0101 | hanako.sato@example.test | Initial inquiry recorded. |
| C-000102 | 鈴木 一郎 | 1979-11-03 | 神奈川県横浜市西区みなとみらい2-2-2 | 045-555-0102 | ichiro.suzuki@example.test | Preferred contact: email. |
| C-000103 | 高橋 美咲 | 1992-07-19 | 埼玉県さいたま市大宮区桜木町3-3-3 | 048-555-0103 | misaki.takahashi@example.test | Follow-up scheduled. |
| C-000104 | 田中 健 | 1985-02-28 | 千葉県千葉市中央区新町4-4-4 | 043-555-0104 | ken.tanaka@example.test | Address confirmed. |
| C-000105 | 伊藤 彩 | 1990-09-08 | 東京都新宿区西新宿5-5-5 | 03-5555-0105 | aya.ito@example.test | No additional notes. |
| C-000106 | 渡辺 大輔 | 1976-05-24 | 茨城県水戸市中央6-6-6 | 029-555-0106 | daisuke.watanabe@example.test | Phone confirmation requested. |

## Search

The search form contains exactly these conditions: Name, Date of birth, Phone
number, and Email address. Search and Clear filter or reset the in-memory
fixture only. The default state has no entered condition and shows all six
records.

## Required screen states

The sample must provide:

1. A global Header and a navigation Drawer that can be visibly opened and
   closed in the browser.
2. Customer search with the four fixed conditions, Search and Clear, and a
   result grid backed by the in-memory fixture.
3. Customer read view.
4. Customer create view. Its Save action must not persist data.
5. Customer edit view. Customer ID is non-editable; Save must not persist
   data.
6. Customer delete confirmation. Delete must not persist data.

The interface may switch among these views within one static page. It must
not claim that a create, edit, or delete action completed.

## Fixed visual capture state

Capture one `1440x1200` PNG of the default Search view with the Drawer open,
Light mode, empty conditions, all six results, and no transient message. The
capture is used only to compare variation among runs.

## Standard-pack application

Use the current business-app standard pack as guidance, especially the Drawer,
Result Grid, Record fields, Record read/create/edit/delete, Breadcrumb,
Confirm, and Color/theme guidance. Use the canonical Light palette with no
local override. Do not add configuration, runtime infrastructure, a validator,
DSL, or a new design system.

# Deliverable shape for each run

Each run writes only to its assigned `runs/run-N/` directory and contains:

- `index.html`, `styles.css`, and `app.js`;
- `README.md` describing the fixed fixture and the applied standard-pack
  choices;
- `capture.ps1` using the explicit Chrome path, `--headless=new --disable-gpu`,
  and one SwiftShader retry only after failure; and
- `search-default.png`, captured from the fixed visual capture state.

No external CDN, image, font, script, or network request is permitted.

# Comparison criteria

Compare the three runs without identifying the generating run until after the
initial review. Record only observable differences:

- Header and Drawer responsibility and open/closed treatment;
- search-form density, control alignment, and action placement;
- result-grid density, column treatment, selection, sorting, and row action;
- read/create/edit/delete hierarchy and non-persistence clarity;
- adherence to the fixed fields and fixture;
- external-reference count and capture success; and
- deviations that require a stronger manifest constraint.

# Scope boundary

This experiment produces a product-description showcase and comparative
evidence. The HTML/PNG are illustrative and non-normative. The maintained
source of truth remains `templates/business-app/design-manifest/` and its
tests.
