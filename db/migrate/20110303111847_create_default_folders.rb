class CreateDefaultFolders < ActiveRecord::Migration
  def self.up
    create_table :default_folders do |t|
      t.integer :group_id
      t.string :folder_default

      t.timestamps
    end
  end

  def self.down
    drop_table :default_folders
  end
end
