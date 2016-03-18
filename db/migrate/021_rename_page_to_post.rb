class RenamePageToPost < ActiveRecord::Migration
  def self.up
    rename_table :pages, :posts
    rename_column :paragraphs, :page_id, :post_id
    rename_column :photos, :page_id, :post_id
  end

  def self.down
    rename_column :paragraphs, :post_id, :page_id
    rename_column :photos, :post_id, :page_id
    rename_table :posts, :pages
  end
end
