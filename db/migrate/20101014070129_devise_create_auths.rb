class DeviseCreateAuths < ActiveRecord::Migration
  def self.up
    create_table(:auths) do |t|
      t.database_authenticatable :null => false
      #t.recoverable
      t.rememberable
      t.trackable
      #t.username
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :auths, :email,                :unique => true
    #add_index :auths, :password => "root",                :unique => true

    #add_index :auths, :reset_password_token, :unique => true
    # add_index :auths, :confirmation_token,   :unique => true
    # add_index :auths, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :auths
  end
end
