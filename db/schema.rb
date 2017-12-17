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

ActiveRecord::Schema.define(version: 20171117111130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_attendances_on_participant_id"
    t.index ["task_id"], name: "index_attendances_on_task_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "firstname"
    t.string "lastname"
    t.date "birthday"
    t.integer "gender"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.string "password_digest"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "address"
    t.string "description"
    t.string "incentive"
    t.boolean "timeslot1"
    t.boolean "timeslot2"
    t.boolean "timeslot3"
    t.integer "participantslot1"
    t.integer "participantslot2"
    t.integer "participantslot3"
    t.datetime "survey_start"
    t.datetime "survey_end"
    t.integer "survey_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendances", "participants"
  add_foreign_key "attendances", "tasks"
end
