class AddTagandimageFromAdmin < ActiveRecord::Migration
  def self.up
    add_column :admins, :tagpart, :string
    add_column :admins, :images, :string
  end

  def self.down
    remove_column :admins, :images
    remove_column :admins, :tagpart
  end
end
