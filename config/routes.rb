# frozen_literal_string: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pets
      resources :owners
    end
  end
end
