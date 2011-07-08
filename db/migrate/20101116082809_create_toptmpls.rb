class CreateToptmpls < ActiveRecord::Migration
  def self.up
    create_table :toptmpls do |t|
      t.integer :count
      t.string :tmpl

      t.timestamps
    end
  end

  def self.down
    drop_table :toptmpls
  end
end
