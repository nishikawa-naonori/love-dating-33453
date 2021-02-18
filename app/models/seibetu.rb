class Seibetu < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '男性' },
    { id: 3, name: '女性' },
    { id: 4, name: 'ゲイ' },
    { id: 5, name: 'レズ' },
    { id: 6, name: '性別は答えたくない' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :loves
end
