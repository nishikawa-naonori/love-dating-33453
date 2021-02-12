class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    belongs_to :seibetu
    belongs_to :work

    has_many :comments, dependent: :destroy
  
    has_many :likes, dependent: :destroy
    
    has_many :romances, dependent: :destroy

#バリデーション----------------------------------------------
    # ニックネーム
    validates :nickname, presence: true

  # パスワードを半角英数字にバリデーション
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英数字の両方を含めて設定してください'



    def liked_by?(romance_id)
      likes.where(romance_id: romance_id).exists?
    end


  end
  