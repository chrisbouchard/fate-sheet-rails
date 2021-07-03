# frozen_string_literal: true

class BaseResourceController < ApplicationController
  include JSONAPI::ActsAsResourceController
  include Auth0Authenticated

  rescue_from JWT::DecodeError, with: :user_not_authenticated
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def context
    { user: current_user }
  end

  private

  def user_not_authenticated
    head :unauthorized
  end

  def user_not_authorized
    head :forbidden
  end
end
