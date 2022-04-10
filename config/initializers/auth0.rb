# frozen_string_literal: true

Rails.application.config.to_prepare do
  Auth0.configure do |config|
    if Rails.env.test?
      config.algorithm = "RS256"
      config.api_identifier = "test-identifier"
      config.domain = "https://example.org/"
      config.well_known_uri = "https://example.org/.well-known/jwks.json"
    else
      auth0_creds = Rails.application.credentials.auth0

      config.algorithm = auth0_creds.algorithm!
      config.api_identifier = auth0_creds.api_identifier!
      config.domain = auth0_creds.domain!
      config.well_known_uri = auth0_creds.well_known_uri!

      # Key is optional, depending on the algorithm. Normally we'd just use
      # auth0_creds.key, but key is already a method on Hash.
      config.key = auth0_creds[:key]
    end
  end
end
