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

  test "should create character" do
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

  test "should update character" do
    generate_auth0_access_token users(:one), duration: 1.hour

    patch character_url(@character),
      params: { character: {} },
      as: :api_json,
      headers: auth0_headers

    assert_response 200
  end

  test "should destroy character" do
    generate_auth0_access_token users(:one), duration: 1.hour

    assert_difference("Character.count", -1) do
      delete character_url(@character),
        as: :api_json,
        headers: auth0_headers
    end

    assert_response 204
  end
end
