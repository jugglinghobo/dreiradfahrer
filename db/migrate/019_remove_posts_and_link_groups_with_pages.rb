class RemovePostsAndLinkGroupsWithPages < ActiveRecord::Migration
  def self.up
    drop_table :posts
    rename_column :pages, :post_id, :group_id
  end

  def self.down
    rename_column :pages, :group_id, :post_id
    create_table :posts
  end
end
