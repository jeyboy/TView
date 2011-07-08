class DelUnusfullTable < ActiveRecord::Migration
  def self.up
    drop_table :timers
    drop_table :admins
    drop_table :stats
    drop_table :toptmpls
  end

  def self.down
    create_table :timers do |t|
      t.string :datatimes
      t.timestamps
    end
    create_table :admins do |t|
      t.string   :ht_url
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :tagpart
      t.string   :images
    end
    create_table :stats do |t|
      t.string   :referer
      t.string   :browser
      t.string   :ip
      t.string   :download
      t.string   :viewpage
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :session_id
    end
    create_table :toptmpls do |t|
      t.integer  :count
      t.string   :tmpl
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
