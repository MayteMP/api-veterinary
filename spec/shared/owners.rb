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
end
