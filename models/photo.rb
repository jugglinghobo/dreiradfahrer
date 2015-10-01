class Photo < ActiveRecord::Base
  include Paperclip::Glue

  belongs_to :post
  has_attached_file :picture, styles: { small: "300x300>" }, path: "system/photos/:style/:id.:extension"

  # Explicitly do not validate
  do_not_validate_attachment_file_type :picture
end
