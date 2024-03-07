# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_student!

  private

  def extract_attributes(serializer, resource)
    serializer.new(resource).serializable_hash[:data].map { _1[:attributes] }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name surname classroom_id school_id])
  end
end
