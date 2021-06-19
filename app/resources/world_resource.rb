# frozen_string_literal: true

class WorldResource < JSONAPI::Resource
  attributes :name, :description
  has_many :aspects
  has_many :characters
  has_many :memberships
  has_many :users

  filter :name
end
