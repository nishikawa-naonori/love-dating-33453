class Work < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '小学生' },
    { id: 3, name: '中学生' },
    { id: 4, name: '高校生' },
    { id: 5, name: '大学生' },
    { id: 6, name: '会社員' },
    { id: 7, name: '公務員' },
    { id: 8, name: '自営業' },
    { id: 9, name: '公営競技' },
    { id: 10, name: 'スポーツ選手' },
    { id: 11, name: '職業は答えたくない' },
  ]
  include ActiveHash::Associations
  has_many :users
  has_many :loves
end
