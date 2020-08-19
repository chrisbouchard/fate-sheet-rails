class BaseResourceController < ActionController::API
  include JSONAPI::ActsAsResourceController
  #skip_forgery_protection
end

