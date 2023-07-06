# frozen_string_literal: true

RSpec.shared_context(:doctors) do
  let(:doctor_object) do
    {
      id: Doctor.first.id,
      name: Doctor.first.name,
      last_name: Doctor.first.last_name,
      birth_date: Doctor.first.birth_date,
      address: Doctor.first.address,
      phone1: Doctor.first.phone1,
      phone2: Doctor.first.phone2,
      email: Doctor.first.email,
      last_degree: 'Bachelor of Veterinary Medicine and Surgery',
      certificate_number: '012381239893'
    }
  end

  let(:valid_params) do
    {
      name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      address: Faker::Address.full_address,
      phone1: Faker::PhoneNumber.cell_phone,
      phone2: Faker::PhoneNumber.cell_phone,
      email: Faker::Internet.email,
      last_degree: 'Bachelor of Veterinary Medicine and Surgery',
      certificate_number: '012381239893'
    }
  end

  let(:invalid_params) do
    {
      name: '',
      last_name: Faker::Name.last_name,
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      address: '',
      phone1: nil,
      phone2: Faker::PhoneNumber.cell_phone,
      email: 'Not valid email',
      last_degree: '',
      certificate_number: ''
    }
  end
end
