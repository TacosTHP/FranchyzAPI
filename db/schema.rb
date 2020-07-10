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

ActiveRecord::Schema.define(version: 2020_07_10_101533) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "game_id"
    t.bigint "practice_id"
    t.boolean "confirmed?", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_attendances_on_game_id"
    t.index ["player_id"], name: "index_attendances_on_player_id"
    t.index ["practice_id"], name: "index_attendances_on_practice_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "logo_url"
    t.string "zip_code"
    t.string "address"
    t.string "country"
    t.text "description"
    t.string "city"
    t.date "date_of_creation"
    t.string "league"
    t.string "conference"
    t.string "pool"
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_clubs_on_creator_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.date "birthdate"
    t.date "arrival"
    t.boolean "admin?", default: false
    t.bigint "club_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_coaches_on_club_id"
    t.index ["email"], name: "index_coaches_on_email", unique: true
    t.index ["reset_password_token"], name: "index_coaches_on_reset_password_token", unique: true
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.bigint "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_emergency_contacts_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.text "long_description"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "zip_code"
    t.datetime "starting_date_time"
    t.integer "duration"
    t.integer "home_team_score"
    t.integer "away_team_score"
    t.boolean "canceled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "players", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.date "birthdate"
    t.date "arrival"
    t.boolean "availability?", default: true
    t.integer "height"
    t.integer "weight"
    t.string "gender"
    t.integer "jersey_number"
    t.string "position"
    t.bigint "team_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "title"
    t.text "long_description"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "zip_code"
    t.datetime "starting_date_time"
    t.integer "duration"
    t.boolean "canceled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "title"
    t.bigint "coach_id"
    t.bigint "creator_id"
    t.bigint "club_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_teams_on_club_id"
    t.index ["coach_id"], name: "index_teams_on_coach_id"
    t.index ["creator_id"], name: "index_teams_on_creator_id"
  end

  add_foreign_key "clubs", "coaches", column: "creator_id"
  add_foreign_key "teams", "coaches", column: "creator_id"
end
