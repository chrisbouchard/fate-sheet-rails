# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :world

  validates :user, presence: true
  validates :world, presence: true
end
