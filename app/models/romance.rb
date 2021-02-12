class Romance < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  has_many :likes, dependent: :destroy

#バリデーション----------------------------------------------


with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を選択してください' } do
  validates :image
end

  # validates :image, presence: true


  validates :title, presence: true

  validates :info1, presence: true






  
end
