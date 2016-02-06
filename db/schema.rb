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

ActiveRecord::Schema.define(version: 20160206071358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "attendee_id"
    t.string   "remark"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attendances", ["attendee_id"], name: "index_attendances_on_attendee_id", using: :btree
  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id", using: :btree

  create_table "attendees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_no"
    t.string   "email"
    t.integer  "age"
    t.string   "photo_url"
    t.string   "category"
    t.string   "group"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "gender"
    t.string   "remark"
    t.integer  "attendances_count",  default: 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.string   "venue"
    t.string   "category"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "attendances_count", default: 0
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "author"
    t.string   "group"
    t.string   "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reports", ["event_id"], name: "index_reports_on_event_id", using: :btree

  add_foreign_key "attendances", "attendees"
  add_foreign_key "attendances", "events"
  add_foreign_key "reports", "events"
end
