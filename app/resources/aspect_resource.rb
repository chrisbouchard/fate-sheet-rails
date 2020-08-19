class AspectResource < JSONAPI::Resource
  attributes :name, :label
  has_one :character
end
