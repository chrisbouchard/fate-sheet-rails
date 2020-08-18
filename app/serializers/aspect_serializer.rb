class AspectSerializer < ActiveModel::Serializer
  attributes :id, :name, :label

  belongs_to :character
end
