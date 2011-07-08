# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110316163656) do

  create_table "auths", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string   "password_salt",                      :default => "", :null => false
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "auths", ["email"], :name => "index_auths_on_email", :unique => true

  create_table "download_templates", :force => true do |t|
    t.integer "userstat_id"
    t.integer "download_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "tag"
    t.string   "img_url"
    t.string   "name_project"
    t.string   "dir_project"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "other_htmls", :force => true do |t|
    t.string   "f_name"
    t.string   "prev_img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "template_group_id"
  end

  create_table "rules_stats", :force => true do |t|
    t.string "name"
  end

  create_table "template_groups", :force => true do |t|
    t.integer  "group_id"
    t.string   "img_template"
    t.string   "template_link"
    t.string   "folder_template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userstats", :force => true do |t|
    t.string   "went_from"
    t.string   "browser"
    t.string   "user_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "viewtemplates_count",     :default => 0
    t.integer  "downloadtemplates_count", :default => 0
  end

  create_table "view_templates", :force => true do |t|
    t.integer "userstat_id"
    t.integer "viewed_id"
  end

end
