# frozen_string_literal: true

class UserResource < BaseResource
  attributes :name, :short_name
  has_many :memberships
  has_many :worlds

  filter :name
end
