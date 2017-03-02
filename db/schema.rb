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
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 20170302211658) do


  create_table "locations", force: :cascade do |t|
    t.string   "city",       limit: 128
    t.string   "state",      limit: 2
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end


  create_table "new_orders", force: :cascade do |t|
    t.string   "sauce_name"
    t.integer  "quantity"
    t.string   "destination"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sauce_orders", force: :cascade do |t|
    t.integer  "sauce_id"
    t.integer  "newOrder_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["newOrder_id"], name: "index_sauce_orders_on_newOrder_id"
    t.index ["sauce_id"], name: "index_sauce_orders_on_sauce_id"
  end

  create_table "sauces", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "origin_id"
    t.text     "ingredients"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_sauces_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name_first"
    t.string   "name_last"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
