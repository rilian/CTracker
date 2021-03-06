# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130731153920) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "countries", ["code"], :name => "index_countries_on_code"
  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "currencies", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "country_id"
    t.string   "country_code"
  end

  add_index "currencies", ["code"], :name => "index_currencies_on_code"
  add_index "currencies", ["country_code"], :name => "index_currencies_on_country_code"
  add_index "currencies", ["country_id"], :name => "index_currencies_on_country_id"
  add_index "currencies", ["name"], :name => "index_currencies_on_name"

  create_table "user_countries", :id => false, :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "country_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_countries", ["user_id", "country_id"], :name => "index_user_countries_on_user_id_and_country_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",               :default => "",    :null => false
    t.string   "encrypted_password",  :default => "",    :null => false
    t.datetime "remember_created_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "is_admin",            :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
