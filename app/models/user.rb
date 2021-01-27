class User < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :seibetu
  belongs_to :work
  has_many :loves
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true
end
