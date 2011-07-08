class CssTableRemove < ActiveRecord::Migration
  def self.up
    drop_table :css_colors
  end

  def self.down
    create_table :css_colors do |t|
      t.integer :group_id
      t.string :img_color
      t.string :url_color
      t.string :css_img_folder

      t.timestamps
    end
  end
end