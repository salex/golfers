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

ActiveRecord::Schema[7.1].define(version: 2024_05_03_134907) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.date "date"
    t.string "status"
    t.string "method"
    t.text "formed"
    t.text "par3"
    t.text "skins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_games_on_group_id"
  end

  create_table "golfers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "tees"
    t.text "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "courses"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.boolean "use_nickname"
    t.string "name"
    t.string "tee"
    t.integer "quota"
    t.float "rquota"
    t.string "phone"
    t.boolean "is_frozen"
    t.date "last_played"
    t.integer "pin"
    t.string "limited"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_players_on_group_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.string "type"
    t.date "date"
    t.integer "team"
    t.string "tee"
    t.integer "quota"
    t.integer "front"
    t.integer "back"
    t.integer "total"
    t.float "quality"
    t.float "skins"
    t.float "par3"
    t.float "other"
    t.string "limited"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
    t.index ["player_id"], name: "index_rounds_on_player_id"
  end

  create_table "stashes", force: :cascade do |t|
    t.string "stashable_type"
    t.bigint "stashable_id"
    t.string "type"
    t.bigint "ref_id"
    t.string "title"
    t.string "content"
    t.string "slim"
    t.text "hash_data"
    t.text "text_data"
    t.date "date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "due_date"
    t.string "remarks"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.string "fullname"
    t.string "username"
    t.string "email"
    t.string "role"
    t.text "permits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  add_foreign_key "games", "groups"
  add_foreign_key "players", "groups"
  add_foreign_key "rounds", "games"
  add_foreign_key "rounds", "players"
  add_foreign_key "users", "groups"
end
