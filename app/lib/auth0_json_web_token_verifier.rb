# frozen_string_literal: true

require 'net/http'
require 'uri'

class Auth0JsonWebTokenVerifier
  def initialize(api_identifier:, domain:)
    @api_identifier = api_identifier
    @domain = domain
  end

  def decode_and_verify(token)
    JWT.decode token, nil, true, {
      algorithms: ['RS256'],
      jwks: method(:load_jwks),
      iss: @domain,
      verify_iss: true,
      aud: @api_identifier,
      verify_aud: true
    }
  end

  private

  def load_jwks(options)
    @load_jwks = nil if options[:invalidate]
    @load_jwks ||= fetch_jwks
  end

  def fetch_jwks
    jwks_raw = Net::HTTP.get URI("#{@domain}.well-known/jwks.json")
    JSON.parse(jwks_raw, { symbolize_names: true })
  end
end
