class AddLayoutToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :layout, :string, :default => "default"
  end
end
