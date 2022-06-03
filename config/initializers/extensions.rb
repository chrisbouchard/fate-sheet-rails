# frozen_string_literal: true

ActiveSupport.on_load(:active_storage_attachment) do
  ActiveStorage::Attachment.include CoreExtensions::ActiveStorage::Attachment::ForUser
end
