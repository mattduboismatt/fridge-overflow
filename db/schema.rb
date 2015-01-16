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

ActiveRecord::Schema.define(version: 20150115221303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id", "question_id"], name: "index_answers_on_user_id_and_question_id", using: :btree
  # second index is the 'composite'.. important for performance
  create_table "questions", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.integer  "visit_count"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "responses", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "responsive_id"
    t.string   "responsive_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["responsive_id", "responsive_type"], name: "index_responses_on_responsive_id_and_responsive_type", using: :btree
  add_index "responses", ["user_id", "responsive_id"], name: "index_responses_on_user_id_and_responsive_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "question_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["question_id", "tag_id"], name: "index_taggings_on_question_id_and_tag_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "slug"
    t.string   "email"
    t.string   "password_digest"
    t.string   "website"
    t.string   "location"
    t.integer  "age"
    t.string   "real_name"
    t.binary   "profile_picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # should index username/email because you are looking up users by these often
  # wherever you have a 'where' clause on an attribute, that attribute should have an index
  # but if using 'name: like... ' index won't work.. unless set up with % at the end

  create_table "votes", force: true do |t|
    t.integer  "vote_value"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id", "votable_id"], name: "index_votes_on_user_id_and_votable_id", using: :btree
  add_index "votes", ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type", using: :btree

end
