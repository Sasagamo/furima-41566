FactoryBot.define do
  factory :user do
    nickname                      { Faker::Name.unique.name }
    email                         { Faker::Internet.unique.email }
    password                      { Faker::Internet.password(min_length: 6) }
    password_confirmation         { password }
    surname                    { "山田" }
    name                     { "太郎" }
    surname_kana               { "ヤマダ" }
    name_kana                { "タロウ" }
    birthdate                    { Faker::Date.birthday(min_age: 20,max_age:60) }

  end
end