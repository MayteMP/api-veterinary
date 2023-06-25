# frozen_literal_string: true

FactoryBot.define do
  factory :pet do
    name { 'Puppy' }
    birth_date { '2022-03-26' }
    color { 'Brown' }
    gengre { 'Male' }
    specie { 'Dog' }
    brees { 'Husky' }
    microchip_number { '1029384567' }
    particular_signs { 'Crazy Dog' }
  end
end
