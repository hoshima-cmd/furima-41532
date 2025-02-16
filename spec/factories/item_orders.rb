FactoryBot.define do
  factory :item_order do

    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    region_id { Faker::Number.between(from: 2, to: 48) }
    prefecture { Faker::Address.city }
    building { Faker::Company.name }
    street_address { Faker::Address.street_address }
    telephone_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
