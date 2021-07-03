# frozen_string_literal: true

JSONAPI.configure do |config|
  config.default_processor_klass = JSONAPI::Authorization::AuthorizingProcessor

  config.exception_class_whitelist = [
    # We'll rescue these in the controller for a better error response.
    JWT::DecodeError,
    Pundit::NotAuthorizedError
  ]

  config.resource_cache = Rails.cache

  config.default_paginator = :paged
  config.top_level_meta_include_record_count = true
  config.top_level_meta_include_page_count = true

  # TODO: These lines can be enabled once we upgrade to 0.10.
  # config.include_backtraces_in_errors = false
  # config.include_application_backtraces_in_errors = false

  config.always_include_to_one_linkage_data = true
  config.always_include_to_many_linkage_data = true

  config.use_relationship_reflection = true
end
