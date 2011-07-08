class AddToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :ht_css, :string
  end

  def self.down
    remove_column :admins, :ht_css
  end
end
