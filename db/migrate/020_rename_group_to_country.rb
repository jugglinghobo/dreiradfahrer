class RenameGroupToCountry < ActiveRecord::Migration
  def self.up
    rename_table :groups, :countries
    rename_column :pages, :group_id, :country_id
  end

  def self.down
    rename_column :pages, :country_id, :group_id
    rename_table :countries, :groups
  end
end
