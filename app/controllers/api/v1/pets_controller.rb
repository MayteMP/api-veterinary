# frozen_string_literal: true

class Api::V1::PetsController < ApplicationController
  before_action :find_pet, only: %i[show update]
  def index
    render(json: Pet.all)
  end

  def create
    pet = Pet.new(pet_params)
    return render(json: pet, serializer: PetSerializer) if pet.save

    render(json: pet.errors, status: :unprocessable_entity)
  end

  def show
    render(json: @pet, serializer: PetSerializer)
  end

  def update
    return render(json: @pet, serializer: PetSerializer) if @pet.update(pet_params)

    render(json: @pet.errors, status: :unprocessable_entity)
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
