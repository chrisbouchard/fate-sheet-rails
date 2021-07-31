# frozen_string_literal: true

require 'net/http'
require 'uri'

class Auth0Authenticator
  def initialize(raw_token)
    @api_identifier = auth0_credentials[:api_identifier]
    @domain = auth0_credentials[:domain]
    decode_and_verify raw_token
  end

  attr_reader :token

  def auth0_id
    @token[0]['sub']
  end

  private

  def auth0_credentials
    Rails.application.credentials.auth0
  end

  def decode_and_verify(token)
    @token = JWT.decode token, nil, true, {
      algorithms: ['RS256'],
      jwks: method(:load_jwks),
      iss: @domain,
      verify_iss: true,
      aud: @api_identifier,
      verify_aud: true
    }
  end

  def load_jwks(options)
    @load_jwks = nil if options[:invalidate]
    @load_jwks ||= fetch_jwks
  end

  def fetch_jwks
    jwks_raw = Net::HTTP.get URI("#{@domain}.well-known/jwks.json")
    JSON.parse(jwks_raw, { symbolize_names: true })
  end
end
