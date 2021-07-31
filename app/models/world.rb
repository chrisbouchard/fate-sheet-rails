# frozen_string_literal: true

class World < ApplicationRecord
  has_many :aspects, as: :aspected, dependent: :destroy
  has_many :characters

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, inverse_of: :worlds

  validates :name, presence: true
  validates_associated :aspects

  scope :for_user, ->(user) { joins(:users).where(users: { id: user.id }) }
end
