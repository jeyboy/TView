class CreateCssColors < ActiveRecord::Migration
  def self.up
    create_table :css_colors do |t|
      t.integer :group_id
      t.string :img_color
      t.string :url_color
      t.string :css_img_folder

      t.timestamps
    end
  end

  def self.down
    drop_table :css_colors
  end
end
