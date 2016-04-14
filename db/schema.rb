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

ActiveRecord::Schema.define(version: 20160414112228) do

  create_table "carriages", force: :cascade do |t|
    t.integer  "number"
    t.integer  "top_places"
    t.integer  "bottom_places"
    t.integer  "side_top_places"
    t.integer  "side_bottom_places"
    t.integer  "train_id"
    t.string   "type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "position"
    t.time    "arrival_time"
    t.time    "departure_time"
  end

  add_index "railway_stations_routes", ["position"], name: "index_railway_stations_routes_on_position"

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "train_id"
    t.integer  "start_station_id"
    t.integer  "end_station_id"
    t.integer  "user_id"
    t.string   "fio"
    t.string   "passport"
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "sorting_wagons",     default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wagons", force: :cascade do |t|
    t.string   "wagon_type"
    t.integer  "top_places"
    t.integer  "bottom_places"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "train_id"
    t.string   "type"
    t.integer  "sedentary_places"
    t.integer  "side_bottom_places"
    t.integer  "side_top_places"
    t.integer  "number"
  end

  add_index "wagons", ["number"], name: "index_wagons_on_number"
  add_index "wagons", ["type"], name: "index_wagons_on_type"

end
