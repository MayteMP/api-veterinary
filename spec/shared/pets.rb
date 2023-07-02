# frozen_string_literal: true

RSpec.shared_context(:pets) do
  let(:pet_object) do
    {
      "id": Pet.first.id,
      "name": 'Puppy',
      "birth_date": '2022-03-26',
      "color": 'Brown',
      "gengre": 'Male',
      "specie": 'Dog',
      "brees": 'Husky',
      "microchip_number": '1029384567',
      "particular_signs": 'Crazy Dog',
      "owner_id": owner.id
    }
  end

  let(:valid_params) do
    {
      id: Pet.first.id,
      pet: {
        name: 'Joe Doe',
        specie: 'Cat'
      }
    }
  end

  let(:invalid_params) do
    {
      id: Pet.first.id,
      pet: {
        name: '',
        specie: nil
      }
    }
  end

  let(:expect_response_bad_request) do
    {
      "error": "Couldn't find Pet with 'id'=1000"
    }
  end
end
