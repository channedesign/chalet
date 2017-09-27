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

ActiveRecord::Schema.define(version: 20170927093025) do

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
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "visible",     default: false
    t.integer  "position"
    t.text     "description"
  end

  add_index "appartments", ["house_id"], name: "index_appartments_on_house_id", using: :btree

  create_table "floor_plans", force: :cascade do |t|
    t.integer  "house_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "floor_plan_image_file_name"
    t.string   "floor_plan_image_content_type"
    t.integer  "floor_plan_image_file_size"
    t.datetime "floor_plan_image_updated_at"
  end

  add_index "floor_plans", ["house_id"], name: "index_floor_plans_on_house_id", using: :btree

  create_table "houses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "position"
    t.string   "url"
    t.text     "property_fact"
    t.text     "property_feature"
  end

  create_table "months", force: :cascade do |t|
    t.string   "name"
    t.integer  "appartment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "position"
  end

  add_index "months", ["appartment_id"], name: "index_months_on_appartment_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.integer  "house_id"
    t.integer  "position"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "chalet_picture_file_name"
    t.string   "chalet_picture_content_type"
    t.integer  "chalet_picture_file_size"
    t.datetime "chalet_picture_updated_at"
  end

  add_index "pictures", ["house_id"], name: "index_pictures_on_house_id", using: :btree

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

  create_table "weeks", force: :cascade do |t|
    t.integer  "month_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "from"
    t.date     "to"
    t.integer  "position"
    t.string   "self_catered"
    t.string   "weekend"
  end

  add_index "weeks", ["month_id"], name: "index_weeks_on_month_id", using: :btree

  add_foreign_key "appartments", "houses"
  add_foreign_key "floor_plans", "houses"
  add_foreign_key "months", "appartments"
  add_foreign_key "pictures", "houses"
  add_foreign_key "weeks", "months"
end
