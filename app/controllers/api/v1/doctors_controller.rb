# frozen_string_literal: true

class Api::V1::DoctorsController < ApplicationController
  before_action :find_doctor, only: %i[show update]

  def index
    render(json: Doctor.all)
  end

  def create
    doctor = Doctor.new(doctor_params)
    return render(json: doctor, serializer: DoctorSerializer) if doctor.save

    render(json: doctor.errors, status: :unprocessable_entity)
  end

  def show
    render(json: @doctor, serializer: DoctorSerializer)
  end

  def update
    return render(json: @doctor, serializer: DoctorSerializer) if @doctor.update(doctor_params)

    render(json: @doctor.errors, status: :unprocessable_entity)
  end

  private

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(
      :name, :last_name, :address, :phone1, :email, :phone_number2, :birth_date,
      :last_degree, :certificate_number
    )
  end
end
