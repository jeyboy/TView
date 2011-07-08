class AddIdessionToStat < ActiveRecord::Migration
  def self.up
    add_column :stats, :session_id, :string
  end

  def self.down
    remove_column :stats, :session_id
  end
end
