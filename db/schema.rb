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

ActiveRecord::Schema.define(version: 20140922001500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.string   "title"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag_prefix"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "github_username"
    t.string   "github_repo"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.datetime "last_sync"
  end

  add_index "students", ["slug"], name: "index_students_on_slug", unique: true, using: :btree

  create_table "submissions", force: true do |t|
    t.string   "tag"
    t.integer  "assignment_id"
    t.integer  "student_id"
    t.integer  "status",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "feedback"
  end

  add_index "submissions", ["assignment_id"], name: "index_submissions_on_assignment_id", using: :btree
  add_index "submissions", ["student_id"], name: "index_submissions_on_student_id", using: :btree

end
