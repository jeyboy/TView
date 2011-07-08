class CreateViewTemplates < ActiveRecord::Migration
  def self.up
    create_table :view_templates do |t|
      t.integer :userstat_id
      t.integer :viewed_id

      t.timestamps
    end
  end

  def self.down
    drop_table :view_templates
  end
end
