# frozen_string_literal: true

require "open-uri"

module Auth0
  module Jwk
    class WellKnownStrategy
      attr_initialize [:well_known_uri]

      def loader
        lambda do |options|
          @loader = nil if options[:invalidate]
          @loader ||= fetch_jwks
        end
      end

      private

      def well_known_uri
        @well_known_uri ||= Auth0.configuration.well_known_uri
      end

      def fetch_jwks
        URI.parse(well_known_uri).open do |jwks_file|
          JSON.parse jwks_file.read
        end
      end
    end
  end
end
