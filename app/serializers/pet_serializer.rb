# frozen_literal_string: true
class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :birth_date, :color, :gengre, :specie,
    :brees, :microcip_number, :particular_signs
end
