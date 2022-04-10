# frozen_string_literal: true

module Auth0Authenticated
  extend ActiveSupport::Concern

  include ActionController::HttpAuthentication::Token::ControllerMethods

  attr_reader :current_auth0_id, :current_user
  attr_writer :auth0_token_decoder

  included do
    before_action :authenticate_with_auth0_token!
  end

  def auth0_token_decoder
    @auth0_token_decoder ||= Auth0::TokenDecoder.new
  end

  def authenticate_with_auth0_token!
    @current_user = authenticate_or_request_with_http_token(&method(:authenticate_with_auth0))
  end

  def authenticate_with_auth0_token
    @current_user = authenticate_with_http_token(&method(:authenticate_with_auth0))
  end

  private

  def authenticate_with_auth0(token, _options)
    @current_auth0_id = auth0_token_decoder.decode_id token
    User.create_or_find_by! auth0_id: @current_auth0_id
  end
end
