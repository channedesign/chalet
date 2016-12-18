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

ActiveRecord::Schema.define(version: 20161218213545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "appartments", force: :cascade do |t|
    t.string   "name"
    t.integer  "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "appartments", ["house_id"], name: "index_appartments_on_house_id", using: :btree

  create_table "houses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.integer  "appartment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "months", ["appartment_id"], name: "index_months_on_appartment_id", using: :btree

  create_table "price_listing_twos", force: :cascade do |t|
    t.string   "month"
    t.string   "week1"
    t.string   "week2"
    t.string   "week3"
    t.string   "week4"
    t.string   "price1week1"
    t.string   "price2week1"
    t.string   "price1week2"
    t.string   "price2week2"
    t.string   "price1week3"
    t.string   "price2week3"
    t.string   "price1week4"
    t.string   "price2week4"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "week5"
    t.string   "price1week5"
    t.string   "price2week5"
  end

  create_table "price_listings", force: :cascade do |t|
    t.string   "month"
    t.string   "week1"
    t.string   "week2"
    t.string   "week3"
    t.string   "week4"
    t.string   "price1week1"
    t.string   "price2week1"
    t.string   "price1week2"
    t.string   "price2week2"
    t.string   "price1week3"
    t.string   "price2week3"
    t.string   "price1week4"
    t.string   "price2week4"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "week5"
    t.string   "price1week5"
    t.string   "price2week5"
  end

  create_table "pricings", force: :cascade do |t|
    t.integer  "week_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.decimal  "self_catered"
    t.decimal  "weekend"
  end

  add_index "pricings", ["week_id"], name: "index_pricings_on_week_id", using: :btree

  create_table "weeks", force: :cascade do |t|
    t.integer  "from"
    t.integer  "to"
    t.integer  "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "weeks", ["month_id"], name: "index_weeks_on_month_id", using: :btree

  add_foreign_key "appartments", "houses"
  add_foreign_key "months", "appartments"
  add_foreign_key "pricings", "weeks"
  add_foreign_key "weeks", "months"
end
