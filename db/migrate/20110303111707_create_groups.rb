class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :tag
      t.string :img_url
      t.string :name_project
      t.string :dir_project

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
