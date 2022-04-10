# frozen_string_literal: true

require "test_helper"

class SkillsControllerTest < ResourceIntegrationTest
  setup do
    generate_auth0_jwk
    stub_auth0_jwks_request

    @skill = skills(:alice_resources)
  end

  test "should get index" do
    generate_auth0_access_token users(:one), duration: 1.hour

    get skills_url,
      as: :api_json,
      headers: auth0_headers

    assert_response :success
    assert_not_empty response.parsed_body["data"]
  end

  test "should show skill" do
    generate_auth0_access_token users(:one), duration: 1.hour

    get skill_url(@skill),
      as: :api_json,
      headers: auth0_headers

    assert_response :success
  end
end
