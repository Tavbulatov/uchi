# frozen_string_literal: true

module Students
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def destroy
      resource = Student.find(params[:student_id])
      resource.destroy
    end

    private

    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: {
          status: { code: 200, message: 'Signed up sucessfully.' },
          data: resource
        }, status: :ok
      else
        render json: {
          status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
        }, status: :unprocessable_entity
      end
    end
  end
end
