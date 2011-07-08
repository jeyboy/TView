class CleaningUp < ActiveRecord::Migration
  def self.up
  remove_column :rules_stats, :created_at
  remove_column :rules_stats, :updated_at
  remove_column :view_templates, :created_at
  remove_column :view_templates, :updated_at
  remove_column :download_templates, :created_at
  remove_column :download_templates, :updated_at
  end

  def self.down
    create_column :rules_stats, :created_at, :timestamps
    create_column :rules_stats, :updated_at, :timestamps
    create_column :view_templates, :created_at, :timestamps
    create_column :view_templates, :updated_at, :timestamps
    create_column :download_templates, :created_at, :timestamps
    create_column :download_templates, :updated_at, :timestamps
  end
end
