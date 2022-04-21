# frozen_string_literal: true

require "test_helper"

module Characters
  class UpdateTest < ResourceIntegrationTest
    setup do
      generate_auth0_jwk
      stub_auth0_jwks_request

      @character = characters(:alice)
    end

    test "should update character" do
      skip "Not implemented yet"

      generate_auth0_access_token users(:one), duration: 1.hour

      patch character_url(@character),
        params: { character: {} },
        as: :api_json,
        headers: auth0_headers

      assert_response 200
    end
  end
end
