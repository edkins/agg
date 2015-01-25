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

ActiveRecord::Schema.define(version: 20150125195648) do

  create_table "articles", force: :cascade do |t|
    t.string   "username"
    t.integer  "website_id"
    t.date     "date"
    t.text     "headline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["website_id"], name: "index_articles_on_website_id"

  create_table "bulletins", force: :cascade do |t|
    t.date     "date"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "article_id"
    t.date     "date"
    t.string   "username"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"

  create_table "fb_comments", force: :cascade do |t|
    t.string   "fb_nodeid"
    t.integer  "fb_user_id"
    t.text     "text"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "fb_threads_id"
    t.integer  "like_count"
    t.integer  "fb_thread_id"
  end

  add_index "fb_comments", ["fb_thread_id"], name: "index_fb_comments_on_fb_thread_id"
  add_index "fb_comments", ["fb_threads_id"], name: "index_fb_comments_on_fb_threads_id"
  add_index "fb_comments", ["fb_user_id"], name: "index_fb_comments_on_fb_user_id"

  create_table "fb_groups", force: :cascade do |t|
    t.text     "fb_node_id"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "group_handle"
  end

  create_table "fb_threads", force: :cascade do |t|
    t.string   "fb_node_id"
    t.text     "text"
    t.date     "date"
    t.integer  "like_count"
    t.integer  "fb_group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "fb_user_id"
  end

  add_index "fb_threads", ["fb_group_id"], name: "index_fb_threads_on_fb_group_id"
  add_index "fb_threads", ["fb_user_id"], name: "index_fb_threads_on_fb_user_id"

  create_table "fb_users", force: :cascade do |t|
    t.string   "fb_node_id"
    t.string   "name"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fb_users", ["person_id"], name: "index_fb_users_on_person_id"

  create_table "feeds", force: :cascade do |t|
    t.integer  "website_id"
    t.string   "feedname"
    t.string   "feedid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feeds", ["website_id"], name: "index_feeds_on_website_id"

  create_table "people", force: :cascade do |t|
    t.string   "handle"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usernames", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "website_id"
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "usernames", ["person_id"], name: "index_usernames_on_person_id"
  add_index "usernames", ["website_id"], name: "index_usernames_on_website_id"

  create_table "websites", force: :cascade do |t|
    t.string   "websiteid"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
