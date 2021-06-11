# frozen_string_literal: true

class AspectedResource < JSONAPI::Resource
  # This resource must exist becuase AspectResource uses
  #
  #     has_one :aspected, polymorphic: true
  #
  # However, this resource is not intended to be used as a top-level resource.

  abstract
end
