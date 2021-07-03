# frozen_string_literal: true

class SkillResource < BaseResource
  attributes :name, :level
  has_one :character

  filters :name, :level
end
