# frozen_string_literal: true

class AspectPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
