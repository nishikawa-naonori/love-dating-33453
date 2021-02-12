class Work < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '学生' },
    { id: 3, name: '会社員' },
    { id: 4, name: '公務員' },
    { id: 5, name: '自営業' },
    { id: 6, name: '公営競技' },
    { id: 7, name: 'スポーツ選手' },
    { id: 8, name: '職業は答えたくない' },
  ]
  include ActiveHash::Associations
  has_many :users
  has_many :loves
end
