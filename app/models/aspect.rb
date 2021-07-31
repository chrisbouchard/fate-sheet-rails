# frozen_string_literal: true

class Aspect < ApplicationRecord
  belongs_to :aspected, polymorphic: true
  belongs_to :character,
             -> { where(aspects: { aspected_type: 'Character' }).includes(:aspects) },
             foreign_key: 'aspected_id',
             inverse_of: 'aspects'
  belongs_to :world,
             -> { where(aspects: { aspected_type: 'World' }).includes(:aspects) },
             foreign_key: 'aspected_id',
             inverse_of: 'aspects'
  acts_as_list scope: :aspected

  validates :aspected, presence: true

  scope :for_user, (lambda do |user|
    joins(:character).merge(Character.for_user(user)).union(joins(:world).merge(World.for_user(user)))
  end)
end
