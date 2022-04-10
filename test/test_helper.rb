# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/autorun"
require "webmock/minitest"

Dir[Rails.root.join("test/support/**/*")].each { |f| require f }

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

# TODO: This changed a lot. Update relevant tests.
class ResourceIntegrationTest < ActionDispatch::IntegrationTest
  include Auth0IntegrationHelpers

  setup do
    ActionDispatch::IntegrationTest.register_encoder :api_json,
      param_encoder: ->(params) { params.to_json },
      response_parser: ->(body) { JSON.parse(body) }
  end
end
