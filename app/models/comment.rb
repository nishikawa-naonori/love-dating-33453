class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :romance, optional: true  # tweetsテーブルとのアソシエーション

  validates :text, presence: true
end
