class Movie < ActiveRecord::Base
  include Paperclip::Glue

  has_attached_file(
    :video,
    :styles => {
      :mp4 => { :geometry => "640x480#", :format => 'mp4' },
      :poster => { :geometry => "640x480#", :format => 'jpg', :time => 2 }
    },
    path: "public/system/movies/:style/:id.:extension",
    :url => "/system/movies/:style/:id.:extension",
    :processors => [:transcoder]
  )

  # Explicitly do not validate
  do_not_validate_attachment_file_type :video
end
