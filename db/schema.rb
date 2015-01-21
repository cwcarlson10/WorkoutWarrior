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

ActiveRecord::Schema.define(version: 20150121164636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trainer_id"
  end

  add_index "athletes", ["trainer_id"], name: "index_athletes_on_trainer_id", using: :btree
  add_index "athletes", ["user_id"], name: "index_athletes_on_user_id", using: :btree

  create_table "athletes_programs", id: false, force: true do |t|
    t.integer "program_id", null: false
    t.integer "athlete_id", null: false
  end

  add_index "athletes_programs", ["athlete_id", "program_id"], name: "index_athletes_programs_on_athlete_id_and_program_id", using: :btree
  add_index "athletes_programs", ["program_id", "athlete_id"], name: "index_athletes_programs_on_program_id_and_athlete_id", using: :btree

  create_table "exercises", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trainer_id"
    t.integer  "athlete_id"
  end

  add_index "programs", ["athlete_id"], name: "index_programs_on_athlete_id", using: :btree
  add_index "programs", ["trainer_id"], name: "index_programs_on_trainer_id", using: :btree

  create_table "routines", force: true do |t|
    t.integer  "sets"
    t.integer  "reps"
    t.text     "instructions"
    t.string   "duration"
    t.integer  "exercise_id"
    t.integer  "program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "routines", ["exercise_id"], name: "index_routines_on_exercise_id", using: :btree
  add_index "routines", ["program_id"], name: "index_routines_on_program_id", using: :btree

  create_table "trainers", force: true do |t|
    t.string   "name"
    t.string   "organization"
    t.string   "certifications"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "trainers", ["user_id"], name: "index_trainers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",                   default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
