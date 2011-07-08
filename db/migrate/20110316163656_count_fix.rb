class CountFix < ActiveRecord::Migration
  def self.up
   remove_column :userstats, :view_templates_count
    remove_column :userstats, :download_templates_count
   add_column :userstats, :viewtemplates_count, :integer, :default => 0
    add_column :userstats, :downloadtemplates_count, :integer, :default => 0
  end

  def self.down
    add_column :userstats, :view_templates_count, :integer, :default => 0
    add_column :userstats, :download_templates_count, :integer, :default => 0
    remove_column :userstats, :viewtemplates_count
    remove_column :userstats, :downloadtemplates_count
  end
end
