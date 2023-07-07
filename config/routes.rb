# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pets
      resources :owners
      resources :doctors
    end
  end
end
