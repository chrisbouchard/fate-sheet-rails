# frozen_string_literal: true

class StressTrackResource < BaseResource
  attributes :name
  has_many :stress_boxes
  has_one :character

  filter :name
end
