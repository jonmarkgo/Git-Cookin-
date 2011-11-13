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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111113034100) do

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "votes_up"
    t.integer  "votes_down"
    t.integer  "servings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "step_ingredients", :force => true do |t|
    t.integer  "parent_id"
    t.float    "quanity"
    t.string   "measurement"
    t.integer  "ingredient_id"
    t.integer  "step_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "recipe_id"
    t.string   "instruction"
    t.integer  "sortnum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
