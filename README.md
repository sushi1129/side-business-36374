# アプリケーション名
![Image from Gyazo](https://i.gyazo.com/b818d7df375db95fae609dfab6feb081.png)

# アプリケーション概要
>副業「せどり」の情報投稿が出来るアプリケーション。  
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
ログイン状態で「新規投稿」ボタンを押すと「知識情報の投稿」「商品情報の投稿」のプルダウンが現れ、選択するとそれぞれの投稿画面へ遷移します。  
それぞれの投稿画面の必須項目を入力することで投稿できる。

>- __コメント投稿機能__  
各投稿の詳細ページに遷移するとコメント欄を観覧でき、ログイン状態であればコメントを投稿することも出来る。

# 目指した課題解決
>

# 洗い出した要件
| 機能 | 目的 | 詳細 | ストーリー |
| ---- | ---- | ---- | ---------- |
| ユーザー管理機能 | 未ログインユーザーに使用を制限するため | ユーザー名、名前、ナマエ、email、電話番号、パスワード、誕生日は登録必須項目にする。Emailと電話番号がデータベースで重複しているとユーザー登録できない。 | 新規登録時は、必須項目を記述して新規登録ボタンを押すことで登録できる。登録完了後はトップページに遷移する。 |
| 情報投稿機能 | ユーザーの情報を投稿するため | 「投稿」ボタンを押すと「知識」「商品」の2択が出てきて選択後、選択された方の投稿作成画面へ遷移する。投稿作成画面から必要事項を記入して投稿できるようにする。 | ユーザーログインがされていることが前提。遷移先ページの必要事項を記述して「投稿」ボタンを押すことで投稿できる。投稿後はトップページに遷移する。 |

# 実装した機能

# 実装予定の機能

# データベース設計
## ER図
![Image from Gyazo](https://i.gyazo.com/720180d92c0208c30e026a2fd127f3ce.png)

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