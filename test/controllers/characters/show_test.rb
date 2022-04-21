# frozen_string_literal: true

require "test_helper"

module Characters
  class IndexTest < ResourceIntegrationTest
    setup do
      generate_auth0_jwk
      stub_auth0_jwks_request
    end

    [
      [:one, :alice],
      [:one, :bob],
      [:one, :chris],
      [:two, :chris],
    ].each do |user_key, character_key|
      test "should show character #{character_key} for user #{user_key}" do
        generate_auth0_access_token users(user_key), duration: 1.hour

        get character_url(characters(character_key)),
          as: :api_json,
          headers: auth0_headers

        assert_response :success
      end
    end

    [
      [:two, :alice],
      [:two, :bob],
    ].each do |user_key, character_key|
      test "should not show character #{character_key} for user #{user_key} in a different world" do
        generate_auth0_access_token users(user_key), duration: 1.hour

        get character_url(characters(character_key)),
          as: :api_json,
          headers: auth0_headers

        assert_response :not_found
      end
    end

    [:alice, :bob, :chris].each do |character_key|
      test "should not show character #{character_key} without a token" do
        get character_url(characters(character_key)),
          as: :api_json

        assert_response 401
      end

      test "should not show character #{character_key} with an invalid token" do
        override_auth0_access_token "not-a-valid-token"

        get character_url(characters(character_key)),
          as: :api_json,
          headers: auth0_headers

        assert_response 401
      end
    end
  end
end
