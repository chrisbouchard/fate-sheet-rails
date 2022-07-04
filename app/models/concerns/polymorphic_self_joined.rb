module PolymorphicSelfJoined
  extend ActiveSupport::Concern

  included do
    # We use this self-reference to allow direct access to the aspected character
    # or world. Since there may not actually be an aspect in the query (e.g., if
    # we are looking up the character for a loaded aspect), we need to join to
    # aspect to get the polymorphic type.
    #
    # An unfortunate side-effect is that *all* queries using these associations
    # will involve a join on aspects, even if aspects is already in the query. I
    # couldn't find a reasonable way around this.
    has_one :self_join,
      class_name: name,
      foreign_key: :id

    # Make self_ref private, because no-one should be touching that. It only
    # exists as an implementation detail for the various aspected associations.
    private :self_join,
      :self_join=,
      :build_self_join,
      :create_self_join,
      :create_self_join!,
      :reload_self_join
  end

  module ClassMethods
    def has_one_through_self(name, *args, **kwargs) # rubocop:disable Naming/PredicateName
      has_one name,
        *args,
        source_type: name.capitalize,
        **kwargs,
        through: :self_join
    end

    def has_many_through_self(name, *args, **kwargs) # rubocop:disable Naming/PredicateName
      has_many name,
        *args,
        source_type: name.capitalize,
        **kwargs,
        through: :self_join
    end
  end
end
