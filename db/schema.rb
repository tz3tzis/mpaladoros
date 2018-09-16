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

ActiveRecord::Schema.define(version: 20180916102302) do

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
    t.string "awayteam_name"
    t.string "hometeam_name"
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
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
