# frozen_string_literal: true

class AspectedsController < ApplicationController
  # This controller must exist becuase AspectResource uses
  #
  #     has_one :aspected, polymorphic: true
  #
  # However, this controller is not intended to be routable.
end
