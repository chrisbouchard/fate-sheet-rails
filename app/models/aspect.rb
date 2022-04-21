# frozen_string_literal: true

class Aspect < ApplicationRecord
  belongs_to :aspected, polymorphic: true
  belongs_to :character,
    -> { where(aspects: { aspected_type: "Character" }).includes(:aspects) },
    foreign_key: "aspected_id",
    optional: true
  belongs_to :world,
    -> { where(aspects: { aspected_type: "World" }).includes(:aspects) },
    foreign_key: "aspected_id",
    optional: true

  acts_as_list scope: :aspected

  validates :aspected, presence: true

  def self.for_user(user)
    [
      joins(:character).merge(Character.for_user(user)),
      joins(:world).merge(World.for_user(user)),
    ].inject(:union_all)
  end
end
