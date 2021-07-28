# frozen_string_literal: true

class Character < ApplicationRecord
  has_many :aspects, as: :aspected, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :stress_tracks, dependent: :destroy

  belongs_to :world

  validates :name, presence: true
  validates :fate_points, presence: true
  validates :refresh, presence: true
  validates_associated :aspects
  validates_associated :skills
end
