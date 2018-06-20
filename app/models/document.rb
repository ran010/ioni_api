class Document < ApplicationRecord
  belongs_to :project
  mount_uploader :document, DocumentUploader
  mount_base64_uploader :document, DocumentUploader

end
