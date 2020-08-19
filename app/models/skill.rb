class Skill < ApplicationRecord
  belongs_to :character

  validates :name, presence: true, uniqueness: { scope: :character }
  validates :level, presence: true, numericality: { only_integer: true }
  validates :character, presence: true
end
