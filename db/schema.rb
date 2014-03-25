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

ActiveRecord::Schema.define(version: 20140325043216) do

  create_table "companies", force: true do |t|
    t.string   "name_upper"
    t.string   "name_proper"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "companies", ["slug"], name: "index_companies_on_slug"

  create_table "interested_users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_classes", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "img_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_results", force: true do |t|
    t.string   "company_name"
    t.string   "state_name"
    t.string   "product_class"
    t.integer  "reportyear"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "product_class_id"
    t.integer  "state_id"
    t.integer  "state_enrolled"
    t.integer  "state_parent_enrolled"
    t.float    "share_company_in_state"
    t.integer  "num_active_competitors"
    t.datetime "reportdate"
    t.integer  "share_parent_in_state_rank"
    t.integer  "available_market"
    t.integer  "total_market"
    t.text     "competition_status"
    t.float    "share_parent_in_state_ss"
    t.integer  "num_similar_plans"
    t.integer  "num_op_county"
  end

  add_index "search_results", ["company_id"], name: "index_search_results_on_company_id"
  add_index "search_results", ["product_class_id"], name: "index_search_results_on_product_class_id"
  add_index "search_results", ["state_id"], name: "index_search_results_on_state_id"

  create_table "states", force: true do |t|
    t.string   "state_name"
    t.string   "state_full_name"
    t.integer  "state_size"
    t.string   "intptlat"
    t.string   "intptlon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
