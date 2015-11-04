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

ActiveRecord::Schema.define(version: 20151104104402) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "post_id",        limit: 4
    t.text     "address_line_1", limit: 65535
    t.text     "address_line_2", limit: 65535
    t.string   "city",           limit: 255
    t.string   "state",          limit: 255
    t.integer  "pincode",        limit: 4
    t.string   "address_type",   limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "addresses", ["city"], name: "index_addresses_on_city", using: :btree
  add_index "addresses", ["state"], name: "index_addresses_on_state", using: :btree

  create_table "collections", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "features", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "plan_collections", id: false, force: :cascade do |t|
    t.integer "plan_id",       limit: 4
    t.integer "collection_id", limit: 4
  end

  create_table "plan_features", id: false, force: :cascade do |t|
    t.integer "plan_id",    limit: 4
    t.integer "feature_id", limit: 4
  end

  create_table "plan_styles", id: false, force: :cascade do |t|
    t.integer "plan_id",  limit: 4
    t.integer "style_id", limit: 4
  end

  create_table "plans", force: :cascade do |t|
    t.string   "plan_number", limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
