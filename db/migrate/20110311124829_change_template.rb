class ChangeTemplate < ActiveRecord::Migration
  def self.up
    remove_column :template_groups, :css_template_folder
    rename_column :template_groups, :folder_template_img, :folder_template
  end

  def self.down
    add_column :template_groups, :css_template_folder, :string
    rename_column :template_groups, :folder_template, :folder_template_img
  end
end
