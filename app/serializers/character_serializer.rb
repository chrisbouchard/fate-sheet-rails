class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :fate_points, :refresh
end
