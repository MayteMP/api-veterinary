# frozen_literal_string: true

class Pet < ApplicationRecord
  validates :name, :birth_date, :color, :gengre, :specie, :brees,
            presence: true
  validates :gengre, inclusion: { in: %w(Male Female) }
end
