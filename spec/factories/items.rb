FactoryBot.define do
  factory :item do
    product_name { Faker::Name.name }
    explanation {Faker::Lorem.sentence}
    num_id {Faker::Number.between(from: 2, to: 4)}
    category_id {Faker::Number.between(from: 2, to: 11)}
    region_id {Faker::Number.between(from: 2, to: 48)}
    shipping_fee_id {Faker::Number.between(from: 2, to: 3)}
    state_id {Faker::Number.between(from: 2, to: 7)}
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('spec/picture/desk.png'), filename: 'desk.png', content_type: 'image/png')
    end
  end
end
