# frozen_string_literal: true

module Auth0IntegrationHelpers
  attr_reader :auth0_token
  attr_writer :auth0_configuration, :auth0_jwks

  # Reset configuration before each test.
  def before_setup
    @auth0_configuration = nil
    @auth0_jwks = nil
    @auth0_token = nil

    # Calling super will also run the setup method, so we only call it after
    # we've reset everything.
    super
  end

  def auth0_configuration
    @auth0_configuration ||= Auth0.configuration
  end

  def auth0_jwks
    @auth0_jwks ||= []
  end

  def generate_auth0_jwk(keypair: nil, kid: nil)
    keypair ||= OpenSSL::PKey::RSA.new(2048)
    jwk = JWT::JWK.create_from(keypair, kid)

    auth0_jwks << jwk

    jwk
  end

  def stub_auth0_jwks_request
    jwk_response = JSON.generate({ keys: auth0_jwks.map(&:export) })
    stub_request(:get, auth0_configuration.well_known_uri)
      .to_return(body: jwk_response)
  end

  def generate_auth0_access_token(auth0_id_or_user, duration:, jwk: nil)
    jwk ||= auth0_jwks[0]
    headers = { kid: jwk.kid }
    payload = {
      aud: auth0_configuration.api_identifier,
      exp: (Time.now + duration).to_i,
      iss: auth0_configuration.domain,
      sub: extract_auth0_id(auth0_id_or_user)
    }

    @auth0_token = JWT.encode payload, jwk.keypair, auth0_configuration.algorithm, headers
  end

  def override_auth0_access_token(token)
    @auth0_token = token
  end

  def auth0_headers(token = auth0_token)
    { "Authorization": "Bearer #{token}" }
  end

  private

  def extract_auth0_id(auth0_id_or_user)
    if auth0_id_or_user.respond_to? :auth0_id
      auth0_id_or_user.auth0_id
    else
      auth0_id_or_user
    end
  end
end
