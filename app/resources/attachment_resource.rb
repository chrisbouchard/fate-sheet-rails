# frozen_string_literal: true

class AttachmentResource < BaseResource
  abstract
  immutable

  def custom_links(options)
    link_builder = options[:serializer].link_builder
    rails_representation_url = link_builder.url_helpers.method(:url_for)

    self.class._variants
      .to_h { |variant| [:"#{variant}_src", @model.variant(variant)] }
      .merge({ src: @model })
      .transform_values(&rails_representation_url)
  end

  class << self
    def inherited(subclass)
      super
      subclass.model_name "ActiveStorage::Attachment"
    end

    def records(options = {})
      super.where(name: @attachment_name)
    end

    def attachment_name(name)
      @attachment_name = name
    end

    def variants(*variants)
      variants.each(&method(:variant))
    end

    def variant(variant)
      @variants ||= []
      @variants.push(variant)
    end

    def _variants
      @variants ||= []
    end
  end
end
