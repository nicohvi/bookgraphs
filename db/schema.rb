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

ActiveRecord::Schema.define(version: 20140911124843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "title"
    t.integer  "published"
    t.integer  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "graph_id"
    t.integer  "plot_point_id"
  end

  add_index "comments", ["graph_id"], name: "index_comments_on_graph_id", using: :btree
  add_index "comments", ["plot_point_id"], name: "index_comments_on_plot_point_id", using: :btree

  create_table "graphs", force: true do |t|
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "svg"
  end

  create_table "plot_points", force: true do |t|
    t.string   "name"
    t.integer  "page"
    t.text     "description"
    t.integer  "graph_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "x"
    t.integer  "y"
  end

end
