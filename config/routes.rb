# frozen_string_literal: true

Rails.application.routes.draw do
  jsonapi_resources :aspects
  jsonapi_resources :characters
  jsonapi_resources :skills
  jsonapi_resources :stress_boxes
  jsonapi_resources :stress_tracks
  jsonapi_resources :users
  jsonapi_resources :worlds
end
