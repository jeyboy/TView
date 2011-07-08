class UserstatUpdate < ActiveRecord::Migration
  def self.up
  add_column :userstats, :total_template_viewed, :integer
  add_column :userstats, :total_template_downloaded, :integer
  end

  def self.down
  remove_column :userstats, :total_template_downloaded
  remove_column :userstats, :total_template_viewed
  end
end
