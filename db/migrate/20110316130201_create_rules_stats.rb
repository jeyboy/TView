class CreateRulesStats < ActiveRecord::Migration
  def self.up
    create_table :rules_stats do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :rules_stats
  end
end
