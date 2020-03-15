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

ActiveRecord::Schema.define(version: 2016_12_31_065937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diets", id: :serial, force: :cascade do |t|
    t.string "title", limit: 50
    t.text "description"
    t.string "schedule"
    t.date "start"
    t.date "finish"
    t.string "period"
    t.float "height"
    t.float "weight"
    t.float "target_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "points", id: :serial, force: :cascade do |t|
    t.string "title", limit: 50
    t.date "schedule"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "diet_id"
    t.index ["diet_id"], name: "index_points_on_diet_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 50
    t.string "email", limit: 150
    t.string "password", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "diets", "users"
  add_foreign_key "points", "diets"
end
