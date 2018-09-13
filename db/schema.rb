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

ActiveRecord::Schema.define(version: 20180731134653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "telephone"
    t.string "IBAN"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stadium_name"
    t.string "team_name"
  end

  create_table "players", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.integer "points"
    t.string "mail"
    t.integer "MVP"
    t.string "photos"
    t.float "carma"
    t.string "username"
    t.integer "games_played"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teams_id"
    t.index ["teams_id"], name: "index_players_on_teams_id"
  end

  create_table "stadia", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.integer "open_at"
    t.integer "max_players"
    t.integer "stars"
    t.float "price"
    t.string "stadium_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stadium_id"
    t.string "photos"
    t.bigint "admin_id"
    t.bigint "game_id"
    t.index ["admin_id"], name: "index_stadia_on_admin_id"
    t.index ["game_id"], name: "index_stadia_on_game_id"
    t.index ["stadium_name"], name: "index_stadia_on_stadium_name"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
    t.integer "team_id"
    t.bigint "game_id"
    t.index ["game_id"], name: "index_teams_on_game_id"
  end

  add_foreign_key "players", "teams", column: "teams_id"
  add_foreign_key "stadia", "admins"
  add_foreign_key "stadia", "games"
  add_foreign_key "teams", "games"
end
