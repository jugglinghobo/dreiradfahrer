class ChangePhotosPostsRefToPages < ActiveRecord::Migration
  def change
    rename_column :photos, :post_id, :page_id
  end
end
