# frozen_string_literal: true

require "test_helper"

class CharactersControllerTest < ResourceIntegrationTest
  setup do
    generate_auth0_jwk
    stub_auth0_jwks_request

    @character = characters(:alice)
  end

  test "should get index" do
    generate_auth0_access_token users(:one), duration: 1.hour

    get characters_url,
      as: :api_json,
      headers: auth0_headers

    assert_response :success
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

  test "should show character" do
    generate_auth0_access_token users(:one), duration: 1.hour

    get character_url(@character),
      as: :api_json,
      headers: auth0_headers

    assert_response :success
  end

  test "should not show a character for a user in a different world" do
    generate_auth0_access_token users(:two), duration: 1.hour

    get character_url(@character),
      as: :api_json,
      headers: auth0_headers

    assert_response :not_found
  end

  test "should reject show without a token" do
    get character_url(@character),
      as: :api_json

    assert_response 401
  end

  test "should reject show with an invalid token" do
    override_auth0_access_token "not-a-valid-token"

    get character_url(@character),
      as: :api_json,
      headers: auth0_headers

    assert_response 401
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
