# frozen_string_literal: true

module Auth0
  module Jwk
    def self.well_known
      WellKnownStrategy.new
    end

    def self.fixed(keys)
      FixedStrategy.new keys
    end

    def self.none
      NoneStrategy.new
    end
  end
end
