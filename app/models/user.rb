class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    belongs_to :seibetu
    belongs_to :work

    has_many :comments, dependent: :destroy
  
    validates :nickname, presence: true
  
    has_many :likes, dependent: :destroy
    has_many :romances, dependent: :destroy

    # has_many :liked_romances, through: :likes, source: :romance
  
    def already_liked?(romance)
      self.likes.exists?(romance_id: romance.id)
    end
  end
  