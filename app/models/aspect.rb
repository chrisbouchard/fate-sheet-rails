class Aspect < ApplicationRecord
  belongs_to :character
  acts_as_list scope: :character
end
