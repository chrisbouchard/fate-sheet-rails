# frozen_string_literal: true

class Aspect < ApplicationRecord
  belongs_to :aspected, polymorphic: true

  # We use this self-reference to allow direct access to the aspected character
  # or world. Since there may not actually be an aspect in the query (e.g., if
  # we are looking up the character for a loaded aspect), we need to join to
  # aspect to get the polymorphic type.
  #
  # An unfortunate side-effect is that *all* queries using these associations
  # will involve a join on aspects, even if aspects is already in the query. I
  # couldn't find a reasonable way around this.
  has_one :self_ref,
    class_name: name,
    foreign_key: :id

  # Make self_ref private, because no-one should be touching that. It only
  # exists as an implementation detail for the various aspected associations.
  private :self_ref,
    :self_ref=,
    :build_self_ref,
    :create_self_ref,
    :create_self_ref!,
    :reload_self_ref

  # We should have one association here for each type of "aspected" entity.
  has_one :character,
    through: :self_ref,
    source: :aspected,
    source_type: "Character"
  has_one :world,
    through: :self_ref,
    source: :aspected,
    source_type: "World"

  acts_as_list scope: :aspected

  validates :aspected, presence: true

  def self.for_user(user)
    [
      joins(:character).merge(Character.for_user(user)),
      joins(:world).merge(World.for_user(user)),
    ].inject(:union)
  end
end
