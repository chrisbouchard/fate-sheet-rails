# frozen_string_literal: true

module Auth0Authenticated
  extend ActiveSupport::Concern

  def current_user
    return unless auth_token.present?

    token_id = auth_token.first['sub']
    @current_user ||= User.create_or_find_by! auth0_id: token_id
  end

  private

  def auth_token
    @auth_token ||= token_verifier.decode_and_verify http_token if http_token.present?
  end

  def http_token
    @http_token ||= request.authorization.split(' ').last if request.authorization.present?
  end

  def token_verifier
    @token_verifier ||= Auth0JsonWebTokenVerifier.new(**Rails.application.credentials.auth0)
  end
end
