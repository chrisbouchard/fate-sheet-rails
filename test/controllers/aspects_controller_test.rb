# frozen_string_literal: true

require "test_helper"

class AspectsControllerTest < ResourceIntegrationTest
  setup do
    generate_auth0_jwk
    stub_auth0_jwks_request

    @aspect = aspects(:alice_high_concept)
  end

  test "should get index" do
    generate_auth0_access_token users(:one), duration: 1.hour

    get aspects_url,
      as: :api_json,
      headers: auth0_headers

    assert_response :success
  end

  test "should create aspect" do
    generate_auth0_access_token users(:one), duration: 1.hour

    assert_difference("Aspect.count") do
      post aspects_url,
        params: { aspect: {} },
        as: :api_json,
        headers: auth0_headers
    end

    assert_response 201
  end

  test "should show aspect" do
    generate_auth0_access_token users(:one), duration: 1.hour

    get aspect_url(@aspect),
      as: :api_json,
      headers: auth0_headers

    assert_response :success
  end

  test "should update aspect" do
    generate_auth0_access_token users(:one), duration: 1.hour

    patch aspect_url(@aspect),
      params: { aspect: {} },
      as: :api_json,
      headers: auth0_headers

    assert_response 200
  end

  test "should destroy aspect" do
    generate_auth0_access_token users(:one), duration: 1.hour

    assert_difference("Aspect.count", -1) do
      delete aspect_url(@aspect),
        as: :api_json,
        headers: auth0_headers
    end

    assert_response 204
  end
end
