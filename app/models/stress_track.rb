# frozen_string_literal: true

class StressTrack < ApplicationRecord
  belongs_to :character
  has_many :stress_boxes, dependent: :destroy

  acts_as_list scope: :character

  validates :character, presence: true

  def self.for_user(user)
    joins(:character).merge(Character.for_user(user))
  end
end
