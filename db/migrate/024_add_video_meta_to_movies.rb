class AddVideoMetaToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :video_meta, :text
  end
end
