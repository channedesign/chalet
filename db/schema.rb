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

ActiveRecord::Schema.define(version: 20160930115024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end
