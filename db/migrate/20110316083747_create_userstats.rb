class CreateUserstats < ActiveRecord::Migration
  def self.up
    create_table :userstats do |t|
      t.string :went_from
      t.string :browser
      t.string :user_ip

      t.timestamps
    end
  end

  def self.down
    drop_table :userstats
  end
end
