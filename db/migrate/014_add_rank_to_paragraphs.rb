class AddRankToParagraphs < ActiveRecord::Migration
  def change
    add_column :paragraphs, :rank, :integer
  end
end
