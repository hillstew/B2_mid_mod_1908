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

ActiveRecord::Schema.define(version: 2019_10_19_185135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instructors", force: :cascade do |t|
    t.string "name"
  end

  create_table "student_instructors", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "instructor_id"
    t.index ["instructor_id"], name: "index_student_instructors_on_instructor_id"
    t.index ["student_id"], name: "index_student_instructors_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "cohort"
  end

  add_foreign_key "student_instructors", "instructors"
  add_foreign_key "student_instructors", "students"
end
