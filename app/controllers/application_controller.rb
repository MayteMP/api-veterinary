# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found_error

  private

  def handle_record_not_found_error(error)
    render json: { error: error.to_s }, status: :bad_request
  end
end
