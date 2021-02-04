class Like < ApplicationRecord
  belongs_to :romance
 
  
  

  belongs_to :user

  # belongs_to :romance, counter_cache: :likes_count


    # 一人のユーザーは一人の投稿にしか、いいねができない

  validates_uniqueness_of :romance_id, scope: :user_id

  #sssssssssss
end
