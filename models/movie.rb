class Movie < ActiveRecord::Base
  include Paperclip::Glue

  has_attached_file(
    :video,
    :styles => {
      :medium => { :geometry => "640x480", :format => 'mp4' },
      :thumb => { :geometry => "200x200#", :format => 'jpg', :time => 10 }
    },
    path: "public/system/movies/:style/:id.:extension",
    :url => "/system/movies/:style/:id.:extension",
    :processors => [:transcoder]
  )

  # Explicitly do not validate
  do_not_validate_attachment_file_type :video
end
