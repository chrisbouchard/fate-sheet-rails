# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/autorun'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

class ResourceControllerTest < ActionDispatch::IntegrationTest
  FAKE_AUTH0_TOKEN = 'fake.auth0.token'

  setup do
    ActionDispatch::IntegrationTest.register_encoder :api_json,
      param_encoder: ->(params) { params.to_json },
      response_parser: ->(body) { JSON.parse(body) }
  end

  # Create a mock for the Auth0 authenticator and stub it.
  def mock_auth0(auth0_id_or_user)
    authenticator = Minitest::Mock.new

    if auth0_id_or_user.respond_to? :auth0_id
      authenticator.expect :auth0_id, auth0_id_or_user.auth0_id
    elsif !auth0_id_or_user.nil?
      authenticator.expect :auth0_id, auth0_id_or_user
    end

    Auth0Authenticator.stub :new, authenticator do
      yield authenticator
    end
  end

  # Set headers required by the API.
  def auth0_headers(token: FAKE_AUTH0_TOKEN)
    { 'Authorization': "Bearer #{token}" }
  end
end
