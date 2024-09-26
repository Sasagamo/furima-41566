FactoryBot.define do
  factory :user do
    nickname                      { "TestUser" }
    email                         { "test@test.com" }
    password                      { "test00" }
    password_confirmation         { password }
    surname                    { "山田" }
    name                     { "太郎" }
    surname_kana               { "ヤマダ" }
    name_kana                { "タロウ" }
    birthdate                    { "2000-01-01" }

  end
end