class AddPageIdToParagraphs < ActiveRecord::Migration
  def change
    add_column :paragraphs, :page_id, :integer
  end
end
