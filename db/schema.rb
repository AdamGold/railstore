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

ActiveRecord::Schema.define(:version => 20110426185106) do

  create_table "items", :force => true do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "price"
    t.string   "live_preview"
    t.string   "image_preview"
    t.string   "thumbnail"
    t.string   "download"
    t.string   "gems_included"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_preview_file_name"
    t.string   "image_preview_content_type"
    t.integer  "image_preview_file_size"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.integer  "user_id"
    t.string   "license"
    t.string   "download_file_name"
    t.string   "download_content_type"
    t.integer  "download_file_size"
  end

  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "tags", :force => true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
  end

  add_index "tags", ["item_id"], :name => "index_tags_on_item_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
