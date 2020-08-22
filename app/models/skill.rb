class Skill < ApplicationRecord
  belongs_to :character

  validates :level, presence: true, numericality: { only_integer: true }
  validates :name, presence: true, uniqueness: { scope: :character }
  validates :character, presence: true
end
