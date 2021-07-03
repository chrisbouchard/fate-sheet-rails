# frozen_string_literal: true

module Auth0Authenticated
  extend ActiveSupport::Concern

  def current_user
    token_id = auth_token.first['sub']
    @current_user ||= User.create_or_find_by! auth0_id: token_id
  end

  private

  def http_token
    request.authorization.split(' ').last if request.authorization.present?
  end

  def auth_token
    JsonWebToken.verify http_token
  end
end
