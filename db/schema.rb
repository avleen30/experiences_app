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

ActiveRecord::Schema.define(version: 20170908202050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "cover_img"
    t.string   "start_date"
    t.string   "end_date"
    t.integer  "creator_id"
    t.float    "lng"
    t.float    "lat"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.string   "time"
    t.index ["category_id"], name: "index_events_on_category_id", using: :btree
  end

  create_table "events_users", force: :cascade do |t|
    t.string   "status"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "event_id"
    t.index ["event_id"], name: "index_events_users_on_event_id", using: :btree
    t.index ["user_id"], name: "index_events_users_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "event_id"
    t.index ["event_id"], name: "index_posts_on_event_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "avatar"
    t.date     "dob"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "events", "categories"
  add_foreign_key "events_users", "events"
  add_foreign_key "events_users", "users"
  add_foreign_key "posts", "events"
  add_foreign_key "posts", "users"
end
