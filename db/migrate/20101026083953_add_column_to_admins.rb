class AddColumnToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :ht_bg_body, :string
  end

  def self.down
    remove_column :admins, :ht_bg_body
  end
end
