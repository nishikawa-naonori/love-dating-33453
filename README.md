## -------------------------------------------
# テーブル設計                                  
## -------------------------------------------


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