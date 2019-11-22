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

ActiveRecord::Schema.define(version: 2019_11_22_075005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "opponent_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
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

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_room_id"
    t.bigint "user_id"
    t.string "text"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
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

  create_table "requests", force: :cascade do |t|
    t.bigint "from_user_id"
    t.bigint "to_user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["to_user_id"], name: "index_requests_on_to_user_id"
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

  add_foreign_key "chat_rooms", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "users", column: "to_user_id"
  add_foreign_key "requests", "users", column: "to_user_id"
  add_foreign_key "user_blocks", "users"
  add_foreign_key "user_images", "users"
  add_foreign_key "user_reports", "users"
end
