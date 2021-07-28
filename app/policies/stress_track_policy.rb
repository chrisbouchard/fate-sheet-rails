# frozen_string_literal: true

class StressTrackPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
