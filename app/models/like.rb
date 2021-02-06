class Like < ApplicationRecord
  #belongs_to :romance
 
  
  belongs_to :romance, counter_cache: :likes_count

  belongs_to :user


  validates_uniqueness_of :romance_id, scope: :user_id


end
