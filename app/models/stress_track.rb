# frozen_string_literal: true

class StressTrack < ApplicationRecord
  belongs_to :character
  has_many :stress_boxes, dependent: :destroy
  acts_as_list scope: :character

  validates :name, presence: true
end
