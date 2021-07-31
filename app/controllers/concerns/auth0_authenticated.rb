# frozen_string_literal: true

module Auth0Authenticated
  extend ActiveSupport::Concern

  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_reader :current_auth0_id, :current_user

  def authenticate_with_auth0_token!
    @current_user = authenticate_or_request_with_http_token(&method(:authenticate))
  end

  def authenticate_with_auth0_token
    @current_user = authenticate_with_http_token(&method(:authenticate))
  end

  private

  def authenticate(http_token, _options)
    authenticator = Auth0Authenticator.new(http_token)
    @current_auth0_id = authenticator.auth0_id

    User.create_or_find_by! auth0_id: @current_auth0_id
  end
end
