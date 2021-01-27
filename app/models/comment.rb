class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :love, optional: true  # tweetsテーブルとのアソシエーション

end
