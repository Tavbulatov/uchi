# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :students, controllers: { sessions: 'students/sessions',
                                       registrations: 'students/registrations' }

  resources :schools, only: %i[] do
    resources :classrooms, only: :index do
      resources :students, only: %i[index]
    end
  end
end
