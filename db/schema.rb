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

ActiveRecord::Schema.define(version: 20170416102947) do

  create_table "blood_availabilities", force: :cascade do |t|
    t.integer  "blood_bank_id"
    t.integer  "blood_group_id"
    t.integer  "total_stocks"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "component_type_id"
  end

  create_table "blood_banks", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "locality_id"
    t.integer  "district_id"
    t.integer  "state_id"
    t.string   "email"
    t.string   "mobile"
    t.string   "landline_number"
    t.string   "manager"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.string   "cover"
  end

  create_table "blood_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "email"
    t.string   "state_id"
    t.string   "district_id"
    t.string   "locality_id"
    t.string   "user_id"
    t.string   "units"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "component_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donars", force: :cascade do |t|
    t.integer  "person_detail_id"
    t.integer  "blood_bank_id"
    t.integer  "blood_group_id"
    t.string   "units"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "localities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_details", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile_no"
    t.integer  "state_id"
    t.integer  "district_id"
    t.integer  "locality_id"
    t.string   "blood_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "blood_bank_id"
    t.integer  "blood_group_id"
    t.string   "units"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.integer  "component_type_id"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
