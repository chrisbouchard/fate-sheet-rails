# frozen_string_literal: true

class CharacterResource < JSONAPI::Resource
  attributes :name, :fate_points, :refresh
  has_many :aspects
  has_many :skills
  has_one :world

  filter :name
end
