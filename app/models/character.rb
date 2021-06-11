# frozen_string_literal: true

class Character < ApplicationRecord
  has_many :aspects, -> { order(position: :asc) }, as: :aspected, dependent: :destroy
  has_many :skills, -> { order(level: :desc, name: :asc) }, dependent: :destroy

  validates :name, presence: true
  validates :fate_points, presence: true
  validates :refresh, presence: true
  validates_associated :aspects
  validates_associated :skills
end
