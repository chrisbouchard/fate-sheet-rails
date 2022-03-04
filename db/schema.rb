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

ActiveRecord::Schema[7.0].define(version: 2021_07_22_034431) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aspects", force: :cascade do |t|
    t.integer "position", null: false
    t.text "name"
    t.text "label"
    t.string "aspected_type", null: false
    t.bigint "aspected_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aspected_id", "position"], name: "index_aspects_on_aspected_id_and_position", unique: true
    t.index ["aspected_type", "aspected_id"], name: "index_aspects_on_aspected"
  end

  create_table "characters", force: :cascade do |t|
    t.text "name", null: false
    t.integer "fate_points", default: 0, null: false
    t.integer "refresh", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "world_id"
    t.text "description"
    t.integer "power_level"
    t.integer "skill_points"
    t.index ["world_id"], name: "index_characters_on_world_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "world_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_memberships_on_user_id"
    t.index ["world_id"], name: "index_memberships_on_world_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "level", null: false
    t.text "name", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "name"], name: "index_skills_on_character_id_and_name", unique: true
    t.index ["character_id"], name: "index_skills_on_character_id"
  end

  create_table "stress_boxes", force: :cascade do |t|
    t.integer "position", null: false
    t.integer "level", null: false
    t.boolean "checked", default: false, null: false
    t.bigint "stress_track_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stress_track_id", "position"], name: "index_stress_boxes_on_stress_track_id_and_position", unique: true
    t.index ["stress_track_id"], name: "index_stress_boxes_on_stress_track_id"
  end

  create_table "stress_tracks", force: :cascade do |t|
    t.integer "position", null: false
    t.string "name", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id", "position"], name: "index_stress_tracks_on_character_id_and_position", unique: true
    t.index ["character_id"], name: "index_stress_tracks_on_character_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "auth0_id"
    t.index ["auth0_id"], name: "index_users_on_auth0_id", unique: true
  end

  create_table "worlds", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "characters", "worlds"
  add_foreign_key "memberships", "users"
  add_foreign_key "memberships", "worlds"
  add_foreign_key "skills", "characters"
  add_foreign_key "stress_boxes", "stress_tracks"
  add_foreign_key "stress_tracks", "characters"
end
