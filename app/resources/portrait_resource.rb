# frozen_string_literal: true

class PortraitResource < AttachmentResource
  attachment_name :portrait
  variants :sheet, :thumbnail
end
