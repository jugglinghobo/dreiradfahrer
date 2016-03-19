class Photo < ActiveRecord::Base
  include Paperclip::Glue

  belongs_to :post
  has_attached_file :picture, styles: { small: "200x200>", medium: "350x350>", large: "700x700>" }, path: "public/system/photos/:style/:id.:extension", :url => "/system/photos/:style/:id.:extension"

  # Explicitly do not validate
  do_not_validate_attachment_file_type :picture
end
