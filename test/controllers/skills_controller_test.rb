# frozen_string_literal: true

require 'test_helper'

class SkillsControllerTest < ResourceControllerTest
  setup do
    @skill = skills(:alice_resources)
  end

  test 'should get index' do
    mock_auth0 users(:one) do
      get skills_url,
        as: :api_json,
        headers: auth0_headers
    end

    assert_response :success
    assert_not_empty response.parsed_body['data']
  end

  test 'should show skill' do
    mock_auth0 users(:one) do
      get skill_url(@skill),
        as: :api_json,
        headers: auth0_headers
    end

    assert_response :success
  end
end
