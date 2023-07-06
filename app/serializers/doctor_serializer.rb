# frozen_string_literal: true

class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :birth_date, :address,
             :phone1, :phone2, :email, :last_degree, :certificate_number
end
