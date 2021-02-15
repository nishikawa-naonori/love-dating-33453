FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 10) }
    email                 { Faker::Internet.free_email }
    password              { '19901aA' }
    password_confirmation { password }
    seibetu_id            { 2 }
    work_id               { 2 }
    age                   { '18歳' }
  end
end