# Run 1 — customer search showcase

This is a static, dependency-free Japanese customer-search showcase for the
variability experiment. It uses an internal in-memory fixture only; it makes no
network request and contains no external assets.

## Fixture

The fixed fictional fixture is reproduced below. Every record contains exactly
Customer ID, Name, Date of birth, Address, Phone number, Email address, and
Notes. All email addresses use the `.test` domain.

| ID | Name | Date of birth | Address | Phone number | Email | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| C-000101 | 佐藤 花子 | 1988-04-12 | 東京都千代田区丸の内1-1-1 | 03-5555-0101 | hanako.sato@example.test | Initial inquiry recorded. |
| C-000102 | 鈴木 一郎 | 1979-11-03 | 神奈川県横浜市西区みなとみらい2-2-2 | 045-555-0102 | ichiro.suzuki@example.test | Preferred contact: email. |
| C-000103 | 高橋 美咲 | 1992-07-19 | 埼玉県さいたま市大宮区桜木町3-3-3 | 048-555-0103 | misaki.takahashi@example.test | Follow-up scheduled. |
| C-000104 | 田中 健 | 1985-02-28 | 千葉県千葉市中央区新町4-4-4 | 043-555-0104 | ken.tanaka@example.test | Address confirmed. |
| C-000105 | 伊藤 彩 | 1990-09-08 | 東京都新宿区西新宿5-5-5 | 03-5555-0105 | aya.ito@example.test | No additional notes. |
| C-000106 | 渡辺 大輔 | 1976-05-24 | 茨城県水戸市中央6-6-6 | 029-555-0106 | daisuke.watanabe@example.test | Phone confirmation requested. |

Search filters Name, Date of birth, Phone number, and Email address in memory.
Clear restores all six records. Create, Save, and Delete deliberately do not
persist a change and say so only after the corresponding action.

## Applied standard-pack choices

- The Header owns the Drawer toggle; the open Drawer is a distinct left
  navigation region with a restrained current-item accent.
- Conditions precede results. Search is primary and Clear is secondary.
- The Result grid keeps the frequent row operation, Detail, with its record.
  It deliberately has no selection or sort model.
- Detail uses one compact description-list surface. Create and Edit use a
  single labelled input flow with a persistent footer action region; the
  editable record ID remains visible but read-only.
- Delete is an explicit confirmation with a safe Cancel action.
- CSS uses the canonical Light palette values from the business-app standard
  pack. The capture starts in Light mode with no theme control because the
  supplied showcase state fixes that mode.

## Capture

Run `./capture.ps1` from this directory. It captures the required default
Search view at `1440x1200`, Drawer open, no conditions, all six records, and
no transient message. The script uses Chrome's normal headless command first,
then retries exactly once with SwiftShader only if that first command fails.
