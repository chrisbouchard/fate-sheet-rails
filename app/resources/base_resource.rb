# frozen_string_literal: true

class BaseResource < JSONAPI::Resource
  include JSONAPI::Authorization::PunditScopedResource
  abstract
end
