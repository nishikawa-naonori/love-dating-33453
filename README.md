# アプリケーション名
ラブライク
# アプリケーション概要
恋の悩みを話し合って解決する
# URL
https://love-dating-33453.herokuapp.com/
# テスト用アカウント
メールアドレス watar.wind.xyz1990@gmail.com<br>
パスワード     111111a

# Basic認証
ID   admin<br>
Pass 2222<br>

# 利用方法
ログインが家並み

# 目指した課題解決

# 洗い出した要件

# 実装した機能についてのGIFと説明


                    

# 実装予定の機能

# データベース設計   

## users テーブル                              
| Column             | Type   | Options      |
| --------           | ------ | -----------  |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| seibetu_id         | string | null: false  |
| age                | string | null: false  |
| work               | string | null: false  |

### アソシエーション
- belongs_to :seibetu
- belongs_to :work

- has_many :romances
- has_many :comments
- has_many :likes


## romances テーブル
| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| user             | referrence | null: false, foreign_key: true |
| title            | string     | null: false |
| info1            | text       | null: false |
| kaiketu          | boolean    | null: false |


### アソシエーション
- belongs_to :user

- has_one_attached :image
- has_many         :comments
- has_many         :likes

## comments テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| romance    | references | null: false, foreign_key: true |
| text       | text       | null: false |

### アソシエーション

- belongs_to :user
- belongs_to :romance

## likes テーブル
| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| romance    | references | null: false, foreign_key: true |

### アソシエーション
- belongs_to :user
- belongs_to :romance

![ER image](ER.png)

# ローカルでの動作方法

rails バージョン 6.0.0

ruby  バージョン 2.6.5

git cloneしてから、ローカルで動作をさせるまでに必要なコマンド

git clone https://github.com/nishikawa-naonori/love-dating-33453.git

bundle install

rails db:create

rails db:migrate

rails s