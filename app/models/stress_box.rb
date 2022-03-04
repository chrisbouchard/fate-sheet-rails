# frozen_string_literal: true

class StressBox < ApplicationRecord
  belongs_to :stress_track

  acts_as_list scope: :stress_track

  validates :stress_track, presence: true

  validates :checked, inclusion: [true, false]
  validates :level,
    numericality: { greater_than_or_equal_to: 1, only_integer: true },
    allow_nil: true

  def self.for_user(user)
    joins(:stress_track).merge(StressTrack.for_user(user))
  end
end
