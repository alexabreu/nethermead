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

ActiveRecord::Schema.define(version: 20140328013121) do

  create_table "companies", force: true do |t|
    t.string   "name_upper"
    t.string   "name_proper"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "companies", ["slug"], name: "index_companies_on_slug"

  create_table "counties", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "size",       limit: 8
    t.string   "intptlat"
    t.string   "intptlon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
  end

  add_index "counties", ["state_id"], name: "index_counties_on_state_id"

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
    t.string   "communication_preference"
  end

  add_index "search_results", ["company_id"], name: "index_search_results_on_company_id"
  add_index "search_results", ["product_class_id"], name: "index_search_results_on_product_class_id"
  add_index "search_results", ["state_id"], name: "index_search_results_on_state_id"

  create_table "search_results_competitors", force: true do |t|
    t.string   "company_name"
    t.string   "display_name"
    t.integer  "rank_order"
    t.decimal  "market_share"
    t.integer  "reportyear"
    t.datetime "reportdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "product_class_id"
    t.integer  "state_id"
  end

  add_index "search_results_competitors", ["company_id"], name: "index_search_results_competitors_on_company_id"
  add_index "search_results_competitors", ["product_class_id"], name: "index_search_results_competitors_on_product_class_id"
  add_index "search_results_competitors", ["state_id"], name: "index_search_results_competitors_on_state_id"

  create_table "search_results_counties", force: true do |t|
    t.string   "county_name"
    t.string   "company_name"
    t.integer  "num_enrolled",           limit: 8
    t.integer  "num_subscribers",        limit: 8
    t.decimal  "subscriber_pct"
    t.integer  "total_market",           limit: 8
    t.integer  "available_market",       limit: 8
    t.integer  "num_insured",            limit: 8
    t.decimal  "market_penetration"
    t.decimal  "enrolled_pct"
    t.integer  "num_pcp",                limit: 8
    t.decimal  "pcp_pct"
    t.integer  "num_specialists",        limit: 8
    t.decimal  "specialists_pct"
    t.integer  "num_facilities",         limit: 8
    t.decimal  "facilities_pct"
    t.integer  "company_rank"
    t.integer  "county_rank"
    t.integer  "num_plans"
    t.integer  "num_plan_types"
    t.integer  "competition_index",      limit: 8
    t.string   "competition_status"
    t.integer  "pricing_pos"
    t.integer  "benefit_loss_pos"
    t.integer  "enrollment_pos"
    t.integer  "revenue_pos"
    t.integer  "media_availability_pos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "county_id"
    t.integer  "company_id"
    t.integer  "product_class_id"
    t.integer  "state_id"
    t.integer  "search_result_id"
  end

  add_index "search_results_counties", ["company_id"], name: "index_search_results_counties_on_company_id"
  add_index "search_results_counties", ["county_id"], name: "index_search_results_counties_on_county_id"
  add_index "search_results_counties", ["product_class_id"], name: "index_search_results_counties_on_product_class_id"
  add_index "search_results_counties", ["search_result_id"], name: "index_search_results_counties_on_search_result_id"
  add_index "search_results_counties", ["state_id"], name: "index_search_results_counties_on_state_id"

  create_table "search_results_counties_competitors", force: true do |t|
    t.string   "company_name"
    t.string   "county_name"
    t.string   "display_name"
    t.string   "state_name"
    t.string   "product_class_name"
    t.integer  "rank_order"
    t.decimal  "market_share"
    t.integer  "reportyear"
    t.datetime "reportdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "product_class_id"
    t.integer  "state_id"
    t.integer  "search_results_counties_id"
  end

  create_table "search_results_counties_segments", force: true do |t|
    t.string   "county_name"
    t.string   "company_name"
    t.string   "product_class_name"
    t.string   "state_name"
    t.string   "segment_name"
    t.integer  "size_num",           limit: 8
    t.decimal  "size_pct"
    t.integer  "rank_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "segment_id"
    t.integer  "product_class_id"
    t.integer  "state_id"
    t.integer  "company_id"
    t.integer  "search_result_id"
  end

  add_index "search_results_counties_segments", ["company_id"], name: "index_search_results_counties_segments_on_company_id"
  add_index "search_results_counties_segments", ["product_class_id"], name: "index_search_results_counties_segments_on_product_class_id"
  add_index "search_results_counties_segments", ["search_result_id"], name: "index_search_results_counties_segments_on_search_result_id"
  add_index "search_results_counties_segments", ["segment_id"], name: "index_search_results_counties_segments_on_segment_id"
  add_index "search_results_counties_segments", ["state_id"], name: "index_search_results_counties_segments_on_state_id"

  create_table "search_results_segments", force: true do |t|
    t.integer  "size_num",         limit: 8
    t.decimal  "size_pct"
    t.integer  "rank_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "segment_id"
    t.integer  "product_class_id"
    t.integer  "state_id"
  end

  add_index "search_results_segments", ["product_class_id"], name: "index_search_results_segments_on_product_class_id"
  add_index "search_results_segments", ["segment_id"], name: "index_search_results_segments_on_segment_id"
  add_index "search_results_segments", ["state_id"], name: "index_search_results_segments_on_state_id"

  create_table "search_results_segments_communications", force: true do |t|
    t.string   "segment_name"
    t.string   "segment_type"
    t.string   "communication_preference"
    t.string   "communication_type"
    t.string   "marketing_context"
    t.integer  "preference_rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "segment_id"
    t.integer  "search_results_segment_id"
  end

  create_table "segments", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "src_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
