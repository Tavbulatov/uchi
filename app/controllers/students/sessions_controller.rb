# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize

module Students
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      render json: {
        status: { code: 200, message: 'Logged in sucessfully.' },
        data: resource
      }, status: :ok
    end

    def respond_to_on_destroy
      if request.headers['Authorization'].present?
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last,
                                 Rails.application.credentials.devise_jwt_secret_key!).first
        current_user = Student.find(jwt_payload['sub'])
      end

      if current_user.jti == jwt_payload['jti']
        render_json(status: 200, message: 'logged out successfully')
      else
        render_json(status: 401, message: "Couldn't find an active session.")
      end
    end

    def render_json(**opts)
      render json: opts, status: opts[:status]
    end
  end
end
# rubocop:enable Metrics/AbcSize
