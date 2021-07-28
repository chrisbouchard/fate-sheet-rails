# frozen_string_literal: true

class StressBoxPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
