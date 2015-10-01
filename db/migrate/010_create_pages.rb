class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.references :post
      t.integer :number
      t.string :layout
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
