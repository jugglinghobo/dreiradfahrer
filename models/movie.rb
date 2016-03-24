class Movie < ActiveRecord::Base
  include Paperclip::Glue

  has_attached_file(
    :video,
    # :source_file_options => {
    #   :all => 'auto-orient',
    # },
    :styles => {
      :original => {},
      :mp4 => { :geometry => "640x480#", :format => 'mp4' },
      :thumb => { :geometry => "300x200#", :format => 'jpg', :time => 2 }
    },
    path: "public/system/movies/:style/:id.:extension",
    :url => "/system/movies/:style/:id.:extension",
    :processors => [:transcoder]
  )

  # Explicitly do not validate
  do_not_validate_attachment_file_type :video
end
