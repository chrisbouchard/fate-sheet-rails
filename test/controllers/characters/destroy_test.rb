# frozen_string_literal: true

require "test_helper"

module Characters
  class DestroyTest < ResourceIntegrationTest
    setup do
      generate_auth0_jwk
      stub_auth0_jwks_request

      @character = characters(:alice)
    end

    test "should destroy character" do
      skip "Not implemented yet"

      generate_auth0_access_token users(:one), duration: 1.hour

      assert_difference("Character.count", -1) do
        delete character_url(@character),
          as: :api_json,
          headers: auth0_headers
      end

      assert_response 204
    end
  end
end
