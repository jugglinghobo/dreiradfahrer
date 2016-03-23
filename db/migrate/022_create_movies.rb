include Paperclip::Schema
class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.references :post
      t.attachment :video
      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
