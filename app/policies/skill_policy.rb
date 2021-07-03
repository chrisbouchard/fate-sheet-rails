# frozen_string_literal: true

class SkillPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
end
