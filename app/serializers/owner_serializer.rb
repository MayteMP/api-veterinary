# frozen_string_literal: true

class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :birth_day, :address,
             :phone_number1, :phone_number2, :email
end
