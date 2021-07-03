# frozen_string_literal: true

class WorldPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.joins(:users).where(users: { id: user.id })
    end
  end
end
