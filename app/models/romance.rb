class Romance < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  has_many :likes, dependent: :destroy
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end


  validates :image, presence: true



  # has_many :liked_users, through: :likes, source: :user


  
end
