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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121113122852) do

  create_table "activities", :force => true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "title"
    t.text     "notes"
    t.boolean  "is_completed"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "calendars", :force => true do |t|
    t.string   "google_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "kind"
    t.string   "etag"
    t.string   "summary"
  end

  add_index "calendars", ["user_id"], :name => "user_id_ix"

  create_table "course_modules", :force => true do |t|
    t.string   "title"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessons", :force => true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "course_module_id"
    t.string   "title"
    t.string   "lesson_type"
    t.string   "groups"
    t.string   "room"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
  end

  add_index "lessons", ["course_module_id"], :name => "index_lessons_on_course_module_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "token"
  end

end
