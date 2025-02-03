FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6, mix_case: false)}
    password_confirmation {password}
    birthday              {Faker::Date.between(from: '1945-01-01', to: '2020-12-31')}
    last_name             {'山田'}
    first_name            {'太郎'}
    Last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
  end
end