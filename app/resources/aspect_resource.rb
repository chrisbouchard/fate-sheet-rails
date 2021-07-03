# frozen_string_literal: true

class AspectResource < BaseResource
  attributes :name, :label
  has_one :aspected, polymorphic: true

  filter :label
end
