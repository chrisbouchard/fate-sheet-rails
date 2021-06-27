# frozen_string_literal: true

module Auth0Authenticated
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request!
  end

  def current_user
    token_id = auth_token['sub']
    @current_user ||= User.create_or_find_by! auth0_id: token_id
  end

  private

  def authenticate_request!
    logger.info auth_token
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def http_token
    request.authorization.split(' ').last if request.authorization.present?
  end

  def auth_token
    JsonWebToken.verify http_token
  end
end
