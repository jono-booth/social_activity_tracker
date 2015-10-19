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

ActiveRecord::Schema.define(version: 20151019124709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pages", force: true do |t|
    t.string   "url"
    t.string   "uuid"
    t.integer  "score",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_activities", force: true do |t|
    t.integer  "value",        default: 0
    t.string   "user_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.integer  "weighting_id"
  end

  add_index "social_activities", ["page_id"], name: "index_social_activities_on_page_id", using: :btree
  add_index "social_activities", ["weighting_id"], name: "index_social_activities_on_weighting_id", using: :btree

  create_table "weightings", force: true do |t|
    t.string   "network"
    t.string   "field"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
