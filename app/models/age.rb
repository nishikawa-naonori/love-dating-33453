class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '10歳' },
    { id: 3, name: '11歳' },
    { id: 4, name: '12歳' },
    { id: 5, name: '13歳' },
    { id: 6, name: '14歳' },
    { id: 7, name: '15歳' },
    { id: 8, name: '16歳' },
    { id: 9, name: '17歳' },
    { id: 10, name: '18歳' },
    { id: 11, name: '19歳' },
  ]
  include ActiveHash::Associations
  has_many :users
  has_many :loves
end
