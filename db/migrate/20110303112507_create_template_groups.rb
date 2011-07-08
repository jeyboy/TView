class CreateTemplateGroups < ActiveRecord::Migration
  def self.up
    create_table :template_groups do |t|
      t.integer :group_id
      t.string :img_template
      t.string :template_link
      t.string :css_template_folder
      t.string :folder_template_img

      t.timestamps
    end
  end

  def self.down
    drop_table :template_groups
  end
end
