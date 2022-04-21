# frozen_string_literal: true

require "test_helper"

module Characters
  class IndexTest < ResourceIntegrationTest
    setup do
      generate_auth0_jwk
      stub_auth0_jwks_request
    end

    [:one, :two].each do |user_key|
      test "should get index for user #{user_key}" do
        generate_auth0_access_token users(user_key), duration: 1.hour

        get characters_url,
          as: :api_json,
          headers: auth0_headers

        assert_response :success
      end
    end

    test "should reject index without a token" do
      get characters_url,
        as: :api_json

      assert_response 401
    end

    test "should reject index with an invalid token" do
      override_auth0_access_token "not-a-valid-token"

      get characters_url,
        as: :api_json,
        headers: auth0_headers

      assert_response 401
    end
  end
end
