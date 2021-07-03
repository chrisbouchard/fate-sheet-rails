# frozen_string_literal: true

Rails.application.routes.draw do
  jsonapi_resources :characters
  jsonapi_resources :users
  jsonapi_resources :worlds
end
