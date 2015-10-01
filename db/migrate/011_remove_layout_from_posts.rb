class RemoveLayoutFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :layout, :string
  end
end
