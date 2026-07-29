# 固定共通シェルを使う顧客検索テスト（検索条件・ページネーション調整後）: Terra medium 3回

## 生成条件

- Model: `gpt-5.6-terra`
- Reasoning effort: `medium`
- Runs: `3`

## デフォルトManifest

このテストで使用した入力は、[デフォルトManifestのsnapshot](consumer-input/design-manifest/manifest.md)と、[再利用した固定共通シェル Run 1](consumer-input/common-shell-run-1/index.html?drawer=open&theme=light)です。

## 使用プロンプト全文

> 既存の共通シェルを再利用して、顧客検索の静的HTMLを作成してください。
>
> - `common-shell-run-1/` は固定された共通Header／Drawerの実装です。この構造、Drawerの開閉、ライト／ダーク切替、HeaderとDrawerのsemantic roleによる配色を維持して、workspaceに顧客検索画面を追加してください。
> - 対象は顧客検索画面だけです。読取、追加、編集、削除、画面遷移は作成しません。
> - 画面名は `顧客検索`、説明は `登録済みの顧客情報を検索・確認します。` とします。不要な英語の上位ラベルや説明的なUI文言は追加しません。
> - 画像は表示しません。顧客IDは内部管理用の連番で編集不可です。管理項目は氏名、生年月日、住所、電話番号、メールアドレス、備考です。
> - 検索条件は氏名、生年月日、電話番号、メールアドレスです。条件領域には `検索条件` のグループキャプションを必ず表示し、説明は不要なら表示しません。キャプションは領域の意味付けであり、枠線、カード、パネル、追加の内側余白を作りません。
> - SearchとClearは同じ操作領域に置きます。条件フィールドの行には置かず、フィールド群の次の別行に置きます。操作領域の配置は既定の論理末尾です。
> - 結果はグリッドで表示し、顧客IDを詳細確認のリンクとして左端に置きます。表示用の選択列、選択状態、行末の詳細操作は追加しません。行は6件の中立fixtureで構いません。
> - 結果グリッドは、通常の本文面と区別できる色の列ヘッダーを使用します。行の区切り線は表示し、列の区切り線は表示しません。グリッドを装飾用の外枠・カードで囲って余分な内側余白を作らないでください。
> - 結果操作領域には `顧客を追加` ボタンを表示します。これは提供済みの画面操作の表示だけであり、保存、実行、遷移、権限、結果は実装しません。
> - 検索結果には件数表示とページネーションを含めます。ページネーションはPrevious、現在ページを表す `1`、Nextだけを中立fixtureとして描画します。`Current`、`現在`などの状態キャプション、ページ番号の列挙、実データ接続、ページ遷移は実装しません。
> - テーマは共通シェルと同じくライト／ダークを切り替え可能にし、初期状態はライトです。`?drawer=open|hidden` と `?theme=light|dark` のどちらでも初期状態を表示できるようにします。テーマ制御に可視の `Theme` または `テーマ` というキャプションは表示しません。
> - manifestにない新しい配色、brand色、設定、runtime、外部画像、外部フォント、外部CDN、外部scriptは追加しません。

## 結果

### Run 1

[HTML: Light / Drawer表示](runs/run-1/index.html?drawer=open&theme=light) · [HTML: Light / Drawer非表示](runs/run-1/index.html?drawer=hidden&theme=light) · [HTML: Dark / Drawer表示](runs/run-1/index.html?drawer=open&theme=dark) · [HTML: Dark / Drawer非表示](runs/run-1/index.html?drawer=hidden&theme=dark)

![Run 1 — Light / Drawer表示](runs/run-1/customer-search-open-light.png)
![Run 1 — Light / Drawer非表示](runs/run-1/customer-search-hidden-light.png)
![Run 1 — Dark / Drawer表示](runs/run-1/customer-search-open-dark.png)
![Run 1 — Dark / Drawer非表示](runs/run-1/customer-search-hidden-dark.png)

### Run 2

[HTML: Light / Drawer表示](runs/run-2/index.html?drawer=open&theme=light) · [HTML: Light / Drawer非表示](runs/run-2/index.html?drawer=hidden&theme=light) · [HTML: Dark / Drawer表示](runs/run-2/index.html?drawer=open&theme=dark) · [HTML: Dark / Drawer非表示](runs/run-2/index.html?drawer=hidden&theme=dark)

![Run 2 — Light / Drawer表示](runs/run-2/customer-search-open-light.png)
![Run 2 — Light / Drawer非表示](runs/run-2/customer-search-hidden-light.png)
![Run 2 — Dark / Drawer表示](runs/run-2/customer-search-open-dark.png)
![Run 2 — Dark / Drawer非表示](runs/run-2/customer-search-hidden-dark.png)

### Run 3

[HTML: Light / Drawer表示](runs/run-3/index.html?drawer=open&theme=light) · [HTML: Light / Drawer非表示](runs/run-3/index.html?drawer=hidden&theme=light) · [HTML: Dark / Drawer表示](runs/run-3/index.html?drawer=open&theme=dark) · [HTML: Dark / Drawer非表示](runs/run-3/index.html?drawer=hidden&theme=dark)

![Run 3 — Light / Drawer表示](runs/run-3/customer-search-open-light.png)
![Run 3 — Light / Drawer非表示](runs/run-3/customer-search-hidden-light.png)
![Run 3 — Dark / Drawer表示](runs/run-3/customer-search-open-dark.png)
![Run 3 — Dark / Drawer非表示](runs/run-3/customer-search-hidden-dark.png)
