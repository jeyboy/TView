class DefaultFolderDel < ActiveRecord::Migration
  def self.up
  drop_table :default_folders
  end

  def self.down
     create_table :default_folders do |t|
      t.integer :group_id
      t.string :folder_default

      t.timestamps
    end
  end
end
