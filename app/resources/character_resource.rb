# frozen_string_literal: true

class CharacterResource < BaseResource
  include HasAttachment

  attributes :name, :fate_points, :refresh

  has_one_attached :portrait, variants: [:sheet, :thumbnail]

  has_many :aspects
  has_many :skills
  has_many :stress_tracks
  has_one :world

  filter :name
end
