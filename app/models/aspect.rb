class Aspect < ApplicationRecord
  belongs_to :character
  acts_as_list scope: :character

  validates :character, presence: true
end
