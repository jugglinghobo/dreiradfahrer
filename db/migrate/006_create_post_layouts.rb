class CreatePostLayouts < ActiveRecord::Migration
  def self.up
    create_table :post_layouts do |t|
      t.references :post
      t.timestamps
    end
  end

  def self.down
    drop_table :post_layouts
  end
end
