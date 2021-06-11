# frozen_string_literal: true

Rails.application.routes.draw do
  jsonapi_resources :skills
  jsonapi_resources :aspects
  jsonapi_resources :characters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
