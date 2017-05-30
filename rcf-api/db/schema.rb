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

ActiveRecord::Schema.define(version: 20170530204400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boroughs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.string "complaint_type"
    t.datetime "time_of_complaint"
    t.float "latitude"
    t.float "longitude"
    t.bigint "zip_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zip_code_id"], name: "index_complaints_on_zip_code_id"
  end

  create_table "zip_codes", force: :cascade do |t|
    t.integer "number"
    t.bigint "borough_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borough_id"], name: "index_zip_codes_on_borough_id"
  end

  add_foreign_key "complaints", "zip_codes"
  add_foreign_key "zip_codes", "boroughs"
end