class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :romance, optional: true  # tweetsテーブルとのアソシエーション

  # バリデーション
  validates :text, length: { in: 4..1000 }
end
