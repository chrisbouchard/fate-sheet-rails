# frozen_string_literal: true

class MembershipResource < BaseResource
  has_one :user
  has_one :world
end
