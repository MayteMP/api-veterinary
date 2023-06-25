# fronzen_string_literal: true

class Api::V1::OwnersController < ApplicationController
  def index
    render(json: Owner.all)
  end
end
