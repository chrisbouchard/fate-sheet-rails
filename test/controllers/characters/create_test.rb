# frozen_string_literal: true

require "test_helper"

module Characters
  class CreateTest < ResourceIntegrationTest
    setup do
      generate_auth0_jwk
      stub_auth0_jwks_request

      @character = characters(:alice)
    end

    test "should create character" do
      skip "Not implemented yet"

      generate_auth0_access_token users(:one), duration: 1.hour

      assert_difference("Character.count") do
        post characters_url,
          params: { character: {} },
          as: :api_json,
          headers: auth0_headers
      end

      assert_response 201
    end
  end
end
