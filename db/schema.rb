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

ActiveRecord::Schema.define(version: 20140304025953) do

  create_table "search_results", force: true do |t|
    t.string   "company_name"
    t.string   "state_name"
    t.string   "product_class"
    t.integer  "num_enrollee_in_state"
    t.integer  "num_enrollee_in_state_w_company"
    t.integer  "num_enrollee_in_county"
    t.decimal  "share_company_in_state"
    t.integer  "num_company_in_state"
    t.integer  "num_company_in_county"
    t.integer  "num_company_plan_in_county"
    t.integer  "num_plantype_in_county"
    t.integer  "reportyear"
    t.string   "county"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
