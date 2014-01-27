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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140127012151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clicks", force: true do |t|
    t.integer  "short_url_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clicks", ["short_url_id"], name: "index_clicks_on_short_url_id", using: :btree

  create_table "short_urls", force: true do |t|
    t.string   "url"
    t.string   "short_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "secret_code"
    t.boolean  "disabled"
    t.integer  "user_id"
  end

  add_index "short_urls", ["secret_code"], name: "index_short_urls_on_secret_code", unique: true, using: :btree
  add_index "short_urls", ["short_code"], name: "index_short_urls_on_short_code", unique: true, using: :btree
  add_index "short_urls", ["url"], name: "index_short_urls_on_url", using: :btree
  add_index "short_urls", ["user_id"], name: "index_short_urls_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
