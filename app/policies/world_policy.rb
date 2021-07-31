# frozen_string_literal: true

class WorldPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
