# frozen_string_literal: true

class Doctor < ApplicationRecord
  validates :name, :last_name, :address, :phone1, :email,
            :last_degree, :certificate_number, presence: true
  validates :email, format: { with: /\A(.+)@(.+)\z/, message: 'Email invalid' },
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 8, maximum: 254 }
end
