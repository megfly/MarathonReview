# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_08_222229) do

  create_table "reviews", force: :cascade do |t|
    t.integer "run_id"
    t.integer "user_id"
    t.string "title"
    t.string "review_race_name"
    t.text "description"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["run_id"], name: "index_reviews_on_run_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "runs", force: :cascade do |t|
    t.string "run_race_name"
    t.string "terrain"
    t.string "location_city"
    t.string "location_state"
    t.string "month"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
    t.string "uid"
    t.string "provider"
  end

  add_foreign_key "runs", "users"
end
