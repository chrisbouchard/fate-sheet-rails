class Character < ApplicationRecord
  has_many :aspects, -> { order(position: :asc) }, dependent: :destroy, inverse_of: :character
  has_many :skills, -> { order(level: :desc, name: :asc) }, dependent: :destroy, inverse_of: :character

  validates :name, presence: true
  validates :fate_points, presence: true
  validates :refresh, presence: true
  validates_associated :aspects
  validates_associated :skills
end
