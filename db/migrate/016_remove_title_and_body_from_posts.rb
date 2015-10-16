class RemoveTitleAndBodyFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :body, :text
  end
end
