FactoryBot.define do
  factory :order_address do
    user_id       { Faker::Number.number(digits: 5) } 
    item_id       { Faker::Number.number(digits: 5) } 
    postal_code   { '123-4567' } 
    prefecture_id { Faker::Number.between(from: 2, to: 48) } 
    city          { Faker::Address.city }
    street_number { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number  { Faker::Number.leading_zero_number(digits: 10) } 
    
    initialize_with { new(attributes) } 
  end
end