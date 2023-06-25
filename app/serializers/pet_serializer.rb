# frozen_string_literal: true

class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :birth_date, :color, :gengre, :specie,
             :brees, :microchip_number, :particular_signs
end
