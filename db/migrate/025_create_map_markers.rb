class CreateMapMarkers < ActiveRecord::Migration
  def self.up
    create_table :map_markers do |t|
      t.datetime :timestamp
      t.decimal :longitude
      t.decimal :latitude
      t.timestamps
    end
  end

  def self.down
    drop_table :map_markers
  end
end
