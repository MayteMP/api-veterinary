# frozen_string_literal: true

class Api::V1::OwnersController < ApplicationController
  before_action :find_owner, only: %i[show update]
  def index
    render(json: Owner.all)
  end

  def create
    owner = Owner.new(owner_params)
    return render(json: owner, serializer: OwnerSerializer) if owner.save

    render(json: owner.errors, status: :unprocessable_entity)
  end

  def show
    render(json: @owner, serializer: OwnerSerializer)
  end

  def update
    return render(json: @owner, serializer: OwnerSerializer) if @owner.update(owner_params)

    render(json: @owner.errors, status: :unprocessable_entity)
  end

  private

  def find_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(
      :name, :last_name, :address, :phone_number1, :email, :phone_number2
    )
  end
end
