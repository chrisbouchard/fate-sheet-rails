# frozen_string_literal: true

module CoreExtensions
  module ActiveStorage
    module Attachment
      # Extension module for the ActiveStorage::Attachment class to add our standard for_user method.
      module ForUser
        extend ActiveSupport::Concern

        include PolymorphicSelfJoined

        included do
          has_one_through_self :character, source: :record
        end

        module ClassMethods
          def for_user
            joins(:character).merge(Character.for_user)
          end
        end
      end
    end
  end
end
