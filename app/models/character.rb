class Character < ApplicationRecord
  has_many :aspects, -> { order(position: :asc) }, dependent: :destroy
  has_many :skills, -> { order(level: :desc, name: :asc) }, dependent: :destroy
end
