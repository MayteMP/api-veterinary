# frozen_string_literal: true

class Api::V1::OwnersController < ApplicationController
  before_action :find_owner, only: %i[show]
  def index
    render(json: Owner.all)
  end

  def show
    render(json: @owner, serializer: OwnerSerializer)
  end

  private

  def find_owner
    @owner = Owner.find(params[:id])
  end
end
