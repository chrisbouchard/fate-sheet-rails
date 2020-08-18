class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :level

  belongs_to :character
end
