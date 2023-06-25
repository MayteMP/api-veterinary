# frozen_string_literal: true

FactoryBot.define do
  factory :owner do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
    address { Faker::Address.full_address }
    phone_number1 { Faker::PhoneNumber.cell_phone }
    phone_number2 { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end
end
