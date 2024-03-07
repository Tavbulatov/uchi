# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :students, controllers: { sessions: 'students/sessions',
                                       registrations: 'students/registrations' }

end
