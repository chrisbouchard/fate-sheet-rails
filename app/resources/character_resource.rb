# frozen_string_literal: true

class CharacterResource < BaseResource
  attributes :name, :fate_points, :refresh

  has_many :aspects
  has_many :skills
  has_many :stress_tracks
  has_one :world

  has_one :portrait, relation_name: :portrait_attachment

  filter :name
end
