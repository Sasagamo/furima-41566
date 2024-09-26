FactoryBot.define do
  factory :user do
    nickname                      { Faker::Name.name }
    email                         { Faker::Internet.unique.email }
    password                      { Faker::Internet.password(min_length: 6) }
    password_confirmation         { password }
    name                          { Gimei.name.first.kanji }
    surname                       { Gimei.name.last.kanji }
    name_kana                     { Gimei.name.first.katakana }
    surname_kana                  { Gimei.name.last.katakana }
    birthdate                     { Faker::Date.birthday(min_age: 20,max_age:60) }

  end
end