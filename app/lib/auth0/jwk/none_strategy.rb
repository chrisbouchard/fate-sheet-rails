# frozen_string_literal: true

module Auth0
  module Jwk
    class NoneStrategy
      def loader
        nil
      end
    end
  end
end
