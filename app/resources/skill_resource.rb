class SkillResource < JSONAPI::Resource
  attributes :name, :level
  has_one :character
end
