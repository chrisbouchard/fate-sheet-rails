class AspectResource < JSONAPI::Resource
  attributes :name, :label
  has_one :aspected, polymorphic: true
end
