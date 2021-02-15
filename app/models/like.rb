class Like < ApplicationRecord
 
  

  belongs_to :user
  belongs_to :romance

  validates_uniqueness_of :romance_id, scope: :user_id

end
