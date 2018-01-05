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

ActiveRecord::Schema.define(version: 20180104205116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "participant_id"
    t.boolean "timeslot1"
    t.boolean "timeslot2"
    t.boolean "timeslot3"
    t.integer "query_state"
    t.integer "invitation_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_attendances_on_participant_id"
    t.index ["task_id"], name: "index_attendances_on_task_id"
  end

  create_table "kitchens", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "firstname"
    t.string "lastname"
    t.date "birthday"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.string "password_digest"
    t.bigint "role_id"
    t.string "firebase_token"
    t.index ["role_id"], name: "index_participants_on_role_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "kitchen_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kitchen_id"], name: "index_preferences_on_kitchen_id"
    t.index ["participant_id"], name: "index_preferences_on_participant_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_requirements", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "role_id"
    t.integer "number"
    t.integer "timeslot1_acceptance", default: 0
    t.integer "timeslot2_acceptance", default: 0
    t.integer "timeslot3_acceptance", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_task_requirements_on_role_id"
    t.index ["task_id"], name: "index_task_requirements_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.string "description"
    t.string "incentive"
    t.datetime "timeslot1"
    t.datetime "timeslot2"
    t.datetime "timeslot3"
    t.datetime "survey_start"
    t.datetime "survey_end"
    t.integer "survey_state"
    t.integer "algorithm"
    t.integer "current_level", default: 5
    t.integer "winning_timeslot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "kitchen_id"
    t.index ["kitchen_id"], name: "index_tasks_on_kitchen_id"
  end

  add_foreign_key "attendances", "participants"
  add_foreign_key "attendances", "tasks"
  add_foreign_key "participants", "roles"
  add_foreign_key "preferences", "kitchens"
  add_foreign_key "preferences", "participants"
  add_foreign_key "tasks", "kitchens"
end
