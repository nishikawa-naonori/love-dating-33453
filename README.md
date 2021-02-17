# アプリケーション名
ラブライク
# アプリケーション概要
恋の悩みを話し合って解決する
# URL
https://love-dating-33453.herokuapp.com/
# テスト用アカウント
メールアドレス watar.wind.xyz1990@gmail.com
パスワード     111111a

# 利用方法

# 目指した課題解決


# ローカルでの動作方法

# データベース設計                       


## -------------------------------------------
## users テーブル                              
## -------------------------------------------
| Column             | Type   | Options      |
| --------           | ------ | -----------  |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| seibetu            | string | null: false  |
| age                | string | null: false  |
| work               | string | null: false  |


### Association(アソシエーション)

- has_many :love
- has_many :comment
- has_many :tip




## -------------------------------------------
## loves テーブル
## -------------------------------------------
| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| user             | referrence | null: false, foreign_key: true |
| category_id      | integer    | null: false |
| title            | string     | null: false |
| info1            | text       | null: false |


### Association(アソシエーション)

- belongs_to :user

- has_many   :comment
- has_many   :tip




## -------------------------------------------
## comments テーブル
## -------------------------------------------

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| love       | references | null: false, foreign_key: true |
| info2      | text       | null: false |

### Association(アソシエーション)

- belongs_to :user
- belongs_to :love

## -------------------------------------------
## tips テーブル
## -------------------------------------------

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| love       | references | null: false, foreign_key: true |
| money      | integer    | null: false                    |

- belongs_to :user
- belongs_to :love