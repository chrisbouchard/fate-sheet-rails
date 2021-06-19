# frozen_string_literal: true

Rails.application.routes.draw do
  jsonapi_resources :aspects
  jsonapi_resources :characters
  jsonapi_resources :memberships
  jsonapi_resources :skills
  jsonapi_resources :users
  jsonapi_resources :worlds
end
