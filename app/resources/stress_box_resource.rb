# frozen_string_literal: true

class StressBoxResource < BaseResource
  attributes :checked, :level
  has_one :stress_track
end
