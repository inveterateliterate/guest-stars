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

ActiveRecord::Schema.define(version: 20170110234333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearances", force: :cascade do |t|
    t.integer  "guest_star_id"
    t.integer  "series_id"
    t.string   "character"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["guest_star_id"], name: "index_appearances_on_guest_star_id", using: :btree
    t.index ["series_id"], name: "index_appearances_on_series_id", using: :btree
  end

  create_table "episodes", force: :cascade do |t|
    t.string   "name"
    t.integer  "series_id"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_episodes_on_series_id", using: :btree
  end

  create_table "guest_stars", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "series", force: :cascade do |t|
    t.string   "series_name"
    t.string   "genre"
    t.text     "summary"
    t.string   "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "appearances", "guest_stars"
  add_foreign_key "appearances", "series"
  add_foreign_key "episodes", "series"
end
