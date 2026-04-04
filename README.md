<!--
ソース名: README.md
Lang: Markdown
Function: 教材向けの起動手順・sideload 手順・マニフェストの使い分け／Excel VBA サンプルへの導線
Note: 独立リポジトリ。Id（GUID）は他アドインと重複させないこと。作業ルートは Dev 配下のみ。
Author:Takashi Oikawa
Date:2026/04/04
LastUp:2026/04/04
-->

# どこつぶ（デモ）— 教材用リポジトリ

説明用モックを置いています。**次の 2 系統**があります。

| 系統 | 内容 |
|------|------|
| **Office Add-in** | タスクペイン（Web）。認証・DB・API・Excel セル操作は含みません。 |
| **Excel VBA** | Java サーブレット版 DokoTsubu を模した **UserForm 中心**の学習用サンプル（`vba/`）。 |

詳細仕様（画面・遷移・データ・対象外）は **[docs/dokotsubu-vba-spec.md](docs/dokotsubu-vba-spec.md)** を参照してください。

## 作業ルート（正）

**本リポジトリの唯一の作業場所は次のパスです。**

`/Users/takashioikawa/Dev/office-addin-dokotsubu-demo`

旧作業用のコピーが別の場所に残っている可能性はありますが、**今後の正規作業場所は上記のパスのみ**とします。

---

## Office Add-in（タスクペイン）

### マニフェスト

| ファイル | 用途 |
| -------- | ---- |
| **manifest.local.xml** | ローカル検証（`http://localhost:3000`） |
| manifest.prod.sample.xml | HTTPS 配信の雛形（`YOUR-HOST.example` と `Id` を差し替え） |

**Id（GUID）** はアドインごとに一意にしてください。

### 前提

- Python 3
- Excel for Mac（Microsoft 365 など）

### ローカルサーバー

```bash
cd /Users/takashioikawa/Dev/office-addin-dokotsubu-demo
bash start-local.sh
```

Finder からは `start-local.command` をダブルクリック（初回は右クリック → 開く）。

確認: ブラウザで `http://localhost:3000/taskpane.html`

### Excel（Mac）sideload

**挿入** → **アドイン** → **マイ アドイン** → マニフェストから **`manifest.local.xml`** を追加。

### トラブル

タスクペインが空のときは、先にサーバー起動と `taskpane.html` のブラウザ表示を確認する。

### Add-in 側の未実装（意図的）

ログイン、DB、通信、永続化、シート操作、本番パイプライン。

---

## Excel VBA（DokoTsubu 風）

- **ソース場所:** `vba/`（`.bas` / `.frm` をブックにインポートして使う）
- **起動マクロ:** `modEntry.ShowLogin`
- **画面:** `frmLogin`（ログイン）→ `frmMain`（一覧・投稿・ログアウト）
- **データ:** メモリ上の `Collection`（DB なし）。ユーザー登録・実認証はなし。

インポート手順・画面遷移の詳細は [docs/dokotsubu-vba-spec.md](docs/dokotsubu-vba-spec.md) に記載しています。

### VBA 側の未実装（意図的／今後）

ユーザー登録、ID／パスワード検証、DB・ファイル永続化、本番向けエラーハンドリング。
