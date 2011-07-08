class AddCouters < ActiveRecord::Migration
  def self.up
    remove_column :userstats, :total_template_downloaded
    remove_column :userstats, :total_template_viewed
    add_column :userstats, :view_templates_count, :integer, :default => 0
    add_column :userstats, :download_templates_count, :integer, :default => 0
  end

  def self.down
    add_column :userstats, :total_template_viewed, :integer
    add_column :userstats, :total_template_downloaded, :integer
    remove_column :userstats, :view_templates_count
    remove_column :userstats, :download_templates_count
  end
end
