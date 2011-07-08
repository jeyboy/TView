class RemoveColumFromAdmin < ActiveRecord::Migration
  def self.up
    remove_column :admins, :ht_head_repeat
    remove_column :admins, :ht_head_name
    remove_column :admins, :ht_head_links
    remove_column :admins, :ht_left_repeat
    remove_column :admins, :ht_left_name
    remove_column :admins, :ht_left_links
    remove_column :admins, :ht_right_repeat
    remove_column :admins, :ht_right_name
    remove_column :admins, :ht_right_links
    remove_column :admins, :ht_css
    remove_column :admins, :ht_bg_body
  end

  def self.down
    add_column :admins, :ht_bg_body, :string
    add_column :admins, :ht_css, :string
    add_column :admins, :ht_right_links, :string
    add_column :admins, :ht_right_name, :string
    add_column :admins, :ht_right_repeat, :string
    add_column :admins, :ht_left_links, :string
    add_column :admins, :ht_left_name, :string
    add_column :admins, :ht_left_repeat, :string
    add_column :admins, :ht_head_links, :string
    add_column :admins, :ht_head_name, :string
    add_column :admins, :ht_head_repeat, :string
  end
end
