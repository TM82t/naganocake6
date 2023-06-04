# nagano_cake（概要）
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

# アプリケーション機能
## 顧客側

#### 1 ログイン機能
* メールアドレス、パスワードでログインできる。
* ログイン時のみ利用できる機能が利用できるようになる。

#### 2 ログアウト機能
* ログインしている状態からログアウト状態にする。
* ログイン時のみ利用できる機能が利用できなくなる。

#### 3 商品一覧表示機能
* 商品を一覧表示する。
* 検索結果を表示する場合は、検索条件に当てはまる商品のみ一覧表示する。

#### 4 商品詳細情報表示機能
* 商品一覧画面で選択した商品の詳細情報を表示する。
* カート追加機能が表示されている。

#### 5 カート追加機能
* カートに商品を追加することができる。

#### 6 カート一覧機能
* カートの中身を一覧表示することができる。

#### 7 カート編集機能
* カートの中身の個数を編集したり、削除したりすることができる。

#### 8 注文機能
* カートの中身の購入をすることができる。
* 支払方法を設定することができる。

#### 9 会員情報編集機能
* 登録している情報を編集することができる。

#### 10 退会機能(Gem不使用)
* 退会手続きをすることができる。

#### 11 注文履歴一覧表示機能
* 過去の注文概要を一覧で確認することができる。

#### 12 注文履歴詳細表示機能
* 注文の詳細（注文商品や個数など）を確認することができる。


## 管理者側

#### 1 ログイン機能
* メールアドレス、パスワードでログインできる。
* ログイン時のみ利用できる機能が利用できるようになる。

#### 2 ログアウト機能
* ログインしている状態からログアウト状態にする。
* ログイン時のみ利用できる機能が利用できなくなる。

#### 3 注文履歴一覧表示機能
* 過去の注文概要を一覧で確認することができる。

#### 4 注文履歴詳細表示機能
* 注文の詳細（注文商品や個数など）を確認することができる。。

#### 5 顧客一覧表示機能
* 顧客情報を一覧で確認することができる。

#### 6 顧客詳細情報表示機能
* 顧客の詳細情報を確認することができる。
* 顧客のステータス（有効/退会）を切り替えることができる。

#### 7 商品一覧表示機能
* 登録商品を一覧で確認することができる。

#### 8 商品詳細情報表示機能
* 商品の詳細情報を確認することができる。

#### 9 商品情報変更機能
* 商品の登録情報を変更することができる。

# インストール
$ git clone https://github.com/webcamp-naganocake/naganocake.git
$ cd nagano_cake
$ sh setup.sh
$ ~do anything~
