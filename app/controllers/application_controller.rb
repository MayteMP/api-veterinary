# frozen_literal_string: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found_error

  private

  def handle_record_not_found_error(e)
    render json: { error: e.to_s }, status: :bad_request
  end
end
