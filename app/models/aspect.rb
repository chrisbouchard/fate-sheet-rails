# frozen_string_literal: true

class Aspect < ApplicationRecord
  include PolymorphicSelfJoined

  belongs_to :aspected, polymorphic: true

  # We should have one association here for each type of "aspected" entity.
  has_one_through_self :character, source: :aspected
  has_one_through_self :world, source: :aspected

  acts_as_list scope: :aspected

  validates :aspected, presence: true

  def self.for_user(user)
    [
      joins(:character).merge(Character.for_user(user)),
      joins(:world).merge(World.for_user(user)),
    ].inject(:union)
  end
end
