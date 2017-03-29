# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170323031123) do

  create_table "activity_records", force: :cascade do |t|
    t.integer "value",            limit: 4,   default: 0
    t.integer "last_value",       limit: 4,   default: 0
    t.string  "type",             limit: 255
    t.integer "player_record_id", limit: 4
  end

  create_table "badges", force: :cascade do |t|
    t.string   "name",        limit: 255,               null: false
    t.integer  "points",      limit: 4,     default: 0
    t.text     "description", limit: 65535
    t.string   "badge_type",  limit: 255
    t.integer  "project_id",  limit: 4,                 null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "levels", force: :cascade do |t|
    t.integer  "player_id",  limit: 4, null: false
    t.integer  "badge_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "player_ranks", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "type", limit: 255
  end

  create_table "player_records", force: :cascade do |t|
    t.integer  "player_id",  limit: 4, null: false
    t.integer  "project_id", limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "email",          limit: 255, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "promoted_on"
    t.integer  "player_rank_id", limit: 4
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
