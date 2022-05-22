# frozen_string_literal: true

class Character < ApplicationRecord
  has_many :aspects,
    as: :aspected,
    dependent: :destroy,
    inverse_of: :aspected
  has_many :skills,
    dependent: :destroy
  has_many :stress_tracks,
    dependent: :destroy

  belongs_to :world

  has_one_attached :portrait do |attachable|
    attachable.variant :sheet, resize_to_limit: [400, 800]
    attachable.variant :thumbnail, resize_to_fill: [400, 400, { crop: :attention }]
  end

  validates :name, presence: true
  validates :fate_points, :power_level, :refresh, :skill_points,
    numericality: { greater_than_or_equal_to: 0, only_integer: true },
    allow_nil: true

  def self.for_user(user)
    joins(:world).merge(World.for_user(user))
  end
end
