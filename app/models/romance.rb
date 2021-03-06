class Romance < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  has_many :likes, dependent: :destroy

  # バリデーション----------------------------------------------

  with_options presence: { message: 'を選択してください' } do
    validates :image
  end

  # validates :image, presence: true

  validates :title, length: { in: 5..30 }

  validates :info1, length: { in: 8..1000 }
end
