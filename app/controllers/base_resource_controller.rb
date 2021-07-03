# frozen_string_literal: true

class BaseResourceController < ApplicationController
  include JSONAPI::ActsAsResourceController
end
