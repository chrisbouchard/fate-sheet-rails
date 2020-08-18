class Character < ApplicationRecord
  has_many :aspects, dependent: :destroy
  has_many :skills, dependent: :destroy
end
