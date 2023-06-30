# frozen_string_literal: true

class Owner < ApplicationRecord
  validates :name, :last_name, :address, :phone_number1, :email, presence: true
  validates :email, format: { with: /\A(.+)@(.+)\z/, message: 'Email invalid' },
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 8, maximum: 254 }

  has_many :pets
end
