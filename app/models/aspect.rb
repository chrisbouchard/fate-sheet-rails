class Aspect < ApplicationRecord
  belongs_to :aspected, polymorphic: true
  acts_as_list scope: :aspected

  validates :aspected, presence: true
end
