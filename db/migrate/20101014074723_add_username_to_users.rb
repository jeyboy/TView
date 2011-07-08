class AddUsernameToUsers < ActiveRecord::Migration
  def self.up
    add_column :auths, :username, :string
  end

  def self.down
    remove_column :auths, :username
  end
end
