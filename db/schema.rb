# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_12_19_105325) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "year_published"
    t.text "summary"
    t.string "genre"
    t.string "author"
    t.integer "page_count"
    t.float "overall_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_url"
    t.string "key"
  end

  create_table "reading_lists", force: :cascade do |t|
    t.boolean "active", default: true
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
    t.index ["book_id"], name: "index_reading_lists_on_book_id"
    t.index ["user_id"], name: "index_reading_lists_on_user_id"
  end

  create_table "reading_sessions", force: :cascade do |t|
    t.integer "duration"
    t.bigint "tracker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "session_start"
    t.datetime "session_end"
    t.boolean "active", default: true
    t.integer "page_count", default: 0
    t.index ["tracker_id"], name: "index_reading_sessions_on_tracker_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.float "rating"
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "trackers", force: :cascade do |t|
    t.integer "current_page", default: 0
    t.integer "total_minutes_spent", default: 0
    t.string "reading_status", default: "Started tracking"
    t.bigint "reading_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_list_id"], name: "index_trackers_on_reading_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reading_lists", "books"
  add_foreign_key "reading_lists", "users"
  add_foreign_key "reading_sessions", "trackers"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
  add_foreign_key "trackers", "reading_lists"
end
