# frozen_string_literal: true

class StressBox < ApplicationRecord
  belongs_to :stress_track
  acts_as_list scope: :stress_track

  validates :checked, inclusion: [true, false]
  validates :level, presence: true
end
