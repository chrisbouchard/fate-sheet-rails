# frozen_string_literal: true

class User < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :worlds, through: :memberships, inverse_of: :users
end
