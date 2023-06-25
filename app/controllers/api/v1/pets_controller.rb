# frozen_literal_string: true

class Api::V1::PetsController < ApplicationController
  before_action :find_pet, only: [:show]
  def index
    render(json: Pet.all)
  end

  def show
    render(json: @pet, serializer: PetSerializer)
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end
end
