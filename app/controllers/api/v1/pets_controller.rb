# frozen_literal_string: true

class Api::V1::PetsController < ApplicationController
  before_action :find_pet, only: [:show, :update]
  def index
    render(json: Pet.all)
  end

  def show
    render(json: @pet, serializer: PetSerializer)
  end

  def update
    if @pet.update(pet_params)
      render(json: @pet, serializer: PetSerializer)
    else
      render(json: @pet.errors, status: :unprocessable_entity)
    end
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(
      :name, :birth_date, :color, :gengre, :specie, :brees,
      :microchip_number, :particular_signs
    )
  end
end
