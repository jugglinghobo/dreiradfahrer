class AddTitleToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.string :title
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove :title
    end
  end
end
