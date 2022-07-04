# frozen_string_literal: true

module ActiveStorage
  class AttachmentPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end
  end
end
