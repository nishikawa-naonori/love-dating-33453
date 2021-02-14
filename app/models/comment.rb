class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :romance, optional: true  # tweetsテーブルとのアソシエーション

  # バリデーション
  validates :text, length: { in: 2..100 }
end
