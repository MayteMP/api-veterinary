# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    address { Faker::Address.full_address }
    phone1 { Faker::PhoneNumber.cell_phone }
    phone2 { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    last_degree { 'Bachelor of Veterinary Medicine and Surgery' }
    certificate_number { '012381239893' }
  end
end
