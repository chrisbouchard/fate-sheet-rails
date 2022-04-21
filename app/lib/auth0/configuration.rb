# frozen_string_literal: true

module Auth0
  class Configuration
    attr_accessor_initialize [
      :algorithm,
      :api_identifier,
      :domain,
      :key,
      :well_known_uri,
      { jwks: Auth0::Jwk.well_known },
    ]
  end
end
