# frozen_string_literal: true

class Pet < ApplicationRecord
  validates :name, :color, :gengre, :specie, :brees,
            presence: true
  validates :gengre, inclusion: { in: %w[Male Female] }
end
