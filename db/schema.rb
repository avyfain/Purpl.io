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

ActiveRecord::Schema.define(version: 20140426170419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "text"
    t.integer  "upvotes"
    t.integer  "question_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "professor_id"
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.string   "subject"
    t.string   "catalog_number"
    t.integer  "section"
    t.string   "term"
    t.integer  "professor_id"
    t.text     "readmap"
    t.string   "professor_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_locked_on"
  end

  create_table "courses_students", force: true do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  create_table "professors", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "questions", force: true do |t|
    t.text     "text"
    t.string   "category"
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "readmap"
  end

  create_table "students", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "year"
    t.string   "major"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
  end

  create_table "survey_results", force: true do |t|
    t.string   "classtime"
    t.string   "homework"
    t.string   "midterm"
    t.string   "workload"
    t.string   "material"
    t.string   "pace"
    t.string   "passion"
    t.text     "other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.integer  "course_id"
  end

end
