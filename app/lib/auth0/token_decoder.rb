# frozen_string_literal: true

module Auth0
  class TokenDecoder
    attr_initialize [:configuration]

    def decode_id(token)
      token = decode token
      token[0]["sub"]
    end

    def decode(token)
      JWT.decode token, jwt_key, true, jwt_options
    end

    private

    def configuration
      @configuration ||= Auth0.configuration
    end

    def jwt_key
      configuration.key
    end

    def jwt_options
      {
        algorithms: [configuration.algorithm],
        jwks: configuration.jwks.loader,
        iss: configuration.domain,
        verify_iss: true,
        aud: configuration.api_identifier,
        verify_aud: true
      }
    end
  end
end
