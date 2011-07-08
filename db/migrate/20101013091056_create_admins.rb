class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :ht_head_repeat
      t.string :ht_head_name
      t.string :ht_head_links
      t.string :ht_left_repeat
      t.string :ht_left_name
      t.string :ht_left_links
      t.string :ht_right_repeat
      t.string :ht_right_name
      t.string :ht_right_links
      t.string :ht_url

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
