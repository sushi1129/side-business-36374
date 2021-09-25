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

>- 


# 目指した課題解決

# 洗い出した要件

# 実装した機能

# 実装予定の機能

# データベース設計
## ER図
![Image from Gyazo](https://i.gyazo.com/ea651959281bbfa0c78c8dcb79551504.png)

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
>- has_many: knowledges
>- has_many: item_comments
>- has_many: knowledge_comments

## 


# ローカルでの動作方法