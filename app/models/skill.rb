# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :character

  validates :character, presence: true

  validates :level,
    numericality: { only_integer: true },
    presence: true

  validates :name,
    presence: true,
    uniqueness: { scope: :character }

  def self.for_user(user)
    joins(:character).merge(Character.for_user(user))
  end
end
