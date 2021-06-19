# frozen_string_literal: true

class MembershipResource < JSONAPI::Resource
  has_one :user
  has_one :world
end
