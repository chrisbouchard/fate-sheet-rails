# frozen_string_literal: true

class CharacterPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
