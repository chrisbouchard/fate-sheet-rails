# frozen_string_literal: true

module Auth0
  module Jwk
    class FixedStrategy
      attr_initialize :keys

      def loader
        lambda do |options|
          @loader = nil if options[:invalidate]
          @loader ||= key_hash
        end
      end

      private

      def key_hash
        { keys: exported_keys }
      end

      def exported_keys
        @keys.map(&:export)
      end
    end
  end
end
