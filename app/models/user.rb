class User < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :worlds, through: :memberships, inverse_of: :users

  validates :name, presence: true
  validates :short_name, presence: true
end
