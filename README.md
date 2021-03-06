# アプリケーション名
![Image from Gyazo](https://i.gyazo.com/b818d7df375db95fae609dfab6feb081.png)

# アプリケーション概要
>副業「せどり」の情報投稿が出来るアプリケーション。  
「せどり」とは、一口でいうと「転売」のことでインターネット通販などで安く仕入れた商品を販売し、仕入れ額と販売額の差額で利益を得る。  
「投稿する」ボタンを押すとプルダウンが表示され、投稿の種類を選ぶことができる。  
一般公開と登録者限定の2種類の投稿一覧がユーザー登録状態によって観覧できる。  
各投稿の詳細を見ることができ、それぞれコメントができる。  
自身の投稿やコメントは編集・削除ができる。  
自身の下記アカウント情報を編集ができる。  
【ニックネーム、地域、機種、使用しているアプリ①、使用しているアプリ②、プロフィール】  
自身のアカウントの退会ができ、退会するとそのアカウントの投稿・コメントも削除される。

# URL
>https://side-business-36374.herokuapp.com/

# Basic認証
>ユーザー名:kamiya  
パスワード:36374

# テスト用アカウント
>- __テストユーザー①__  
  Email: aa@aa.com  
  Password: 1234abc  

>- __テストユーザー②__  
  Email: bb@bb.com  
  Password: 1234abc

# 利用方法
>- __情報投稿機能__  
ログイン状態で「新規投稿」ボタンを押すと「知識情報の投稿」「商品情報の投稿」のプルダウンが現れ、選択するとそれぞれの投稿画面へ遷移する。  
それぞれの投稿画面の必須項目を入力することで投稿できる。

>- __コメント投稿機能__  
各投稿の詳細ページに遷移するとコメント欄を観覧でき、ログイン状態であればコメントを投稿することも出来る。

# 目指した課題解決
>近年副業を始める人が多くなっている中、「始めようとしているが方法がわからない」「始めてみたけど要領が掴めない」など困っていることを聞くことがあります。  
そこで今回は副業の「せどり」にフォーカスを当てて、始めようとしている人に対して基礎的な情報(知識・方法)を集めることができ、始めている人に対しては周りのせどり成功商品など情報を得ることで活動のヒントを探すことが出来るアプリケーションを考えました。  
さらにコメントをできるようにすることでその投稿に対しての質疑応答で詳細部分まで情報交換出来るようにしました。

# 洗い出した要件
| 機能    | 目的 | 詳細 | ストーリー |
| -------- | ---------- | ---------- | ---------------- |
| ユーザー管理機能 | 未ログインユーザーに使用を制限するため | ユーザー名、名前、ナマエ、email、電話番号、パスワード、誕生日は登録必須項目にする。Emailと電話番号がデータベースで重複しているとユーザー登録できない。 | 新規登録時は、必須項目を記述して新規登録ボタンを押すことで登録できる。登録完了後はトップページに遷移する。 |
| 情報投稿機能 | ユーザーの情報を投稿するため | 「投稿」ボタンを押すと「知識」「商品」の2択が出てきて選択後、選択された方の投稿作成画面へ遷移する。投稿作成画面から必要事項を記入して投稿できるようにする。 | ユーザーログインがされていることが前提。遷移先ページの必要事項を記述して「投稿」ボタンを押すことで投稿できる。投稿後はトップページに遷移する。 |
| 投稿一覧機能 | 投稿された情報を表示させるため | トップページの見たい投稿一覧を選択すると投稿された情報が投稿日時の新しい順で表示される。 | トップページに「せどりの方法・知識の一覧」「せどりに成功した商品の一覧」があり、任意のものをクリックすることでその一覧ページへ遷移できる。 |
| 情報詳細機能 | 投稿された情報の詳細を表示するため | 投稿時入力した内容を表示 | ユーザーログインされていることが前提。投稿されていることが前提。コメント欄や評価ボタンを事前に配置しておく。 |
| 情報編集機能 | 投稿された情報の修正できるようにするため | 「編集」ボタンをクッリクすると専用の画面に遷移し、編集できるようにする。 | 投稿ユーザーのみが編集可能。投稿機能と類似の画面に遷移して投稿の編集が出来る。編集ボタンで編集内容が反映され、情報詳細ページに遷移する。 |
| 情報削除機能 | 投稿された情報の削除できるようにするため | 「削除」ボタンをクリックすると自身の投稿削除をできるようにする。 | 投稿ユーザーのみが削除可能。「削除」ボタンをクリックするとその投稿が削除され、トップページへ遷移する。 |
| コメント投稿機能 | 投稿に対してコメントができるようにするため | 投稿詳細画面の下側のコメント欄にてコメントを投稿することができる。 | ログイン状態が前提。コメント欄のtextボックスにコメントを記述し、「コメントする」ボタンを押すとコメントが投稿される。 |
| ユーザー詳細機能 | ユーザー名の詳細を表示するため | 各ユーザーのニックネーム部分をクリックすることでそのユーザーの詳細ページに遷移できる。 | ユーザーがログインしていることが前提。そのユーザーの登録時の入力した情報の個人情報以外全て表示されている。 |
| ユーザー情報編集機能 | ユーザーの情報を編集できるようにするため | ユーザー詳細画面の編集ボタンから登録時のユーザー情報編集画面に遷移して編集が行える。 | 自身のユーザー詳細に対してのみ実行可能が前提。登録画面の類似の画面に遷移。編集後に編集完了ボタンを押すことで編集内容がユーザー情報に反映され、ユーザー詳細情報に遷移する。 |
| ユーザー退会機能 | ユーザーの情報を削除できるようにするため | ユーザー詳細画面の「退会する」ボタンをクリックすることで確認表示が出てOKを押すとそのユーザーの情報と全ての投稿とコメントが削除される。 | 自身のユーザーのみ実行可能。「退会する」ボタンを実行することにより、そのユーザーの情報、ポイント、投稿、コメントが全て削除され、「退会完了しました」と書かれているページに遷移する。遷移したページの「トップページに戻る」をクリックすることでトップページに戻ることができる。 |
| コメント削除機能 | 投稿したコメントを削除できるようにするため | コメントの横にある「削除」ボタンを押すことでそのコメントを削除できる。 | 自身のコメントのみ実行可能。コメントの横の「削除」ボタンを押すことでそのコメントを削除できる。 |

# 実装した機能
- 情報投稿機能  
  - 「知識情報の投稿」画面遷移  
  ![Image from Gyazo](https://i.gyazo.com/31cb81f228738be7a93afeb37c4946ef.gif)

  - 「商品情報の投稿」画面遷移
  ![Image from Gyazo](https://i.gyazo.com/f1a07d59bc47f1d4ca935bd173daab22.gif)

  - 必須項目を正しく入力後、「保存する」でデータが保存できればトップページへ遷移
  ![Image from Gyazo](https://i.gyazo.com/4a83673434dfe246d989d01114c8d749.gif)

  - 入力が正しくないとエラーメッセージが表示される
  ![Image from Gyazo](https://i.gyazo.com/267b706d456efd312558ed9840d8a608.gif)


- コメント投稿機能
  - コメントを入力後、「送信する」を押すとコメントが投稿される
  ![Image from Gyazo](https://i.gyazo.com/560efc4a1c16c96ded20239fc400882e.gif)

  - コメントが入力されていない状態で「送信する」を押すとエラーメッセージが表示される
  ![Image from Gyazo](https://i.gyazo.com/3dafdc29b78efb8ed522c2ace8420572.gif)

- ユーザー退会機能
  - ユーザー詳細ページの「削除」を押すとダイアログが表示され、「OK」を押すと「退会しました」と表示される
  ![Image from Gyazo](https://i.gyazo.com/29592212e1fd1e93c4ccc04470776b89.gif)


# 実装予定の機能
>- エラーメッセージの日本語化
>- アカウントや投稿などを削除・規制がまとめて管理できる管理者機能
>- 悪意ある投稿やアカウントに対しての通報機能
>- ActionCableを使用したコメントの即時更新機能  
>- 投稿に対して「Good」「bad」の評価ができる投稿評価機能  
>- 自分が気に入ったユーザーを登録できるユーザーお気に入り機能
>- ユーザー同士で個人的に話し合いができるチャットルーム機能
>- ポイントの運営によってこのアプリ自体も副業の一部にできるポイント運営機能

# データベース設計
## ER図
![Image from Gyazo](https://i.gyazo.com/43957fda43ae8e82aff7037d2fd472b0.png)

## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |
| prefecture_id      | integer | null: false               |
| phone_number       | string  | null: false, unique: true |
| os_type_id         | integer |                           |
| use_app1           | string  |                           |
| use_app2           | string  |                           |
| profile            | text    |                           |

## Association
>- has_many: items
>- has_many: item_comments
>- has_many: knowledges
>- has_many: knowledge_comments

## itemsテーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| item_name    | string     | null: false |
| maker        | string     | null: false |
| price        | integer    | null: false |
| bought_store | string     | null: false |
| item_info    | text       |             |
| user         | references |             |

※imageは、ActiveStorageを使用

## Association
>- belongs_to: user
>- has_many: item_comments

## item_commentsテーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| item_comment | text       | null: false |
| user         | references |             |
| item         | references |             |

## Association
>- belongs_to: user
>- belongs_to: item

## knowledgesテーブル
| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| knowledge_title | string     | null: false |
| knowledge_info  | text       | null: false |
| user            | references |             |

※imageは、ActiveStorageを使用

## Association
>- belongs_to: user
>- has_many: knowledge_comments

## knowledge_commentsテーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| knowledge_comment | text       | null: false |
| user              | references |             |
| knowledge         | references |             |

## Association
>- belongs_to: user
>- belongs_to: knowledge

# ローカルでの動作方法
```
% git clone https://github.com/sushi1129/side-business-36374.git
% cd side-business-36374
% bundle install
% rails db:create
% rails db:migrate
% rails s
 → http://localhost:3000
```

# 開発環境
>- フロントエンド：HTML5/CSS(Bootstrap)/JavaScript/jQuery/Ajax
>- バックエンド：Ruby on Rails(6.0.0)/Ruby(2.6.5)/JavaScript
>- テスト：RSpec
>- Linter：Rubocop
>- データベース：MySQL(5.6.51)/Sequel Pro
>- インフラ：Heroku
>- タスク管理：GitHub