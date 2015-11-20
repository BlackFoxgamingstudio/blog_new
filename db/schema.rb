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

ActiveRecord::Schema.define(version: 20150708200826) do

  
  create_table "idea_ingredients", force: true do |t|
    t.integer "ingredient_id"
    t.integer "idea_id"
  end

  create_table "idea_solutions", force: true do |t|
    t.integer "solution_id"
    t.integer "idea_id"
  end

  create_table "idea_styles", force: true do |t|
    t.integer "style_id"
    t.integer "idea_id"
  end

  create_table "idea_verticals", force: true do |t|
    t.integer "vertical_id"
    t.integer "idea_id"
  end

  create_table "ideas", force: true do |t|
    t.string   "name",        limit: nil
    t.text     "summary"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "marketer_id"
    t.string   "picture",     limit: nil
  end

  create_table "verticals", force: true do |t|
    t.string "name", limit: nil
  end

  create_table "likes", force: true do |t|
    t.boolean  "like"
    t.integer  "marketer_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marketers", force: true do |t|
    t.string   "marketername",    limit: nil
    t.string   "email",           limit: nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: nil
    t.boolean  "admin",                       default: false
  end

  create_table "method_soutions", force: true do |t|
    t.integer "solution_id"
    t.integer "idea_id"
  end

  create_table "methods", force: true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.text     "body"
    t.integer  "marketer_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", force: true do |t|
    t.string "name", limit: nil
  end

  create_table "styles", force: true do |t|
    t.string "name", limit: nil
  end

  create_table "verticals", force: true do |t|
    t.string "name", limit: nil
  end

end
