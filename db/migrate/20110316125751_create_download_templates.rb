class CreateDownloadTemplates < ActiveRecord::Migration
  def self.up
    create_table :download_templates do |t|
      t.integer :userstat_id
      t.integer :download_id

      t.timestamps
    end
  end

  def self.down
    drop_table :download_templates
  end
end
