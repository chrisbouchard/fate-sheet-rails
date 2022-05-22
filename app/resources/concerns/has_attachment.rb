# frozen_string_literal: true

module HasAttachment
  extend ActiveSupport::Concern

  def fetchable_fields
    super - self.class._attachments.map { |name| :"#{name}_signed_id" }
  end

  def custom_links(options)
    link_builder = options[:serializer].link_builder
    self.class._attachments
      .map { |name| public_send(:"#{name}_src_links", link_builder) }
      .inject({}, &:merge)
  end

  module ClassMethods
    def _attachments
      @_attachments ||= []
    end

    def has_one_attached( # rubocop:disable Naming/PredicateName
      name,
      relation: name,
      variants: []
    )
      attribute :"#{name}_signed_id"
      define_attachment_links_method(name, relation:, variants:)
      define_signed_id_equals_method(name, relation:)
      _attachments.push(name)
    end

    private

    def define_attachment_links_method(name, relation:, variants:)
      define_method :"#{name}_src_links" do |link_builder|
        rails_representation_url =
          link_builder.url_helpers.method(:rails_representation_url)
        attachment = @model.public_send(relation)

        return {} unless attachment.representable?

        variants
          .to_h { |variant| [:"#{name}_#{variant}_src", attachment.variant(variant)] }
          .merge({ "#{name}_src": attachment })
          .transform_values(&rails_representation_url)
      end
    end

    def define_signed_id_equals_method(name, relation:)
      define_method :"#{name}_signed_id=" do |signed_id|
        @model.public_send(relation).attach(signed_id)
      end
    end
  end
end
