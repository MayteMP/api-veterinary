# frozen_string_literal: true

class Api::V1::DoctorsController < ApplicationController
  before_action :find_doctor, only: %i[show update]

  def index
    render(json: Doctor.all)
  end
end
