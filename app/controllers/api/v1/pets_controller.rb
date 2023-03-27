# frozen_literal_string: true

class Api::V1::PetsController < ApplicationController
  def index
    render(json: Pet.all)
  end
end
