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

ActiveRecord::Schema.define(version: 2019_12_13_094520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "user_id"
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_chats_on_match_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.string "favorable_type"
    t.bigint "favorable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "to_user_id"
    t.index ["favorable_id", "favorable_type", "user_id"], name: "index_favorites_on_favorable_id_and_favorable_type_and_user_id", unique: true
    t.index ["favorable_type", "favorable_id"], name: "index_favorites_on_favorable_type_and_favorable_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "match_requests", force: :cascade do |t|
    t.bigint "from_user_id", null: false
    t.bigint "to_user_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_user_id"], name: "index_match_requests_on_from_user_id"
    t.index ["to_user_id"], name: "index_match_requests_on_to_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "match_request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_request_id"], name: "index_matches_on_match_request_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "from_user_id"
    t.bigint "to_user_id"
    t.string "notificable_type"
    t.bigint "notificable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificable_id", "notificable_type"], name: "index_notifications_on_notificable_id_and_notificable_type", unique: true
    t.index ["notificable_type", "notificable_id"], name: "index_notifications_on_notificable_type_and_notificable_id"
    t.index ["to_user_id"], name: "index_notifications_on_to_user_id"
  end

  create_table "user_blocks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "blocking_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_blocks_on_user_id"
  end

  create_table "user_images", force: :cascade do |t|
    t.bigint "user_id"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_images_on_user_id"
  end

  create_table "user_reports", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "report_user_id"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_reports_on_user_id"
  end

  create_table "user_requests", force: :cascade do |t|
    t.bigint "from_user_id"
    t.bigint "to_user_id_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["to_user_id_id"], name: "index_user_requests_on_to_user_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "birthday"
    t.string "origin"
    t.string "intro"
    t.string "job"
    t.integer "income"
    t.string "height"
    t.string "bio"
    t.string "token"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chats", "matches"
  add_foreign_key "chats", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "match_requests", "users", column: "from_user_id"
  add_foreign_key "match_requests", "users", column: "to_user_id"
  add_foreign_key "matches", "match_requests"
  add_foreign_key "notifications", "users", column: "to_user_id"
  add_foreign_key "user_blocks", "users"
  add_foreign_key "user_images", "users"
  add_foreign_key "user_reports", "users"
  add_foreign_key "user_requests", "users", column: "to_user_id_id"
end
