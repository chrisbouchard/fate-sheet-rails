class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :fate_points, :refresh

  has_many :aspects
  has_many :skills
end
