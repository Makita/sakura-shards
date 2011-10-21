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

ActiveRecord::Schema.define(:version => 20111021210359) do

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.string   "author"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "announcement_id"
  end

  create_table "japanese_titles", :force => true do |t|
    t.string   "eng_title"
    t.string   "jp_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "japanese_versions", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "author"
    t.integer  "announcements_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "light_novels", :force => true do |t|
    t.string   "name"
    t.integer  "volume"
    t.integer  "chapter"
    t.string   "title"
    t.string   "japanese_title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "name"
    t.integer  "volume"
    t.integer  "chapter"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
