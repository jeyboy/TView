class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.string :referer
      t.string :browser
      t.string :ip
      t.string :download
      t.string :viewpage

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
