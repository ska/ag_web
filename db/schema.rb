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

ActiveRecord::Schema.define(:version => 20120426214543) do

  create_table "conditions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "houses", :force => true do |t|
    t.string   "titolo"
    t.string   "descrizione"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "town"
    t.string   "postcode"
    t.string   "province"
    t.integer  "total_sqm"
    t.integer  "n_total_room"
    t.integer  "n_bedroom"
    t.integer  "n_bathroom"
    t.integer  "year_of_construction"
    t.integer  "user_id"
    t.integer  "TypeOfContract_id"
    t.integer  "id_Condition"
    t.integer  "id_TypeOfHouse"
    t.integer  "price"
  end

  create_table "images", :force => true do |t|
    t.integer  "house_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "messages", :force => true do |t|
    t.string   "object"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "read",       :default => false
    t.integer  "house_id"
    t.string   "name"
    t.string   "email"
  end

  create_table "searches", :force => true do |t|
    t.integer  "type_of_house_id"
    t.integer  "min_sqm"
    t.integer  "max_sqm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_of_contracts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_of_houses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "enabled",            :default => false
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
