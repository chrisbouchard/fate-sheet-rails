# frozen_string_literal: true

require "test_helper"

class AspectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aspect = aspects(:one)
  end

  test "should get index" do
    get aspects_url, as: :json
    assert_response :success
  end

  test "should create aspect" do
    assert_difference("Aspect.count") do
      post aspects_url, params: { aspect: {} }, as: :json
    end

    assert_response 201
  end

  test "should show aspect" do
    get aspect_url(@aspect), as: :json
    assert_response :success
  end

  test "should update aspect" do
    patch aspect_url(@aspect), params: { aspect: {} }, as: :json
    assert_response 200
  end

  test "should destroy aspect" do
    assert_difference("Aspect.count", -1) do
      delete aspect_url(@aspect), as: :json
    end

    assert_response 204
  end
end
