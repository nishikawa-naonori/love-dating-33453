class Romance < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image


  validates :image, presence: true

  has_many :likes, dependent: :destroy

  # has_many :liked_users, through: :likes, source: :user


  
end
