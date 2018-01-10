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

ActiveRecord::Schema.define(version: 20180107133210) do

  create_table "batches", force: true do |t|
    t.string  "name",               limit: 50
    t.date    "brew_date"
    t.date    "bottle_date"
    t.float   "og"
    t.float   "fg"
    t.float   "ibu"
    t.float   "srm"
    t.float   "volume"
    t.integer "bottles"
    t.string  "bottle_conditioned", limit: 3,   default: "no"
    t.string  "notes",              limit: 250
    t.string  "description",        limit: 250
    t.string  "awards",             limit: 250
    t.string  "ontap",              limit: 11,  default: "no"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
