# frozen_string_literal: true

class World < ApplicationRecord
  has_many :aspects,
    as: :aspected,
    dependent: :destroy,
    inverse_of: :aspected
  has_many :characters

  has_many :memberships,
    dependent: :destroy
  has_many :users,
    through: :memberships,
    inverse_of: :worlds

  validates :name, presence: true

  def self.for_user(user)
    joins(:memberships).merge(Membership.for_user(user))
  end
end
