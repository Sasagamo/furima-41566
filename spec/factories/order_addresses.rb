FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    street_number { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number  { Faker::Number.leading_zero_number(digits: 10) }
    token { "tok_#{SecureRandom.hex(16)}" }

  end
end
