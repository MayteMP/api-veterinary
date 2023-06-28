# frozen_string_literal: true

RSpec.shared_context(:owners) do
  let(:owner_object) do
    {
      id: Owner.first.id,
      name: Owner.first.name,
      last_name: Owner.first.last_name,
      birth_day: Owner.first.birth_day,
      address: Owner.first.address,
      phone_number1: Owner.first.phone_number1,
      phone_number2: Owner.first.phone_number2,
      email: Owner.first.email
    }
  end

  let(:valid_params) do
    {
      name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birth_day: Faker::Date.birthday(min_age: 18, max_age: 65),
      address: Faker::Address.full_address,
      phone_number1: Faker::PhoneNumber.cell_phone,
      phone_number2: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.email
    }
  end

  let(:invalid_params) do
    {
      name: '',
      last_name: Faker::Name.last_name,
      birth_day: Faker::Date.birthday(min_age: 18, max_age: 65),
      address: '',
      phone_number1: nil,
      phone_number2: Faker::PhoneNumber.cell_phone,
      email: 'Not valid email'
    }
  end
end
