class Attachment < ActiveRecord::Base
  
  mount_uploader :file, AttachmentUploader
  
  belongs_to :attachable, polymorphic: true
  
  attr_accessible :description, :file, :attachable_id, :attachable_type
end
